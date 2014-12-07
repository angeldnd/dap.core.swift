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
    public struct Consts {
        public static let KeyAspects = "aspects"
    }
       
    public var separator: String { return "." }
   
    private var _aspects = [String: Aspect]()
    private var _watchers = [EntityWatcher]()
    
    public override func encode() -> Data? {
        if let data = super.encode() {
            var aspectsData = Data()
            for (key, aspect) in _aspects {
                if let aspectData = aspect.encode() {
                    aspectsData.setData(key, value: aspectData)
                }
            }
            if data.setData(Consts.KeyAspects, value: aspectsData) {
                return data
            }
        }
        return nil
    }
    
    public override func decode(data: Data) -> Bool {
        if !super.decode(data) { return false }
        
        if let aspectsData = data.getData(Consts.KeyAspects) {
            var (succeedCount, failedCount) = decodeAspects(aspectsData)
            return succeedCount > 0
        }
        return false
    }
    
    public func decodeAspects(aspectsData: Data) -> (Int, Int) {
        var succeedCount = 0
        var failedCount = 0
        for path in aspectsData.getKeys() {
            var succeed = false
            if let aspectData = aspectsData.getData(path) {
                if let aspect = getAspect(path) {
                    if aspect.decode(aspectData) {
                        succeed = true
                    }
                } else if let type = aspectsData.getString(DapObject.Consts.KeyType) {
                    if let aspect = factoryAspect(self, path: path, type: type) {
                        if aspect.decode(aspectData) {
                            setAspect(aspect)
                            succeed = true
                        }
                    }
                }
            }
            if succeed {
                succeedCount++
            } else {
                failedCount++
            }
        }
        return (succeedCount, failedCount)
    }
    
    public func factoryAspect(entity: Entity, path: String, type: String) -> Aspect? {
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
    
    internal final func setAspect(aspect: Aspect) {
        if let oldAspect = _aspects[aspect.path] {
            for watcher in _watchers {
                watcher.onEntityAspectRemoved(self, aspect: aspect)
            }
        }
        /* Note: checking aspect like following will cause the PlayGround to
         * crash with bad access
         aspect.entity === self
         */
        _aspects[aspect.path] = aspect
        for watcher in _watchers {
            watcher.onEntityAspectAdded(self, aspect: aspect)
        }
    }
    
    public final func add<T: Aspect>(path: String) -> T? {
        if !has(path) {
            let aspect = T(entity: self, path: path)
            setAspect(aspect)
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