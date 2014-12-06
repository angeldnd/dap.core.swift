//
//  Entity.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public protocol EntityWatcher : class {
    func onEntityAspectAdded(entity: Entity, aspect: Aspect)
    func onEntityAspectRemoved(entity: Entity, aspect: Aspect)
}

public class Entity : DapObject {
    public var separator: String { return "." }
   
    private var _aspects = [String: Aspect]()
    private var _watchers = [EntityWatcher]()
    
    public override func encode() -> Data? {
        if let data = super.encode() {
            var aspectsData = Data()
            for (key, aspect) in _aspects {
                if let aspectData = encodeAspect(aspect) {
                    aspectsData.setData(key, value: aspectData)
                }
            }
            if data.setData(DapObject.Consts.KeyAspects, value: aspectsData) {
                return data
            }
        }
        return nil
    }
    
    public override func decode(data: Data) -> Bool {
        if !super.decode(data) { return false }
        
        if let aspectsData = data.getData(DapObject.Consts.KeyAspects) {
            for path in aspectsData.getKeys() {
                if let aspectData = aspectsData.getData(path) {
                    if let aspect = getAspect(path) {
                        decodeAspect(aspect, data: aspectData)
                    } else if let aspect = factoryAspect(self, path: path, data: aspectData) {
                        if decodeAspect(aspect, data: aspectData) {
                            _aspects[aspect.path] = aspect
                            for watcher in _watchers {
                                watcher.onEntityAspectAdded(self, aspect: aspect)
                            }
                        }
                    }
                }
            }
            return true
        }
        return false
    }
    
    public func encodeAspect(aspect: Aspect) -> Data? {
        /*
         * if use value.encode(aspectData) here, the compiler will
         * crash with segment fault, probably a swift bug.
         */
        switch aspect {
        case let a as BaseAspect:
            return a.encode()
        case let a as EntityAspect:
            return a.encode()
        default:
            return nil
        }
    }
    
    public func decodeAspect(aspect: Aspect, data: Data) -> Bool {
        /*
         * if use value.decode(aspectData) here, the compiler will
         * crash with segment fault, probably a swift bug.
         */
        switch aspect {
        case let a as BaseAspect:
            return a.decode(data)
        case let a as EntityAspect:
            return a.decode(data)
        default:
            return false
        }
    }
    
    
    public func factoryAspect(entity: Entity, path: String, data: Data) -> Aspect? {
        return nil
    }
    
    private func getIndexOfWatcher(watcher: EntityWatcher) -> Int? {
        for (i, obj) in enumerate(_watchers) {
            if obj === watcher {
                return i
            }
        }
        return nil
    }
    
    public final func addWatcher(watcher: EntityWatcher) -> Bool {
        if getIndexOfWatcher(watcher) == nil {
            _watchers.append(watcher)
            return true
        }
        return false
    }
    
    public final func removeWatcher(watcher: EntityWatcher) -> Bool {
        if let index = getIndexOfWatcher(watcher) {
            _watchers.removeAtIndex(index)
            return true
        }
        return false
    }
    
    public final func has(path: String) -> Bool {
        return _aspects[path] != nil
    }
   
    public final func get<T: Aspect>(path: String) -> T? {
        return _aspects[path]? as? T
    }
    
    public final func filter<T: Aspect>(pattern: String) -> [T] {
        var result = [T]()
        var matcher = PatternMatcher(separator:separator, pattern:pattern)
        for (key, value) in _aspects {
            if matcher.isMatched(key) && value is T{
                result.append(value as T)
            }
        }
        return result
    }
    
    public final func all<T: Aspect>(pattern: String) -> [T] {
        let aspects:[T] = filter(PatternMatcher.Consts.WildcastSegments)
        return aspects
    }
    
    public final func getAspect(path: String) -> Aspect? {
        return _aspects[path]
    }
    
    public final func add<T: Aspect>(path: String) -> T? {
        if !has(path) {
            let aspect = T(entity: self, path: path)
            _aspects[aspect.path] = aspect
            for watcher in _watchers {
                watcher.onEntityAspectAdded(self, aspect: aspect)
            }
            return aspect
        }
        return nil
    }

    public func remove<T: Aspect>(path: String) -> T? {
        if let aspect: T = get(path) {
            _aspects[aspect.path] = nil
            for watcher in _watchers {
                watcher.onEntityAspectRemoved(self, aspect: aspect)
            }
            return aspect
        }
        return nil
    }
}