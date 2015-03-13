//
//  Var.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public protocol Var : Aspect {
    typealias ValueType
    var value: ValueType? { get }
    func setValue(newValue: ValueType?) -> Bool
}

public class AnyVar<T> : BaseAspect {
    public typealias ValueType = T

    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }

    private var _value: T?
    public var value: T? {
        return _value
    }

    public func setValue(newValue: T?) -> Bool {
        _value = newValue
        return true
    }
 }

//SILP: VAR_CLASS(Bool, Bool)
public class BoolVar : BaseAspect, Var {                                //__SILP__
    public typealias ValueType = Bool                                   //__SILP__
                                                                        //__SILP__
    public override var type: String? {                                 //__SILP__
        return Vars.Consts.TypeBoolVar                                  //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public required init(entity: Entity, path: String) {                //__SILP__
        super.init(entity: entity, path: path)                          //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    private var _value: Bool?                                           //__SILP__
    public var value: Bool? {                                           //__SILP__
        return _value                                                   //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func setValue(newValue: Bool?) -> Bool {                     //__SILP__
        _value = newValue                                               //__SILP__
        return true                                                     //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public override func encode() -> Data? {                            //__SILP__
        if let data = super.encode() {                                  //__SILP__
            if _value != nil {                                          //__SILP__
                if data.setBool(Vars.Consts.KeyValue, value: _value!) { //__SILP__
                    return data                                         //__SILP__
                }                                                       //__SILP__
            }                                                           //__SILP__
        }                                                               //__SILP__
        return nil;                                                     //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public override func decode(data: Data) -> Bool {                   //__SILP__
        if !super.decode(data) { return false }                         //__SILP__
                                                                        //__SILP__
        _value = data.getBool(Vars.Consts.KeyValue)                     //__SILP__
        return true;                                                    //__SILP__
    }                                                                   //__SILP__
}                                                                       //__SILP__
                                                                        //__SILP__
//SILP: VAR_CLASS(Int, Int32)
public class IntVar : BaseAspect, Var {                                //__SILP__
    public typealias ValueType = Int32                                 //__SILP__
                                                                       //__SILP__
    public override var type: String? {                                //__SILP__
        return Vars.Consts.TypeIntVar                                  //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public required init(entity: Entity, path: String) {               //__SILP__
        super.init(entity: entity, path: path)                         //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    private var _value: Int32?                                         //__SILP__
    public var value: Int32? {                                         //__SILP__
        return _value                                                  //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public func setValue(newValue: Int32?) -> Bool {                   //__SILP__
        _value = newValue                                              //__SILP__
        return true                                                    //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public override func encode() -> Data? {                           //__SILP__
        if let data = super.encode() {                                 //__SILP__
            if _value != nil {                                         //__SILP__
                if data.setInt(Vars.Consts.KeyValue, value: _value!) { //__SILP__
                    return data                                        //__SILP__
                }                                                      //__SILP__
            }                                                          //__SILP__
        }                                                              //__SILP__
        return nil;                                                    //__SILP__
    }                                                                  //__SILP__
                                                                       //__SILP__
    public override func decode(data: Data) -> Bool {                  //__SILP__
        if !super.decode(data) { return false }                        //__SILP__
                                                                       //__SILP__
        _value = data.getInt(Vars.Consts.KeyValue)                     //__SILP__
        return true;                                                   //__SILP__
    }                                                                  //__SILP__
}                                                                      //__SILP__
                                                                       //__SILP__
//SILP: VAR_CLASS(Long, Int64)
public class LongVar : BaseAspect, Var {                                //__SILP__
    public typealias ValueType = Int64                                  //__SILP__
                                                                        //__SILP__
    public override var type: String? {                                 //__SILP__
        return Vars.Consts.TypeLongVar                                  //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public required init(entity: Entity, path: String) {                //__SILP__
        super.init(entity: entity, path: path)                          //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    private var _value: Int64?                                          //__SILP__
    public var value: Int64? {                                          //__SILP__
        return _value                                                   //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public func setValue(newValue: Int64?) -> Bool {                    //__SILP__
        _value = newValue                                               //__SILP__
        return true                                                     //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public override func encode() -> Data? {                            //__SILP__
        if let data = super.encode() {                                  //__SILP__
            if _value != nil {                                          //__SILP__
                if data.setLong(Vars.Consts.KeyValue, value: _value!) { //__SILP__
                    return data                                         //__SILP__
                }                                                       //__SILP__
            }                                                           //__SILP__
        }                                                               //__SILP__
        return nil;                                                     //__SILP__
    }                                                                   //__SILP__
                                                                        //__SILP__
    public override func decode(data: Data) -> Bool {                   //__SILP__
        if !super.decode(data) { return false }                         //__SILP__
                                                                        //__SILP__
        _value = data.getLong(Vars.Consts.KeyValue)                     //__SILP__
        return true;                                                    //__SILP__
    }                                                                   //__SILP__
}                                                                       //__SILP__
                                                                        //__SILP__
//SILP: VAR_CLASS(Float, Float)
public class FloatVar : BaseAspect, Var {                                //__SILP__
    public typealias ValueType = Float                                   //__SILP__
                                                                         //__SILP__
    public override var type: String? {                                  //__SILP__
        return Vars.Consts.TypeFloatVar                                  //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public required init(entity: Entity, path: String) {                 //__SILP__
        super.init(entity: entity, path: path)                           //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    private var _value: Float?                                           //__SILP__
    public var value: Float? {                                           //__SILP__
        return _value                                                    //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public func setValue(newValue: Float?) -> Bool {                     //__SILP__
        _value = newValue                                                //__SILP__
        return true                                                      //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public override func encode() -> Data? {                             //__SILP__
        if let data = super.encode() {                                   //__SILP__
            if _value != nil {                                           //__SILP__
                if data.setFloat(Vars.Consts.KeyValue, value: _value!) { //__SILP__
                    return data                                          //__SILP__
                }                                                        //__SILP__
            }                                                            //__SILP__
        }                                                                //__SILP__
        return nil;                                                      //__SILP__
    }                                                                    //__SILP__
                                                                         //__SILP__
    public override func decode(data: Data) -> Bool {                    //__SILP__
        if !super.decode(data) { return false }                          //__SILP__
                                                                         //__SILP__
        _value = data.getFloat(Vars.Consts.KeyValue)                     //__SILP__
        return true;                                                     //__SILP__
    }                                                                    //__SILP__
}                                                                        //__SILP__
                                                                         //__SILP__
//SILP: VAR_CLASS(Double, Double)
public class DoubleVar : BaseAspect, Var {                                //__SILP__
    public typealias ValueType = Double                                   //__SILP__
                                                                          //__SILP__
    public override var type: String? {                                   //__SILP__
        return Vars.Consts.TypeDoubleVar                                  //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public required init(entity: Entity, path: String) {                  //__SILP__
        super.init(entity: entity, path: path)                            //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    private var _value: Double?                                           //__SILP__
    public var value: Double? {                                           //__SILP__
        return _value                                                     //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public func setValue(newValue: Double?) -> Bool {                     //__SILP__
        _value = newValue                                                 //__SILP__
        return true                                                       //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public override func encode() -> Data? {                              //__SILP__
        if let data = super.encode() {                                    //__SILP__
            if _value != nil {                                            //__SILP__
                if data.setDouble(Vars.Consts.KeyValue, value: _value!) { //__SILP__
                    return data                                           //__SILP__
                }                                                         //__SILP__
            }                                                             //__SILP__
        }                                                                 //__SILP__
        return nil;                                                       //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public override func decode(data: Data) -> Bool {                     //__SILP__
        if !super.decode(data) { return false }                           //__SILP__
                                                                          //__SILP__
        _value = data.getDouble(Vars.Consts.KeyValue)                     //__SILP__
        return true;                                                      //__SILP__
    }                                                                     //__SILP__
}                                                                         //__SILP__
                                                                          //__SILP__
//SILP: VAR_CLASS(String, String)
public class StringVar : BaseAspect, Var {                                //__SILP__
    public typealias ValueType = String                                   //__SILP__
                                                                          //__SILP__
    public override var type: String? {                                   //__SILP__
        return Vars.Consts.TypeStringVar                                  //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public required init(entity: Entity, path: String) {                  //__SILP__
        super.init(entity: entity, path: path)                            //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    private var _value: String?                                           //__SILP__
    public var value: String? {                                           //__SILP__
        return _value                                                     //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public func setValue(newValue: String?) -> Bool {                     //__SILP__
        _value = newValue                                                 //__SILP__
        return true                                                       //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public override func encode() -> Data? {                              //__SILP__
        if let data = super.encode() {                                    //__SILP__
            if _value != nil {                                            //__SILP__
                if data.setString(Vars.Consts.KeyValue, value: _value!) { //__SILP__
                    return data                                           //__SILP__
                }                                                         //__SILP__
            }                                                             //__SILP__
        }                                                                 //__SILP__
        return nil;                                                       //__SILP__
    }                                                                     //__SILP__
                                                                          //__SILP__
    public override func decode(data: Data) -> Bool {                     //__SILP__
        if !super.decode(data) { return false }                           //__SILP__
                                                                          //__SILP__
        _value = data.getString(Vars.Consts.KeyValue)                     //__SILP__
        return true;                                                      //__SILP__
    }                                                                     //__SILP__
}                                                                         //__SILP__
                                                                          //__SILP__
