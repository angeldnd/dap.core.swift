//
//  Property.swift
//  DAP
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public typealias BoolProperty = Property<Bool>
public typealias IntProperty = Property<Int>
public typealias FloatProperty = Property<Float>
public typealias DoubleProperty = Property<Double>
public typealias StringProperty = Property<String>

public class Property<T: Equatable> : Var<T> {
   public override var type: String? {
        switch T.self {
        case is Bool.Type:
            return Properties.Consts.TypeBoolProperty
        case is Int.Type:
            return Properties.Consts.TypeIntProperty
        case is Float.Type:
            return Properties.Consts.TypeFloatProperty
        case is Double.Type:
            return Properties.Consts.TypeDoubleProperty
        case is String.Type:
            return Properties.Consts.TypeStringProperty
        default:
            return nil;
        }
    }
    
    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }

    private var _checkingValue = false
    private var _updatingValue = false
    
    public override func setValue(newValue: T?) -> Bool {
        if _checkingValue { return false }
        if _updatingValue { return false }
        
        if (value != newValue) {
            _checkingValue = true
            for checker in _checkers {
                if !checker(value, newValue) {
                    _checkingValue = false
                    return false
                }
            }
            _checkingValue = false
            
            _updatingValue = true
            let lastValue = value
            super.setValue(newValue)
            for watcher in _watchers {
                watcher(lastValue, value)
            }
            _updatingValue = false
            return true
        }
        return false
    }
    
    public typealias ValueChecker = (T?, T?) -> Bool
    private var _checkers = [ValueChecker]()
    /*
     Note that there is no way to remove checker
     */
    func addChecker(checker: ValueChecker) {
        _checkers.append(checker)
    }

    public typealias ValueWatcher = (T?, T?) -> Void
    private var _watchers = [ValueWatcher]()
    /*
     Note that there is no way to remove watcher
     */
    func addWatcher(watcher: ValueWatcher) {
        _watchers.append(watcher)
    }
}