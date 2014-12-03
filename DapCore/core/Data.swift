//
//  Data.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

/*
* Only these types are supported:
*
* Bool, Int, Float, Double, String, Data
*
*/

@objc public final class Data {
    public enum DataType: Int32 {
        case BOOL = 1
        case INT = 2
        case LONG = 3
        case FLOAT = 4
        case DOUBLE = 5
        case STRING = 6
        case DATA = 7
        case NUMBER = 8
    }
    public class var INVALID: Int32 {
        return 0
    }
    public class var BOOL: Int32 {
        return DataType.BOOL.rawValue
    }
    public class var INT: Int32 {
        return DataType.INT.rawValue
    }
    public class var LONG: Int32 {
        return DataType.LONG.rawValue
    }
    public class var FLOAT: Int32 {
        return DataType.FLOAT.rawValue
    }
    public class var DOUBLE: Int32 {
        return DataType.DOUBLE.rawValue
    }
    public class var STRING: Int32 {
        return DataType.STRING.rawValue
    }
    public class var DATA: Int32 {
        return DataType.DATA.rawValue
    }
    public class var NUMBER: Int32 {
        return DataType.NUMBER.rawValue
    }
    public class func data() -> Data {
        return Data()
    }
    
    private var _data = Dictionary<String, Any>()
    
    public init() {
    }
    
    public func getKeys() -> [String] {
        var result = [String]()
        for key in _data.keys {
            result.append(key)
        }
        return result
    }
    
    public func getType(key: String) -> DataType? {
        if let value = _data[key] {
            switch value {
            case is Bool:
                return DataType.BOOL
            case is Int32:
                return DataType.INT
            case is Int64:
                return DataType.LONG
            case is Float:
                return DataType.FLOAT
            case is Double:
                return DataType.DOUBLE
            case is String:
                return DataType.STRING
            case is Data:
                return DataType.DATA
            default:
                return nil
            }
        }
        return nil
    }
    
    public func getTypeAsInt(key: String) -> Int32 {
        if let type = getType(key) {
            return type.rawValue
        }
        return Data.INVALID
    }

