//
//  Channel.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public protocol EventListener : class {
    func onEvent(channelPath: String, evt: Data?) -> Void
}

public final class Channel : BaseAspect {
    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }
    
    private var _eventCheckers = [DataChecker]()
    private var _eventListeners = [EventListener]()
    
    //SILP: DECLARE_LIST(EventChecker, listener, DataChecker, _eventCheckers)
    private func getIndexOfEventChecker(listener: DataChecker) -> Int? {  //__SILP__
        for (i, obj) in enumerate(_eventCheckers) {                       //__SILP__
            if obj === listener {                                         //__SILP__
                return i                                                  //__SILP__
            }                                                             //__SILP__
        }                                                                 //__SILP__
        return nil                                                        //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public final func addEventChecker(listener: DataChecker) -> Bool {    //__SILP__
        if getIndexOfEventChecker(listener) == nil {                      //__SILP__
            _eventCheckers.append(listener)                               //__SILP__
            return true                                                   //__SILP__
        }                                                                 //__SILP__
        return false                                                      //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public final func removeEventChecker(listener: DataChecker) -> Bool { //__SILP__
        if let index = getIndexOfEventChecker(listener) {                 //__SILP__
            _eventCheckers.removeAtIndex(index)                           //__SILP__
            return true                                                   //__SILP__
        }                                                                 //__SILP__
        return false                                                      //__SILP__
    }                                                                     //__SILP__
    
    //SILP: DECLARE_LIST(EventListener, listener, EventListener, _eventListeners)
    private func getIndexOfEventListener(listener: EventListener) -> Int? {  //__SILP__
        for (i, obj) in enumerate(_eventListeners) {                         //__SILP__
            if obj === listener {                                            //__SILP__
                return i                                                     //__SILP__
            }                                                                //__SILP__
        }                                                                    //__SILP__
        return nil                                                           //__SILP__
    }                                                                        //__SILP__
                                                                             //__SILP__
    public final func addEventListener(listener: EventListener) -> Bool {    //__SILP__
        if getIndexOfEventListener(listener) == nil {                        //__SILP__
            _eventListeners.append(listener)                                 //__SILP__
            return true                                                      //__SILP__
        }                                                                    //__SILP__
        return false                                                         //__SILP__
    }                                                                        //__SILP__
                                                                             //__SILP__
    public final func removeEventListener(listener: EventListener) -> Bool { //__SILP__
        if let index = getIndexOfEventListener(listener) {                   //__SILP__
            _eventListeners.removeAtIndex(index)                             //__SILP__
            return true                                                      //__SILP__
        }                                                                    //__SILP__
        return false                                                         //__SILP__
    }                                                                        //__SILP__
    
    public final func fireEvent(evt: Data?) -> Bool {
        for checker in _eventCheckers {
            if !checker.isValid(evt) {
                return false
            }
        }
        for listener in _eventListeners {
            listener.onEvent(path, evt: evt)
        }
        return true
    }
}