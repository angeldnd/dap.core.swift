//
//  DapObject.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class DapObject {
    public struct Consts {
        static let KeyType = "type"
    }
       
    public var type: String? { return nil }
    
    public func encode() -> Data? {
        if let type = self.type {
            var data = Data()
            if data.setString(DapObject.Consts.KeyType, value: type) {
                return data
            }
        }
        println("Not encodable: \(self)")
        return nil
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