    //SILP: DATA_TYPE(Number, NSNumber)
    public func isNumber(key: String) -> Bool {                              //__SILP__
        if let value = _data[key] as? NSNumber {                             //__SILP__
            return true                                                      //__SILP__
        }                                                                    //__SILP__
        return false                                                         //__SILP__
    }                                                                        //__SILP__
                                                                             //__SILP__
    public func getNumber(key: String) -> NSNumber? {                        //__SILP__
        if let value = _data[key] as? NSNumber {                             //__SILP__
            return value                                                     //__SILP__
        }                                                                    //__SILP__
        return nil                                                           //__SILP__
    }                                                                        //__SILP__
                                                                             //__SILP__
    public func getNumber(key: String, defaultValue: NSNumber) -> NSNumber { //__SILP__
        if let value = _data[key] as? NSNumber {                             //__SILP__
            return value                                                     //__SILP__
        }                                                                    //__SILP__
        return defaultValue                                                  //__SILP__
    }                                                                        //__SILP__
                                                                             //__SILP__
    public func setNumber(key: String, value: NSNumber) -> Bool {            //__SILP__
        if _data[key] == nil {                                               //__SILP__
            _data[key] = value                                               //__SILP__
        }                                                                    //__SILP__
        return false                                                         //__SILP__
    }                                                                        //__SILP__
                                                                             //__SILP__
    //SILP: DATA_TYPE(Bool, Bool)
    public func isBool(key: String) -> Bool {                         //__SILP__
        if let value = _data[key] as? Bool {                          //__SILP__
            return true                                               //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getBool(key: String) -> Bool? {                       //__SILP__
        if let value = _data[key] as? Bool {                          //__SILP__
            return value                                              //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getBool(key: String, defaultValue: Bool) -> Bool {    //__SILP__
        if let value = _data[key] as? Bool {                          //__SILP__
            return value                                              //__SILP__
        }                                                             //__SILP__
        return defaultValue                                           //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setBool(key: String, value: Bool) -> Bool {           //__SILP__
        if _data[key] == nil {                                        //__SILP__
            _data[key] = value                                        //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    //SILP: DATA_NUMBER_TYPE(Int, Int32, int)
    public func isInt(key: String) -> Bool {                          //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Int32 {                         //__SILP__
                return true                                           //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return true                                           //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getInt(key: String) -> Int32? {                       //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Int32 {                         //__SILP__
                return value                                          //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return value.intValue                                 //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getInt(key: String, defaultValue: Int32) -> Int32 {   //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Int32 {                         //__SILP__
                return value                                          //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return value.intValue                                 //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return defaultValue                                           //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setInt(key: String, value: Int32) -> Bool {           //__SILP__
        if _data[key] == nil {                                        //__SILP__
            _data[key] = value                                        //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    //SILP: DATA_NUMBER_TYPE(Long, Int64, longLong)
    public func isLong(key: String) -> Bool {                         //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Int64 {                         //__SILP__
                return true                                           //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return true                                           //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getLong(key: String) -> Int64? {                      //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Int64 {                         //__SILP__
                return value                                          //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return value.longLongValue                            //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getLong(key: String, defaultValue: Int64) -> Int64 {  //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Int64 {                         //__SILP__
                return value                                          //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return value.longLongValue                            //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return defaultValue                                           //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setLong(key: String, value: Int64) -> Bool {          //__SILP__
        if _data[key] == nil {                                        //__SILP__
            _data[key] = value                                        //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    //SILP: DATA_NUMBER_TYPE(Float, Float, float)
    public func isFloat(key: String) -> Bool {                        //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Float {                         //__SILP__
                return true                                           //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return true                                           //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getFloat(key: String) -> Float? {                     //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Float {                         //__SILP__
                return value                                          //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return value.floatValue                               //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getFloat(key: String, defaultValue: Float) -> Float { //__SILP__
        if let _value = _data[key] {                                  //__SILP__
            if let value = _value as? Float {                         //__SILP__
                return value                                          //__SILP__
            } else if let value = _value as? NSNumber {               //__SILP__
                return value.floatValue                               //__SILP__
            }                                                         //__SILP__
        }                                                             //__SILP__
        return defaultValue                                           //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setFloat(key: String, value: Float) -> Bool {         //__SILP__
        if _data[key] == nil {                                        //__SILP__
            _data[key] = value                                        //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    //SILP: DATA_NUMBER_TYPE(Double, Double, double)
    public func isDouble(key: String) -> Bool {                          //__SILP__
        if let _value = _data[key] {                                     //__SILP__
            if let value = _value as? Double {                           //__SILP__
                return true                                              //__SILP__
            } else if let value = _value as? NSNumber {                  //__SILP__
                return true                                              //__SILP__
            }                                                            //__SILP__
        }                                                                //__SILP__
        return false                                                     //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getDouble(key: String) -> Double? {                      //__SILP__
        if let _value = _data[key] {                                     //__SILP__
            if let value = _value as? Double {                           //__SILP__
                return value                                             //__SILP__
            } else if let value = _value as? NSNumber {                  //__SILP__
                return value.doubleValue                                 //__SILP__
            }                                                            //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getDouble(key: String, defaultValue: Double) -> Double { //__SILP__
        if let _value = _data[key] {                                     //__SILP__
            if let value = _value as? Double {                           //__SILP__
                return value                                             //__SILP__
            } else if let value = _value as? NSNumber {                  //__SILP__
                return value.doubleValue                                 //__SILP__
            }                                                            //__SILP__
        }                                                                //__SILP__
        return defaultValue                                              //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func setDouble(key: String, value: Double) -> Bool {          //__SILP__
        if _data[key] == nil {                                           //__SILP__
            _data[key] = value                                           //__SILP__
        }                                                                //__SILP__
        return false                                                     //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    //SILP: DATA_TYPE(String, String)
    public func isString(key: String) -> Bool {                          //__SILP__
        if let value = _data[key] as? String {                           //__SILP__
            return true                                                  //__SILP__
        }                                                                //__SILP__
        return false                                                     //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getString(key: String) -> String? {                      //__SILP__
        if let value = _data[key] as? String {                           //__SILP__
            return value                                                 //__SILP__
        }                                                                //__SILP__
        return nil                                                       //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getString(key: String, defaultValue: String) -> String { //__SILP__
        if let value = _data[key] as? String {                           //__SILP__
            return value                                                 //__SILP__
        }                                                                //__SILP__
        return defaultValue                                              //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func setString(key: String, value: String) -> Bool {          //__SILP__
        if _data[key] == nil {                                           //__SILP__
            _data[key] = value                                           //__SILP__
        }                                                                //__SILP__
        return false                                                     //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    //SILP: DATA_TYPE(Data, Data)
    public func isData(key: String) -> Bool {                         //__SILP__
        if let value = _data[key] as? Data {                          //__SILP__
            return true                                               //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getData(key: String) -> Data? {                       //__SILP__
        if let value = _data[key] as? Data {                          //__SILP__
            return value                                              //__SILP__
        }                                                             //__SILP__
        return nil                                                    //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getData(key: String, defaultValue: Data) -> Data {    //__SILP__
        if let value = _data[key] as? Data {                          //__SILP__
            return value                                              //__SILP__
        }                                                             //__SILP__
        return defaultValue                                           //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setData(key: String, value: Data) -> Bool {           //__SILP__
        if _data[key] == nil {                                        //__SILP__
            _data[key] = value                                        //__SILP__
        }                                                             //__SILP__
        return false                                                  //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
}