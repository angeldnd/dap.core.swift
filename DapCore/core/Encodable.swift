//
//  Encodable.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

/*
 * Only these types are supported:
 *
 * Bool, Int, Float, Double, String
 *
 * Data, [Data]
 *
 */

public protocol Data {
    func getBool(key: String) -> Bool?
    func setBool(key: String, value: Bool) -> Bool
    
    func getInt(key: String) -> Int?
    func setInt(key: String, value: Int) -> Bool
    
    func getFloat(key: String) -> Float?
    func setFloat(key: String, value: Float) -> Bool
    
    func getDouble(key: String) -> Double?
    func setDouble(key: String, value: Double) -> Bool
    
    func getString(key: String) -> String?
    func setString(key: String, value: String) -> Bool
    
    func getData(key: String) -> Data?
    func setData(key: String, value: Data) -> Bool
    
    func getKeys() -> [String]
    
    func newData() -> Data
}

public protocol Encodable {
    var type: String? { get }
    func encode(data: Data) -> Bool
    func decode(data: Data) -> Bool
}

public class DapObject: Encodable {
    public struct Consts {
        static let KeyType = "type"
        static let KeyPath = "path"
        static let KeyAspects = "aspects"
    }
       
    public var type: String? { return nil }
    
    public func encode(data: Data) -> Bool {
        if let type = self.type {
            return data.setString(DapObject.Consts.KeyType, value: type)
        }
        println("Not encodable: \(self)")
        return false
    }
    
    public func decode(data: Data) -> Bool {
        if let type = data.getString(DapObject.Consts.KeyType) {
            if type == self.type {
                return true
            }
        }
        return false
    }
}