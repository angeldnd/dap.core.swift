//
//  PropertiesHelper.swift
//  DapCore
//
//  Created by YJ Park on 14/11/10.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

extension Properties {   
    //SILP: PROPERTIES_HELPER(Bool, Bool)
    public func addBool(path: String, _ value: Bool) -> BoolProperty? { //__SILP__
        if let v: BoolProperty = addProperty(path, value: value) {      //__SILP__
            return v                                                    //__SILP__
        }                                                               //__SILP__
        return nil                                                      //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func removeBool(path: String) -> BoolProperty? {             //__SILP__
        if let v: BoolProperty = remove(path) {                         //__SILP__
            return v                                                    //__SILP__
        }                                                               //__SILP__
        return nil                                                      //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func isBool(path: String) -> Bool {                          //__SILP__
        if let property: BoolProperty = get(path) {                     //__SILP__
            return true                                                 //__SILP__
        }                                                               //__SILP__
        return false                                                    //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func getBool(path: String) -> Bool? {                        //__SILP__
        if let property: BoolProperty = get(path) {                     //__SILP__
            if let value = property.value {                             //__SILP__
                return value                                            //__SILP__
            }                                                           //__SILP__
        }                                                               //__SILP__
        return nil                                                      //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func setBool(path: String, _ value: Bool) -> Bool? {         //__SILP__
        if let property: BoolProperty = get(path) {                     //__SILP__
            return property.setValue(value)                             //__SILP__
        }                                                               //__SILP__
        return nil                                                      //__SILP__
    }                                                                   //__SILP__
    //SILP: PROPERTIES_HELPER(Int, Int32)
    public func addInt(path: String, _ value: Int32) -> IntProperty? { //__SILP__
        if let v: IntProperty = addProperty(path, value: value) {      //__SILP__
            return v                                                   //__SILP__
        }                                                              //__SILP__
        return nil                                                     //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func removeInt(path: String) -> IntProperty? {              //__SILP__
        if let v: IntProperty = remove(path) {                         //__SILP__
            return v                                                   //__SILP__
        }                                                              //__SILP__
        return nil                                                     //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func isInt(path: String) -> Bool {                          //__SILP__
        if let property: IntProperty = get(path) {                     //__SILP__
            return true                                                //__SILP__
        }                                                              //__SILP__
        return false                                                   //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func getInt(path: String) -> Int32? {                       //__SILP__
        if let property: IntProperty = get(path) {                     //__SILP__
            if let value = property.value {                            //__SILP__
                return value                                           //__SILP__
            }                                                          //__SILP__
        }                                                              //__SILP__
        return nil                                                     //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func setInt(path: String, _ value: Int32) -> Bool? {        //__SILP__
        if let property: IntProperty = get(path) {                     //__SILP__
            return property.setValue(value)                            //__SILP__
        }                                                              //__SILP__
        return nil                                                     //__SILP__
    }                                                                  //__SILP__
    //SILP: PROPERTIES_HELPER(Long, Int64)
    public func addLong(path: String, _ value: Int64) -> LongProperty? { //__SILP__
        if let v: LongProperty = addProperty(path, value: value) {       //__SILP__
            return v                                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func removeLong(path: String) -> LongProperty? {              //__SILP__
        if let v: LongProperty = remove(path) {                          //__SILP__
            return v                                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func isLong(path: String) -> Bool {                           //__SILP__
        if let property: LongProperty = get(path) {                      //__SILP__
            return true                                                  //__SILP__
        }                                                                //__SILP__
        return false                                                     //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getLong(path: String) -> Int64? {                        //__SILP__
        if let property: LongProperty = get(path) {                      //__SILP__
            if let value = property.value {                              //__SILP__
                return value                                             //__SILP__
            }                                                            //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func setLong(path: String, _ value: Int64) -> Bool? {         //__SILP__
        if let property: LongProperty = get(path) {                      //__SILP__
            return property.setValue(value)                              //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
    //SILP: PROPERTIES_HELPER(Float, Float)
    public func addFloat(path: String, _ value: Float) -> FloatProperty? { //__SILP__
        if let v: FloatProperty = addProperty(path, value: value) {        //__SILP__
            return v                                                       //__SILP__
        }                                                                  //__SILP__
        return nil                                                         //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func removeFloat(path: String) -> FloatProperty? {              //__SILP__
        if let v: FloatProperty = remove(path) {                           //__SILP__
            return v                                                       //__SILP__
        }                                                                  //__SILP__
        return nil                                                         //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func isFloat(path: String) -> Bool {                            //__SILP__
        if let property: FloatProperty = get(path) {                       //__SILP__
            return true                                                    //__SILP__
        }                                                                  //__SILP__
        return false                                                       //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func getFloat(path: String) -> Float? {                         //__SILP__
        if let property: FloatProperty = get(path) {                       //__SILP__
            if let value = property.value {                                //__SILP__
                return value                                               //__SILP__
            }                                                              //__SILP__
        }                                                                  //__SILP__
        return nil                                                         //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func setFloat(path: String, _ value: Float) -> Bool? {          //__SILP__
        if let property: FloatProperty = get(path) {                       //__SILP__
            return property.setValue(value)                                //__SILP__
        }                                                                  //__SILP__
        return nil                                                         //__SILP__
    }                                                                      //__SILP__
    //SILP: PROPERTIES_HELPER(Double, Double)
    public func addDouble(path: String, _ value: Double) -> DoubleProperty? { //__SILP__
        if let v: DoubleProperty = addProperty(path, value: value) {          //__SILP__
            return v                                                          //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func removeDouble(path: String) -> DoubleProperty? {               //__SILP__
        if let v: DoubleProperty = remove(path) {                             //__SILP__
            return v                                                          //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func isDouble(path: String) -> Bool {                              //__SILP__
        if let property: DoubleProperty = get(path) {                         //__SILP__
            return true                                                       //__SILP__
        }                                                                     //__SILP__
        return false                                                          //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func getDouble(path: String) -> Double? {                          //__SILP__
        if let property: DoubleProperty = get(path) {                         //__SILP__
            if let value = property.value {                                   //__SILP__
                return value                                                  //__SILP__
            }                                                                 //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func setDouble(path: String, _ value: Double) -> Bool? {           //__SILP__
        if let property: DoubleProperty = get(path) {                         //__SILP__
            return property.setValue(value)                                   //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
    //SILP: PROPERTIES_HELPER(String, String)
    public func addString(path: String, _ value: String) -> StringProperty? { //__SILP__
        if let v: StringProperty = addProperty(path, value: value) {          //__SILP__
            return v                                                          //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func removeString(path: String) -> StringProperty? {               //__SILP__
        if let v: StringProperty = remove(path) {                             //__SILP__
            return v                                                          //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func isString(path: String) -> Bool {                              //__SILP__
        if let property: StringProperty = get(path) {                         //__SILP__
            return true                                                       //__SILP__
        }                                                                     //__SILP__
        return false                                                          //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func getString(path: String) -> String? {                          //__SILP__
        if let property: StringProperty = get(path) {                         //__SILP__
            if let value = property.value {                                   //__SILP__
                return value                                                  //__SILP__
            }                                                                 //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func setString(path: String, _ value: String) -> Bool? {           //__SILP__
        if let property: StringProperty = get(path) {                         //__SILP__
            return property.setValue(value)                                   //__SILP__
        }                                                                     //__SILP__
        return nil                                                            //__SILP__
    }                                                                         //__SILP__
}
