//
//  ContextHelper.swift
//  DapCore
//
//  Created by YJ Park on 14/11/10.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

extension Context {
    public func dump() -> Data? {
        if let data = properties.encode() {
            return data.getData(Entity.Consts.KeyAspects)
        }
        return nil
    }
    
    public func load(data: Data) -> Bool {
        var (succeedCount, failedCount) = properties.decodeAspects(data)
        return succeedCount > 0 || failedCount <= 0
    }
    
    public func fireEvent(channelPath: String, _ evt: Data? = nil) -> Bool? {
        return channels.fireEvent(channelPath, evt: evt)
    }

    public func handleRequest(path: String, _ req: Data) -> Data? {
        return handlers.handleRequest(path, req: req)
    }
    
    //SILP: CONTEXT_PROPERTIES_HELPER(Bool, Bool)
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
    //SILP: CONTEXT_PROPERTIES_HELPER(Int, Int32)
    public func addInt(path: String, _ value: Int32) -> IntProperty? { //__SILP__
        return properties.addInt(path, value)                          //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func removeInt(path: String) -> IntProperty? {              //__SILP__
        return properties.removeInt(path)                              //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func isInt(path: String) -> Bool {                          //__SILP__
        return properties.isInt(path)                                  //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func getInt(path: String) -> Int32? {                       //__SILP__
        return properties.getInt(path)                                 //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func setInt(path: String, _ value: Int32) -> Bool? {        //__SILP__
        return properties.setInt(path, value)                          //__SILP__
    }                                                                  //__SILP__
    //SILP: CONTEXT_PROPERTIES_HELPER(Long, Int64)
    public func addLong(path: String, _ value: Int64) -> LongProperty? { //__SILP__
        return properties.addLong(path, value)                           //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func removeLong(path: String) -> LongProperty? {              //__SILP__
        return properties.removeLong(path)                               //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func isLong(path: String) -> Bool {                           //__SILP__
        return properties.isLong(path)                                   //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func getLong(path: String) -> Int64? {                        //__SILP__
        return properties.getLong(path)                                  //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func setLong(path: String, _ value: Int64) -> Bool? {         //__SILP__
        return properties.setLong(path, value)                           //__SILP__
    }                                                                    //__SILP__
    //SILP: CONTEXT_PROPERTIES_HELPER(Float, Float)
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
    //SILP: CONTEXT_PROPERTIES_HELPER(Double, Double)
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
    //SILP: CONTEXT_PROPERTIES_HELPER(String, String)
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