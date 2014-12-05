//
//  Property.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public protocol Property: Var {
    typealias ValueChecker
    typealias ValueWatcher
   
    func addValueChecker(checker: ValueChecker) -> Bool
    func removeValueChecker(checker: ValueChecker) -> Bool
    
    func addValueWatcher(watcher: ValueWatcher) -> Bool
    func removeValueWatcher(watcher: ValueWatcher) -> Bool
}

//SILP: PROPERTY_CLASS(Bool, Bool)
public protocol BoolValueChecker : class {                                       //__SILP__
    func isValid(propertyPath: String, value: Bool?, newValue: Bool?) -> Bool    //__SILP__
}                                                                                //__SILP__
                                                                                 //__SILP__
public protocol BoolValueWatcher : class {                                       //__SILP__
    func onChanged(propertyPath: String, lastValue: Bool?, value: Bool?) -> Void //__SILP__
}                                                                                //__SILP__
                                                                                 //__SILP__
public class BoolProperty : BoolVar, Property {                                  //__SILP__
    public typealias ValueChecker = BoolValueChecker                             //__SILP__
    public typealias ValueWatcher = BoolValueWatcher                             //__SILP__
                                                                                 //__SILP__
    public override var type: String? {                                          //__SILP__
        return Properties.Consts.TypeBoolProperty                                //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    public required init(entity: Entity, path: String) {                         //__SILP__
        super.init(entity: entity, path: path)                                   //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    private var _checkers = [ValueChecker]()                                     //__SILP__
    private var _watchers = [ValueWatcher]()                                     //__SILP__
                                                                                 //__SILP__
    private func getIndexOfValueChecker(checker: ValueChecker) -> Int? {         //__SILP__
        for (i, obj) in enumerate(_checkers) {                                   //__SILP__
            if obj === checker {                                                 //__SILP__
                return i                                                         //__SILP__
            }                                                                    //__SILP__
        }                                                                        //__SILP__
        return nil                                                               //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    public final func addValueChecker(checker: ValueChecker) -> Bool {           //__SILP__
        if getIndexOfValueChecker(checker) == nil {                              //__SILP__
            _checkers.append(checker)                                            //__SILP__
            return true                                                          //__SILP__
        }                                                                        //__SILP__
        return false                                                             //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    public final func removeValueChecker(checker: ValueChecker) -> Bool {        //__SILP__
        if let index = getIndexOfValueChecker(checker) {                         //__SILP__
            _checkers.removeAtIndex(index)                                       //__SILP__
            return true                                                          //__SILP__
        }                                                                        //__SILP__
        return false                                                             //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    private func getIndexOfValueWatcher(watcher: ValueWatcher) -> Int? {         //__SILP__
        for (i, obj) in enumerate(_watchers) {                                   //__SILP__
            if obj === watcher {                                                 //__SILP__
                return i                                                         //__SILP__
            }                                                                    //__SILP__
        }                                                                        //__SILP__
        return nil                                                               //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    public final func addValueWatcher(watcher: ValueWatcher) -> Bool {           //__SILP__
        if getIndexOfValueWatcher(watcher) == nil {                              //__SILP__
            _watchers.append(watcher)                                            //__SILP__
            return true                                                          //__SILP__
        }                                                                        //__SILP__
        return false                                                             //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    public final func removeValueWatcher(watcher: ValueWatcher) -> Bool {        //__SILP__
        if let index = getIndexOfValueWatcher(watcher) {                         //__SILP__
            _watchers.removeAtIndex(index)                                       //__SILP__
            return true                                                          //__SILP__
        }                                                                        //__SILP__
        return false                                                             //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    private var _checkingValue = false                                           //__SILP__
    private var _updatingValue = false                                           //__SILP__
                                                                                 //__SILP__
    public override func setValue(newValue: Bool?) -> Bool {                     //__SILP__
        if _checkingValue { return false }                                       //__SILP__
        if _updatingValue { return false }                                       //__SILP__
                                                                                 //__SILP__
        if (value != newValue) {                                                 //__SILP__
            _checkingValue = true                                                //__SILP__
            for checker in _checkers {                                           //__SILP__
                if !checker.isValid(path, value: value, newValue: newValue) {    //__SILP__
                    _checkingValue = false                                       //__SILP__
                    return false                                                 //__SILP__
                }                                                                //__SILP__
            }                                                                    //__SILP__
            _checkingValue = false                                               //__SILP__
                                                                                 //__SILP__
            _updatingValue = true                                                //__SILP__
            let lastValue = value                                                //__SILP__
                                                                                 //__SILP__
            if (!super.setValue(newValue)) {                                     //__SILP__
                _updatingValue = false                                           //__SILP__
                return false                                                     //__SILP__
            }                                                                    //__SILP__
                                                                                 //__SILP__
            for watcher in _watchers {                                           //__SILP__
                watcher.onChanged(path, lastValue: lastValue, value: value)      //__SILP__
            }                                                                    //__SILP__
            _updatingValue = false                                               //__SILP__
            return true                                                          //__SILP__
        }                                                                        //__SILP__
        return false                                                             //__SILP__
    }                                                                            //__SILP__
}                                                                                //__SILP__
                                                                                 //__SILP__
//SILP: PROPERTY_CLASS(Int, Int32)
public protocol IntValueChecker : class {                                          //__SILP__
    func isValid(propertyPath: String, value: Int32?, newValue: Int32?) -> Bool    //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
public protocol IntValueWatcher : class {                                          //__SILP__
    func onChanged(propertyPath: String, lastValue: Int32?, value: Int32?) -> Void //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
public class IntProperty : IntVar, Property {                                      //__SILP__
    public typealias ValueChecker = IntValueChecker                                //__SILP__
    public typealias ValueWatcher = IntValueWatcher                                //__SILP__
                                                                                   //__SILP__
    public override var type: String? {                                            //__SILP__
        return Properties.Consts.TypeIntProperty                                   //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public required init(entity: Entity, path: String) {                           //__SILP__
        super.init(entity: entity, path: path)                                     //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private var _checkers = [ValueChecker]()                                       //__SILP__
    private var _watchers = [ValueWatcher]()                                       //__SILP__
                                                                                   //__SILP__
    private func getIndexOfValueChecker(checker: ValueChecker) -> Int? {           //__SILP__
        for (i, obj) in enumerate(_checkers) {                                     //__SILP__
            if obj === checker {                                                   //__SILP__
                return i                                                           //__SILP__
            }                                                                      //__SILP__
        }                                                                          //__SILP__
        return nil                                                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func addValueChecker(checker: ValueChecker) -> Bool {             //__SILP__
        if getIndexOfValueChecker(checker) == nil {                                //__SILP__
            _checkers.append(checker)                                              //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func removeValueChecker(checker: ValueChecker) -> Bool {          //__SILP__
        if let index = getIndexOfValueChecker(checker) {                           //__SILP__
            _checkers.removeAtIndex(index)                                         //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private func getIndexOfValueWatcher(watcher: ValueWatcher) -> Int? {           //__SILP__
        for (i, obj) in enumerate(_watchers) {                                     //__SILP__
            if obj === watcher {                                                   //__SILP__
                return i                                                           //__SILP__
            }                                                                      //__SILP__
        }                                                                          //__SILP__
        return nil                                                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func addValueWatcher(watcher: ValueWatcher) -> Bool {             //__SILP__
        if getIndexOfValueWatcher(watcher) == nil {                                //__SILP__
            _watchers.append(watcher)                                              //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func removeValueWatcher(watcher: ValueWatcher) -> Bool {          //__SILP__
        if let index = getIndexOfValueWatcher(watcher) {                           //__SILP__
            _watchers.removeAtIndex(index)                                         //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private var _checkingValue = false                                             //__SILP__
    private var _updatingValue = false                                             //__SILP__
                                                                                   //__SILP__
    public override func setValue(newValue: Int32?) -> Bool {                      //__SILP__
        if _checkingValue { return false }                                         //__SILP__
        if _updatingValue { return false }                                         //__SILP__
                                                                                   //__SILP__
        if (value != newValue) {                                                   //__SILP__
            _checkingValue = true                                                  //__SILP__
            for checker in _checkers {                                             //__SILP__
                if !checker.isValid(path, value: value, newValue: newValue) {      //__SILP__
                    _checkingValue = false                                         //__SILP__
                    return false                                                   //__SILP__
                }                                                                  //__SILP__
            }                                                                      //__SILP__
            _checkingValue = false                                                 //__SILP__
                                                                                   //__SILP__
            _updatingValue = true                                                  //__SILP__
            let lastValue = value                                                  //__SILP__
                                                                                   //__SILP__
            if (!super.setValue(newValue)) {                                       //__SILP__
                _updatingValue = false                                             //__SILP__
                return false                                                       //__SILP__
            }                                                                      //__SILP__
                                                                                   //__SILP__
            for watcher in _watchers {                                             //__SILP__
                watcher.onChanged(path, lastValue: lastValue, value: value)        //__SILP__
            }                                                                      //__SILP__
            _updatingValue = false                                                 //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
//SILP: PROPERTY_CLASS(Long, Int64)
public protocol LongValueChecker : class {                                         //__SILP__
    func isValid(propertyPath: String, value: Int64?, newValue: Int64?) -> Bool    //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
public protocol LongValueWatcher : class {                                         //__SILP__
    func onChanged(propertyPath: String, lastValue: Int64?, value: Int64?) -> Void //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
public class LongProperty : LongVar, Property {                                    //__SILP__
    public typealias ValueChecker = LongValueChecker                               //__SILP__
    public typealias ValueWatcher = LongValueWatcher                               //__SILP__
                                                                                   //__SILP__
    public override var type: String? {                                            //__SILP__
        return Properties.Consts.TypeLongProperty                                  //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public required init(entity: Entity, path: String) {                           //__SILP__
        super.init(entity: entity, path: path)                                     //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private var _checkers = [ValueChecker]()                                       //__SILP__
    private var _watchers = [ValueWatcher]()                                       //__SILP__
                                                                                   //__SILP__
    private func getIndexOfValueChecker(checker: ValueChecker) -> Int? {           //__SILP__
        for (i, obj) in enumerate(_checkers) {                                     //__SILP__
            if obj === checker {                                                   //__SILP__
                return i                                                           //__SILP__
            }                                                                      //__SILP__
        }                                                                          //__SILP__
        return nil                                                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func addValueChecker(checker: ValueChecker) -> Bool {             //__SILP__
        if getIndexOfValueChecker(checker) == nil {                                //__SILP__
            _checkers.append(checker)                                              //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func removeValueChecker(checker: ValueChecker) -> Bool {          //__SILP__
        if let index = getIndexOfValueChecker(checker) {                           //__SILP__
            _checkers.removeAtIndex(index)                                         //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private func getIndexOfValueWatcher(watcher: ValueWatcher) -> Int? {           //__SILP__
        for (i, obj) in enumerate(_watchers) {                                     //__SILP__
            if obj === watcher {                                                   //__SILP__
                return i                                                           //__SILP__
            }                                                                      //__SILP__
        }                                                                          //__SILP__
        return nil                                                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func addValueWatcher(watcher: ValueWatcher) -> Bool {             //__SILP__
        if getIndexOfValueWatcher(watcher) == nil {                                //__SILP__
            _watchers.append(watcher)                                              //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func removeValueWatcher(watcher: ValueWatcher) -> Bool {          //__SILP__
        if let index = getIndexOfValueWatcher(watcher) {                           //__SILP__
            _watchers.removeAtIndex(index)                                         //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private var _checkingValue = false                                             //__SILP__
    private var _updatingValue = false                                             //__SILP__
                                                                                   //__SILP__
    public override func setValue(newValue: Int64?) -> Bool {                      //__SILP__
        if _checkingValue { return false }                                         //__SILP__
        if _updatingValue { return false }                                         //__SILP__
                                                                                   //__SILP__
        if (value != newValue) {                                                   //__SILP__
            _checkingValue = true                                                  //__SILP__
            for checker in _checkers {                                             //__SILP__
                if !checker.isValid(path, value: value, newValue: newValue) {      //__SILP__
                    _checkingValue = false                                         //__SILP__
                    return false                                                   //__SILP__
                }                                                                  //__SILP__
            }                                                                      //__SILP__
            _checkingValue = false                                                 //__SILP__
                                                                                   //__SILP__
            _updatingValue = true                                                  //__SILP__
            let lastValue = value                                                  //__SILP__
                                                                                   //__SILP__
            if (!super.setValue(newValue)) {                                       //__SILP__
                _updatingValue = false                                             //__SILP__
                return false                                                       //__SILP__
            }                                                                      //__SILP__
                                                                                   //__SILP__
            for watcher in _watchers {                                             //__SILP__
                watcher.onChanged(path, lastValue: lastValue, value: value)        //__SILP__
            }                                                                      //__SILP__
            _updatingValue = false                                                 //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
//SILP: PROPERTY_CLASS(Float, Float)
public protocol FloatValueChecker : class {                                        //__SILP__
    func isValid(propertyPath: String, value: Float?, newValue: Float?) -> Bool    //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
public protocol FloatValueWatcher : class {                                        //__SILP__
    func onChanged(propertyPath: String, lastValue: Float?, value: Float?) -> Void //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
public class FloatProperty : FloatVar, Property {                                  //__SILP__
    public typealias ValueChecker = FloatValueChecker                              //__SILP__
    public typealias ValueWatcher = FloatValueWatcher                              //__SILP__
                                                                                   //__SILP__
    public override var type: String? {                                            //__SILP__
        return Properties.Consts.TypeFloatProperty                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public required init(entity: Entity, path: String) {                           //__SILP__
        super.init(entity: entity, path: path)                                     //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private var _checkers = [ValueChecker]()                                       //__SILP__
    private var _watchers = [ValueWatcher]()                                       //__SILP__
                                                                                   //__SILP__
    private func getIndexOfValueChecker(checker: ValueChecker) -> Int? {           //__SILP__
        for (i, obj) in enumerate(_checkers) {                                     //__SILP__
            if obj === checker {                                                   //__SILP__
                return i                                                           //__SILP__
            }                                                                      //__SILP__
        }                                                                          //__SILP__
        return nil                                                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func addValueChecker(checker: ValueChecker) -> Bool {             //__SILP__
        if getIndexOfValueChecker(checker) == nil {                                //__SILP__
            _checkers.append(checker)                                              //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func removeValueChecker(checker: ValueChecker) -> Bool {          //__SILP__
        if let index = getIndexOfValueChecker(checker) {                           //__SILP__
            _checkers.removeAtIndex(index)                                         //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private func getIndexOfValueWatcher(watcher: ValueWatcher) -> Int? {           //__SILP__
        for (i, obj) in enumerate(_watchers) {                                     //__SILP__
            if obj === watcher {                                                   //__SILP__
                return i                                                           //__SILP__
            }                                                                      //__SILP__
        }                                                                          //__SILP__
        return nil                                                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func addValueWatcher(watcher: ValueWatcher) -> Bool {             //__SILP__
        if getIndexOfValueWatcher(watcher) == nil {                                //__SILP__
            _watchers.append(watcher)                                              //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func removeValueWatcher(watcher: ValueWatcher) -> Bool {          //__SILP__
        if let index = getIndexOfValueWatcher(watcher) {                           //__SILP__
            _watchers.removeAtIndex(index)                                         //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    private var _checkingValue = false                                             //__SILP__
    private var _updatingValue = false                                             //__SILP__
                                                                                   //__SILP__
    public override func setValue(newValue: Float?) -> Bool {                      //__SILP__
        if _checkingValue { return false }                                         //__SILP__
        if _updatingValue { return false }                                         //__SILP__
                                                                                   //__SILP__
        if (value != newValue) {                                                   //__SILP__
            _checkingValue = true                                                  //__SILP__
            for checker in _checkers {                                             //__SILP__
                if !checker.isValid(path, value: value, newValue: newValue) {      //__SILP__
                    _checkingValue = false                                         //__SILP__
                    return false                                                   //__SILP__
                }                                                                  //__SILP__
            }                                                                      //__SILP__
            _checkingValue = false                                                 //__SILP__
                                                                                   //__SILP__
            _updatingValue = true                                                  //__SILP__
            let lastValue = value                                                  //__SILP__
                                                                                   //__SILP__
            if (!super.setValue(newValue)) {                                       //__SILP__
                _updatingValue = false                                             //__SILP__
                return false                                                       //__SILP__
            }                                                                      //__SILP__
                                                                                   //__SILP__
            for watcher in _watchers {                                             //__SILP__
                watcher.onChanged(path, lastValue: lastValue, value: value)        //__SILP__
            }                                                                      //__SILP__
            _updatingValue = false                                                 //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
}                                                                                  //__SILP__
                                                                                   //__SILP__
//SILP: PROPERTY_CLASS(Double, Double)
public protocol DoubleValueChecker : class {                                         //__SILP__
    func isValid(propertyPath: String, value: Double?, newValue: Double?) -> Bool    //__SILP__
}                                                                                    //__SILP__
                                                                                     //__SILP__
public protocol DoubleValueWatcher : class {                                         //__SILP__
    func onChanged(propertyPath: String, lastValue: Double?, value: Double?) -> Void //__SILP__
}                                                                                    //__SILP__
                                                                                     //__SILP__
public class DoubleProperty : DoubleVar, Property {                                  //__SILP__
    public typealias ValueChecker = DoubleValueChecker                               //__SILP__
    public typealias ValueWatcher = DoubleValueWatcher                               //__SILP__
                                                                                     //__SILP__
    public override var type: String? {                                              //__SILP__
        return Properties.Consts.TypeDoubleProperty                                  //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public required init(entity: Entity, path: String) {                             //__SILP__
        super.init(entity: entity, path: path)                                       //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    private var _checkers = [ValueChecker]()                                         //__SILP__
    private var _watchers = [ValueWatcher]()                                         //__SILP__
                                                                                     //__SILP__
    private func getIndexOfValueChecker(checker: ValueChecker) -> Int? {             //__SILP__
        for (i, obj) in enumerate(_checkers) {                                       //__SILP__
            if obj === checker {                                                     //__SILP__
                return i                                                             //__SILP__
            }                                                                        //__SILP__
        }                                                                            //__SILP__
        return nil                                                                   //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func addValueChecker(checker: ValueChecker) -> Bool {               //__SILP__
        if getIndexOfValueChecker(checker) == nil {                                  //__SILP__
            _checkers.append(checker)                                                //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func removeValueChecker(checker: ValueChecker) -> Bool {            //__SILP__
        if let index = getIndexOfValueChecker(checker) {                             //__SILP__
            _checkers.removeAtIndex(index)                                           //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    private func getIndexOfValueWatcher(watcher: ValueWatcher) -> Int? {             //__SILP__
        for (i, obj) in enumerate(_watchers) {                                       //__SILP__
            if obj === watcher {                                                     //__SILP__
                return i                                                             //__SILP__
            }                                                                        //__SILP__
        }                                                                            //__SILP__
        return nil                                                                   //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func addValueWatcher(watcher: ValueWatcher) -> Bool {               //__SILP__
        if getIndexOfValueWatcher(watcher) == nil {                                  //__SILP__
            _watchers.append(watcher)                                                //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func removeValueWatcher(watcher: ValueWatcher) -> Bool {            //__SILP__
        if let index = getIndexOfValueWatcher(watcher) {                             //__SILP__
            _watchers.removeAtIndex(index)                                           //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    private var _checkingValue = false                                               //__SILP__
    private var _updatingValue = false                                               //__SILP__
                                                                                     //__SILP__
    public override func setValue(newValue: Double?) -> Bool {                       //__SILP__
        if _checkingValue { return false }                                           //__SILP__
        if _updatingValue { return false }                                           //__SILP__
                                                                                     //__SILP__
        if (value != newValue) {                                                     //__SILP__
            _checkingValue = true                                                    //__SILP__
            for checker in _checkers {                                               //__SILP__
                if !checker.isValid(path, value: value, newValue: newValue) {        //__SILP__
                    _checkingValue = false                                           //__SILP__
                    return false                                                     //__SILP__
                }                                                                    //__SILP__
            }                                                                        //__SILP__
            _checkingValue = false                                                   //__SILP__
                                                                                     //__SILP__
            _updatingValue = true                                                    //__SILP__
            let lastValue = value                                                    //__SILP__
                                                                                     //__SILP__
            if (!super.setValue(newValue)) {                                         //__SILP__
                _updatingValue = false                                               //__SILP__
                return false                                                         //__SILP__
            }                                                                        //__SILP__
                                                                                     //__SILP__
            for watcher in _watchers {                                               //__SILP__
                watcher.onChanged(path, lastValue: lastValue, value: value)          //__SILP__
            }                                                                        //__SILP__
            _updatingValue = false                                                   //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
}                                                                                    //__SILP__
                                                                                     //__SILP__
//SILP: PROPERTY_CLASS(String, String)
public protocol StringValueChecker : class {                                         //__SILP__
    func isValid(propertyPath: String, value: String?, newValue: String?) -> Bool    //__SILP__
}                                                                                    //__SILP__
                                                                                     //__SILP__
public protocol StringValueWatcher : class {                                         //__SILP__
    func onChanged(propertyPath: String, lastValue: String?, value: String?) -> Void //__SILP__
}                                                                                    //__SILP__
                                                                                     //__SILP__
public class StringProperty : StringVar, Property {                                  //__SILP__
    public typealias ValueChecker = StringValueChecker                               //__SILP__
    public typealias ValueWatcher = StringValueWatcher                               //__SILP__
                                                                                     //__SILP__
    public override var type: String? {                                              //__SILP__
        return Properties.Consts.TypeStringProperty                                  //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public required init(entity: Entity, path: String) {                             //__SILP__
        super.init(entity: entity, path: path)                                       //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    private var _checkers = [ValueChecker]()                                         //__SILP__
    private var _watchers = [ValueWatcher]()                                         //__SILP__
                                                                                     //__SILP__
    private func getIndexOfValueChecker(checker: ValueChecker) -> Int? {             //__SILP__
        for (i, obj) in enumerate(_checkers) {                                       //__SILP__
            if obj === checker {                                                     //__SILP__
                return i                                                             //__SILP__
            }                                                                        //__SILP__
        }                                                                            //__SILP__
        return nil                                                                   //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func addValueChecker(checker: ValueChecker) -> Bool {               //__SILP__
        if getIndexOfValueChecker(checker) == nil {                                  //__SILP__
            _checkers.append(checker)                                                //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func removeValueChecker(checker: ValueChecker) -> Bool {            //__SILP__
        if let index = getIndexOfValueChecker(checker) {                             //__SILP__
            _checkers.removeAtIndex(index)                                           //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    private func getIndexOfValueWatcher(watcher: ValueWatcher) -> Int? {             //__SILP__
        for (i, obj) in enumerate(_watchers) {                                       //__SILP__
            if obj === watcher {                                                     //__SILP__
                return i                                                             //__SILP__
            }                                                                        //__SILP__
        }                                                                            //__SILP__
        return nil                                                                   //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func addValueWatcher(watcher: ValueWatcher) -> Bool {               //__SILP__
        if getIndexOfValueWatcher(watcher) == nil {                                  //__SILP__
            _watchers.append(watcher)                                                //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    public final func removeValueWatcher(watcher: ValueWatcher) -> Bool {            //__SILP__
        if let index = getIndexOfValueWatcher(watcher) {                             //__SILP__
            _watchers.removeAtIndex(index)                                           //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
                                                                                     //__SILP__
    private var _checkingValue = false                                               //__SILP__
    private var _updatingValue = false                                               //__SILP__
                                                                                     //__SILP__
    public override func setValue(newValue: String?) -> Bool {                       //__SILP__
        if _checkingValue { return false }                                           //__SILP__
        if _updatingValue { return false }                                           //__SILP__
                                                                                     //__SILP__
        if (value != newValue) {                                                     //__SILP__
            _checkingValue = true                                                    //__SILP__
            for checker in _checkers {                                               //__SILP__
                if !checker.isValid(path, value: value, newValue: newValue) {        //__SILP__
                    _checkingValue = false                                           //__SILP__
                    return false                                                     //__SILP__
                }                                                                    //__SILP__
            }                                                                        //__SILP__
            _checkingValue = false                                                   //__SILP__
                                                                                     //__SILP__
            _updatingValue = true                                                    //__SILP__
            let lastValue = value                                                    //__SILP__
                                                                                     //__SILP__
            if (!super.setValue(newValue)) {                                         //__SILP__
                _updatingValue = false                                               //__SILP__
                return false                                                         //__SILP__
            }                                                                        //__SILP__
                                                                                     //__SILP__
            for watcher in _watchers {                                               //__SILP__
                watcher.onChanged(path, lastValue: lastValue, value: value)          //__SILP__
            }                                                                        //__SILP__
            _updatingValue = false                                                   //__SILP__
            return true                                                              //__SILP__
        }                                                                            //__SILP__
        return false                                                                 //__SILP__
    }                                                                                //__SILP__
}                                                                                    //__SILP__
                                                                                     //__SILP__
