//
//  VarsHelper.swift
//  DapCore
//
//  Created by YJ Park on 14/11/10.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

extension Vars {
    //SILP: VARS_HELPER(Bool, Bool)
    public func addBool(path: String, _ value: Bool) -> BoolVar? {    //__SILP__
        if let v: BoolVar = addVar(path, value: value) {              //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func removeBool(path: String) -> BoolVar? {                //__SILP__
        if let v: BoolVar = remove(path) {                            //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func isBool(path: String) -> Bool {                        //__SILP__
        if let v: BoolVar = get(path) {                               //__SILP__
            return true                                               //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getBool(path: String) -> Bool? {                      //__SILP__
        if let v: BoolVar = get(path) {                               //__SILP__
            return v.value                                            //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setBool(path: String, _ value: Bool) -> Bool? {       //__SILP__
        if let v: BoolVar = get(path) {                               //__SILP__
            return v.setValue(value)                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
    //SILP: VARS_HELPER(Int, Int32)
    public func addInt(path: String, _ value: Int32) -> IntVar? {     //__SILP__
        if let v: IntVar = addVar(path, value: value) {               //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func removeInt(path: String) -> IntVar? {                  //__SILP__
        if let v: IntVar = remove(path) {                             //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func isInt(path: String) -> Bool {                         //__SILP__
        if let v: IntVar = get(path) {                                //__SILP__
            return true                                               //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getInt(path: String) -> Int32? {                      //__SILP__
        if let v: IntVar = get(path) {                                //__SILP__
            return v.value                                            //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setInt(path: String, _ value: Int32) -> Bool? {       //__SILP__
        if let v: IntVar = get(path) {                                //__SILP__
            return v.setValue(value)                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
    //SILP: VARS_HELPER(Long, Int64)
    public func addLong(path: String, _ value: Int64) -> LongVar? {   //__SILP__
        if let v: LongVar = addVar(path, value: value) {              //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func removeLong(path: String) -> LongVar? {                //__SILP__
        if let v: LongVar = remove(path) {                            //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func isLong(path: String) -> Bool {                        //__SILP__
        if let v: LongVar = get(path) {                               //__SILP__
            return true                                               //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getLong(path: String) -> Int64? {                     //__SILP__
        if let v: LongVar = get(path) {                               //__SILP__
            return v.value                                            //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setLong(path: String, _ value: Int64) -> Bool? {      //__SILP__
        if let v: LongVar = get(path) {                               //__SILP__
            return v.setValue(value)                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
    //SILP: VARS_HELPER(Float, Float)
    public func addFloat(path: String, _ value: Float) -> FloatVar? { //__SILP__
        if let v: FloatVar = addVar(path, value: value) {             //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func removeFloat(path: String) -> FloatVar? {              //__SILP__
        if let v: FloatVar = remove(path) {                           //__SILP__
            return v                                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func isFloat(path: String) -> Bool {                       //__SILP__
        if let v: FloatVar = get(path) {                              //__SILP__
            return true                                               //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getFloat(path: String) -> Float? {                    //__SILP__
        if let v: FloatVar = get(path) {                              //__SILP__
            return v.value                                            //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setFloat(path: String, _ value: Float) -> Bool? {     //__SILP__
        if let v: FloatVar = get(path) {                              //__SILP__
            return v.setValue(value)                                  //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
    //SILP: VARS_HELPER(Double, Double)
    public func addDouble(path: String, _ value: Double) -> DoubleVar? { //__SILP__
        if let v: DoubleVar = addVar(path, value: value) {               //__SILP__
            return v                                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func removeDouble(path: String) -> DoubleVar? {               //__SILP__
        if let v: DoubleVar = remove(path) {                             //__SILP__
            return v                                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func isDouble(path: String) -> Bool {                         //__SILP__
        if let v: DoubleVar = get(path) {                                //__SILP__
            return true                                                  //__SILP__
        }                                                                //__SILP__
        return false                                                     //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getDouble(path: String) -> Double? {                     //__SILP__
        if let v: DoubleVar = get(path) {                                //__SILP__
            return v.value                                               //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func setDouble(path: String, _ value: Double) -> Bool? {      //__SILP__
        if let v: DoubleVar = get(path) {                                //__SILP__
            return v.setValue(value)                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
    //SILP: VARS_HELPER(String, String)
    public func addString(path: String, _ value: String) -> StringVar? { //__SILP__
        if let v: StringVar = addVar(path, value: value) {               //__SILP__
            return v                                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func removeString(path: String) -> StringVar? {               //__SILP__
        if let v: StringVar = remove(path) {                             //__SILP__
            return v                                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func isString(path: String) -> Bool {                         //__SILP__
        if let v: StringVar = get(path) {                                //__SILP__
            return true                                                  //__SILP__
        }                                                                //__SILP__
        return false                                                     //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getString(path: String) -> String? {                     //__SILP__
        if let v: StringVar = get(path) {                                //__SILP__
            return v.value                                               //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func setString(path: String, _ value: String) -> Bool? {      //__SILP__
        if let v: StringVar = get(path) {                                //__SILP__
            return v.setValue(value)                                     //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
}
