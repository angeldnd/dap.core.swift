//
//  Properties.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class Properties : EntityAspect {
    public struct Consts {
        public static let TypeProperties = "Properties"

        public static let TypeBoolProperty = "Bool"
        public static let TypeIntProperty = "Int"
        public static let TypeLongProperty = "Long"
        public static let TypeFloatProperty = "Float"
        public static let TypeDoubleProperty = "Double"
        public static let TypeStringProperty = "String"

    }

    public override var type: String? { return Consts.TypeProperties }

    public final func addProperty<T: Property>(path: String, value: T.ValueType?) -> T? {
        if let property: T = add(path) {
            property.setValue(value)
            return property
        }
        return nil
    }

    //SILP: ADD_REMOVE_HELPER(BoolValueChecker, propertyPath, property, BoolProperty, ValueChecker, checker, BoolProperty.ValueChecker)
    public func addBoolValueChecker(propertyPath: String, checker: BoolProperty.ValueChecker) -> Bool {    //__SILP__
        if let property: BoolProperty = get(propertyPath) {                                                //__SILP__
            return property.addValueChecker(checker)                                                       //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__
                                                                                                           //__SILP__
    public func removeBoolValueChecker(propertyPath: String, checker: BoolProperty.ValueChecker) -> Bool { //__SILP__
        if let property: BoolProperty = get(propertyPath) {                                                //__SILP__
            return property.removeValueChecker(checker)                                                    //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__
    //SILP: ADD_REMOVE_HELPER(BoolValueWatcher, propertyPath, property, BoolProperty, ValueWatcher, watcher, BoolProperty.ValueWatcher)
    public func addBoolValueWatcher(propertyPath: String, watcher: BoolProperty.ValueWatcher) -> Bool {    //__SILP__
        if let property: BoolProperty = get(propertyPath) {                                                //__SILP__
            return property.addValueWatcher(watcher)                                                       //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__
                                                                                                           //__SILP__
    public func removeBoolValueWatcher(propertyPath: String, watcher: BoolProperty.ValueWatcher) -> Bool { //__SILP__
        if let property: BoolProperty = get(propertyPath) {                                                //__SILP__
            return property.removeValueWatcher(watcher)                                                    //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__

    //SILP: ADD_REMOVE_HELPER(IntValueChecker, propertyPath, property, IntProperty, ValueChecker, checker, IntProperty.ValueChecker)
    public func addIntValueChecker(propertyPath: String, checker: IntProperty.ValueChecker) -> Bool {    //__SILP__
        if let property: IntProperty = get(propertyPath) {                                               //__SILP__
            return property.addValueChecker(checker)                                                     //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__
                                                                                                         //__SILP__
    public func removeIntValueChecker(propertyPath: String, checker: IntProperty.ValueChecker) -> Bool { //__SILP__
        if let property: IntProperty = get(propertyPath) {                                               //__SILP__
            return property.removeValueChecker(checker)                                                  //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__
    //SILP: ADD_REMOVE_HELPER(IntValueWatcher, propertyPath, property, IntProperty, ValueWatcher, watcher, IntProperty.ValueWatcher)
    public func addIntValueWatcher(propertyPath: String, watcher: IntProperty.ValueWatcher) -> Bool {    //__SILP__
        if let property: IntProperty = get(propertyPath) {                                               //__SILP__
            return property.addValueWatcher(watcher)                                                     //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__
                                                                                                         //__SILP__
    public func removeIntValueWatcher(propertyPath: String, watcher: IntProperty.ValueWatcher) -> Bool { //__SILP__
        if let property: IntProperty = get(propertyPath) {                                               //__SILP__
            return property.removeValueWatcher(watcher)                                                  //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__

    //SILP: ADD_REMOVE_HELPER(LongValueChecker, propertyPath, property, LongProperty, ValueChecker, checker, LongProperty.ValueChecker)
    public func addLongValueChecker(propertyPath: String, checker: LongProperty.ValueChecker) -> Bool {    //__SILP__
        if let property: LongProperty = get(propertyPath) {                                                //__SILP__
            return property.addValueChecker(checker)                                                       //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__
                                                                                                           //__SILP__
    public func removeLongValueChecker(propertyPath: String, checker: LongProperty.ValueChecker) -> Bool { //__SILP__
        if let property: LongProperty = get(propertyPath) {                                                //__SILP__
            return property.removeValueChecker(checker)                                                    //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__
    //SILP: ADD_REMOVE_HELPER(LongValueWatcher, propertyPath, property, LongProperty, ValueWatcher, watcher, LongProperty.ValueWatcher)
    public func addLongValueWatcher(propertyPath: String, watcher: LongProperty.ValueWatcher) -> Bool {    //__SILP__
        if let property: LongProperty = get(propertyPath) {                                                //__SILP__
            return property.addValueWatcher(watcher)                                                       //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__
                                                                                                           //__SILP__
    public func removeLongValueWatcher(propertyPath: String, watcher: LongProperty.ValueWatcher) -> Bool { //__SILP__
        if let property: LongProperty = get(propertyPath) {                                                //__SILP__
            return property.removeValueWatcher(watcher)                                                    //__SILP__
        }                                                                                                  //__SILP__
        return false                                                                                       //__SILP__
    }                                                                                                      //__SILP__

    //SILP: ADD_REMOVE_HELPER(FloatValueChecker, propertyPath, property, FloatProperty, ValueChecker, checker, FloatProperty.ValueChecker)
    public func addFloatValueChecker(propertyPath: String, checker: FloatProperty.ValueChecker) -> Bool {    //__SILP__
        if let property: FloatProperty = get(propertyPath) {                                                 //__SILP__
            return property.addValueChecker(checker)                                                         //__SILP__
        }                                                                                                    //__SILP__
        return false                                                                                         //__SILP__
    }                                                                                                        //__SILP__
                                                                                                             //__SILP__
    public func removeFloatValueChecker(propertyPath: String, checker: FloatProperty.ValueChecker) -> Bool { //__SILP__
        if let property: FloatProperty = get(propertyPath) {                                                 //__SILP__
            return property.removeValueChecker(checker)                                                      //__SILP__
        }                                                                                                    //__SILP__
        return false                                                                                         //__SILP__
    }                                                                                                        //__SILP__
    //SILP: ADD_REMOVE_HELPER(FloatValueWatcher, propertyPath, property, FloatProperty, ValueWatcher, watcher, FloatProperty.ValueWatcher)
    public func addFloatValueWatcher(propertyPath: String, watcher: FloatProperty.ValueWatcher) -> Bool {    //__SILP__
        if let property: FloatProperty = get(propertyPath) {                                                 //__SILP__
            return property.addValueWatcher(watcher)                                                         //__SILP__
        }                                                                                                    //__SILP__
        return false                                                                                         //__SILP__
    }                                                                                                        //__SILP__
                                                                                                             //__SILP__
    public func removeFloatValueWatcher(propertyPath: String, watcher: FloatProperty.ValueWatcher) -> Bool { //__SILP__
        if let property: FloatProperty = get(propertyPath) {                                                 //__SILP__
            return property.removeValueWatcher(watcher)                                                      //__SILP__
        }                                                                                                    //__SILP__
        return false                                                                                         //__SILP__
    }                                                                                                        //__SILP__

    //SILP: ADD_REMOVE_HELPER(DoubleValueChecker, propertyPath, property, DoubleProperty, ValueChecker, checker, DoubleProperty.ValueChecker)
    public func addDoubleValueChecker(propertyPath: String, checker: DoubleProperty.ValueChecker) -> Bool {    //__SILP__
        if let property: DoubleProperty = get(propertyPath) {                                                  //__SILP__
            return property.addValueChecker(checker)                                                           //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__
                                                                                                               //__SILP__
    public func removeDoubleValueChecker(propertyPath: String, checker: DoubleProperty.ValueChecker) -> Bool { //__SILP__
        if let property: DoubleProperty = get(propertyPath) {                                                  //__SILP__
            return property.removeValueChecker(checker)                                                        //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__
    //SILP: ADD_REMOVE_HELPER(DoubleValueWatcher, propertyPath, property, DoubleProperty, ValueWatcher, watcher, DoubleProperty.ValueWatcher)
    public func addDoubleValueWatcher(propertyPath: String, watcher: DoubleProperty.ValueWatcher) -> Bool {    //__SILP__
        if let property: DoubleProperty = get(propertyPath) {                                                  //__SILP__
            return property.addValueWatcher(watcher)                                                           //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__
                                                                                                               //__SILP__
    public func removeDoubleValueWatcher(propertyPath: String, watcher: DoubleProperty.ValueWatcher) -> Bool { //__SILP__
        if let property: DoubleProperty = get(propertyPath) {                                                  //__SILP__
            return property.removeValueWatcher(watcher)                                                        //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__

    //SILP: ADD_REMOVE_HELPER(StringValueChecker, propertyPath, property, StringProperty, ValueChecker, checker, StringProperty.ValueChecker)
    public func addStringValueChecker(propertyPath: String, checker: StringProperty.ValueChecker) -> Bool {    //__SILP__
        if let property: StringProperty = get(propertyPath) {                                                  //__SILP__
            return property.addValueChecker(checker)                                                           //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__
                                                                                                               //__SILP__
    public func removeStringValueChecker(propertyPath: String, checker: StringProperty.ValueChecker) -> Bool { //__SILP__
        if let property: StringProperty = get(propertyPath) {                                                  //__SILP__
            return property.removeValueChecker(checker)                                                        //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__
    //SILP: ADD_REMOVE_HELPER(StringValueWatcher, propertyPath, property, StringProperty, ValueWatcher, watcher, StringProperty.ValueWatcher)
    public func addStringValueWatcher(propertyPath: String, watcher: StringProperty.ValueWatcher) -> Bool {    //__SILP__
        if let property: StringProperty = get(propertyPath) {                                                  //__SILP__
            return property.addValueWatcher(watcher)                                                           //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__
                                                                                                               //__SILP__
    public func removeStringValueWatcher(propertyPath: String, watcher: StringProperty.ValueWatcher) -> Bool { //__SILP__
        if let property: StringProperty = get(propertyPath) {                                                  //__SILP__
            return property.removeValueWatcher(watcher)                                                        //__SILP__
        }                                                                                                      //__SILP__
        return false                                                                                           //__SILP__
    }                                                                                                          //__SILP__
}
