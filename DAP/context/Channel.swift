//
//  Channel.swift
//  DAP
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public protocol DataChecker : class {
    func isValid(data: Data?) -> Bool
}

public protocol ChannelListener : class {
    func onReceive(path: String, data: Data?) -> Void
}

public class Channel : BaseAspect {
    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }
    
    private var _checkers = [DataChecker]()
    private var _listeners = [ChannelListener]()
    
    private func getIndexOfListener(listener: ChannelListener) -> Int? {
        for (i, obj) in enumerate(_listeners) {
            if obj === listener {
                return i
            }
        }
        return nil
    }
    
    public final func addListener(listener: ChannelListener) -> Bool {
        if getIndexOfListener(listener) == nil {
            _listeners.append(listener)
            return true
        }
        return false
    }
   
    public final func removeListener(listener: ChannelListener) -> Bool {
        if let index = getIndexOfListener(listener) {
            _listeners.removeAtIndex(index)
            return true
        }
        return false
    }
    
    private func getIndexOfChecker(checker: DataChecker) -> Int? {
        for (i, obj) in enumerate(_checkers) {
            if obj === checker {
                return i
            }
        }
        return nil
    }
    
    public final func addChecker(checker: DataChecker) -> Bool {
        if getIndexOfChecker(checker) == nil {
            _checkers.append(checker)
            return true
        }
        return false
    }
   
    public final func removeChecker(checker: DataChecker) -> Bool {
        if let index = getIndexOfChecker(checker) {
            _checkers.removeAtIndex(index)
            return true
        }
        return false
    }
    
    public final func send(data: Data?) -> Bool {
        for checker in _checkers {
            if !checker.isValid(data) {
                return false
            }
        }
        for listener in _listeners {
            listener.onReceive(path, data: data)
        }
        return true
    }
}