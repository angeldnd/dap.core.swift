//
//  ContextHelper.swift
//  DAP
//
//  Created by YJ Park on 14/11/10.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

extension Context {
    public func dump(data: Data) -> Bool {
        return properties.dump(data);
    }
    
    public func load(data: Data) -> Bool {
        return properties.load(data);
    }
    
    public func send(path: String, _ data: Data? = nil) -> Bool? {
        return channels.send(path, data: data)
    }

    public func handle(path: String, _ data: Data) -> Data? {
        return handlers.handle(path, data: data)
    }
    
    //SILP: CONTEXT_PROPERTIES_HELPER(Bool)
    public func addBool(path: String, _ value: Bool) -> BoolProperty? { //__SILP__
        return properties.addBool(path, value)                          //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func removeBool(path: String) -> BoolProperty? {             //__SILP__
        return properties.removeBool(path)                              //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func isBool(path: String) -> Bool {                          //__SILP__
        return properties.isBool(path)                                  //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func getBool(path: String) -> Bool? {                        //__SILP__
        return properties.getBool(path)                                 //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func setBool(path: String, _ value: Bool) -> Bool? {         //__SILP__
        return properties.setBool(path, value)                          //__SILP__
    }                                                                   //__SILP__
    //SILP: CONTEXT_PROPERTIES_HELPER(Int)
    public func addInt(path: String, _ value: Int) -> IntProperty? {  //__SILP__
        return properties.addInt(path, value)                         //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func removeInt(path: String) -> IntProperty? {             //__SILP__
        return properties.removeInt(path)                             //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func isInt(path: String) -> Bool {                         //__SILP__
        return properties.isInt(path)                                 //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func getInt(path: String) -> Int? {                        //__SILP__
        return properties.getInt(path)                                //__SILP__
    }                                                                 //__SILP__
                                                                      //__SILP__
    public func setInt(path: String, _ value: Int) -> Bool? {         //__SILP__
        return properties.setInt(path, value)                         //__SILP__
    }                                                                 //__SILP__
    //SILP: CONTEXT_PROPERTIES_HELPER(Float)
    public func addFloat(path: String, _ value: Float) -> FloatProperty? { //__SILP__
        return properties.addFloat(path, value)                            //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func removeFloat(path: String) -> FloatProperty? {              //__SILP__
        return properties.removeFloat(path)                                //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func isFloat(path: String) -> Bool {                            //__SILP__
        return properties.isFloat(path)                                    //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func getFloat(path: String) -> Float? {                         //__SILP__
        return properties.getFloat(path)                                   //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public func setFloat(path: String, _ value: Float) -> Bool? {          //__SILP__
        return properties.setFloat(path, value)                            //__SILP__
    }                                                                      //__SILP__
    //SILP: CONTEXT_PROPERTIES_HELPER(Double)
    public func addDouble(path: String, _ value: Double) -> DoubleProperty? { //__SILP__
        return properties.addDouble(path, value)                              //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func removeDouble(path: String) -> DoubleProperty? {               //__SILP__
        return properties.removeDouble(path)                                  //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func isDouble(path: String) -> Bool {                              //__SILP__
        return properties.isDouble(path)                                      //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func getDouble(path: String) -> Double? {                          //__SILP__
        return properties.getDouble(path)                                     //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func setDouble(path: String, _ value: Double) -> Bool? {           //__SILP__
        return properties.setDouble(path, value)                              //__SILP__
    }                                                                         //__SILP__
    //SILP: CONTEXT_PROPERTIES_HELPER(String)
    public func addString(path: String, _ value: String) -> StringProperty? { //__SILP__
        return properties.addString(path, value)                              //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func removeString(path: String) -> StringProperty? {               //__SILP__
        return properties.removeString(path)                                  //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func isString(path: String) -> Bool {                              //__SILP__
        return properties.isString(path)                                      //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func getString(path: String) -> String? {                          //__SILP__
        return properties.getString(path)                                     //__SILP__
    }                                                                         //__SILP__
                                                                              //__SILP__
    public func setString(path: String, _ value: String) -> Bool? {           //__SILP__
        return properties.setString(path, value)                              //__SILP__
    }                                                                         //__SILP__
}