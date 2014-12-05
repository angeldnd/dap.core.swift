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
        
        public static let TypeBoolProperty = "BoolProperty"
        public static let TypeIntProperty = "IntProperty"
        public static let TypeLongProperty = "LongProperty"
        public static let TypeFloatProperty = "FloatProperty"
        public static let TypeDoubleProperty = "DoubleProperty"
        public static let TypeStringProperty = "StringProperty"
        
    }

    public override var type: String? { return Consts.TypeProperties }
    
    public final func addProperty<T: Property>(path: String, value: T.ValueType?) -> T? {
        if let property: T = add(path) {
            property.setValue(value)
            return property
        }
        return nil
    }
    
    //SILP: ADD_REMOVE_HELPER(ValueChecker<T: Property>, propertyPath, property, T, ValueChecker, checker, T.ValueChecker)
    public func addValueChecker<T: Property>(propertyPath: String, checker: T.ValueChecker) -> Bool {    //__SILP__
        if let property: T = get(propertyPath) {                                                         //__SILP__
            return property.addValueChecker(checker)                                                     //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__
                                                                                                         //__SILP__
    public func removeValueChecker<T: Property>(propertyPath: String, checker: T.ValueChecker) -> Bool { //__SILP__
        if let property: T = get(propertyPath) {                                                         //__SILP__
            return property.removeValueChecker(checker)                                                  //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__
    
    //SILP: ADD_REMOVE_HELPER(ValueWatcher<T: Property>, propertyPath, property, T, ValueWatcher, checker, T.ValueWatcher)
    public func addValueWatcher<T: Property>(propertyPath: String, checker: T.ValueWatcher) -> Bool {    //__SILP__
        if let property: T = get(propertyPath) {                                                         //__SILP__
            return property.addValueWatcher(checker)                                                     //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__
                                                                                                         //__SILP__
    public func removeValueWatcher<T: Property>(propertyPath: String, checker: T.ValueWatcher) -> Bool { //__SILP__
        if let property: T = get(propertyPath) {                                                         //__SILP__
            return property.removeValueWatcher(checker)                                                  //__SILP__
        }                                                                                                //__SILP__
        return false                                                                                     //__SILP__
    }                                                                                                    //__SILP__
}