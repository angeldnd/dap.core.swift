//
//  Var.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public typealias BoolVar = Var<Bool>
public typealias IntVar = Var<Int32>
public typealias LongVar = Var<Int64>
public typealias FloatVar = Var<Float>
public typealias DoubleVar = Var<Double>
public typealias StringVar = Var<String>

public class Var<T> : BaseAspect {
   public override var type: String? {
        switch T.self {
        case is Bool.Type:
            return Vars.Consts.TypeBoolVar
        case is Int32.Type:
            return Vars.Consts.TypeIntVar
        case is Int64.Type:
            return Vars.Consts.TypeLongVar
        case is Float.Type:
            return Vars.Consts.TypeFloatVar
        case is Double.Type:
            return Vars.Consts.TypeDoubleVar
        case is String.Type:
            return Vars.Consts.TypeStringVar
        default:
            return nil;
        }
    }
    
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
    
    public override func encode() -> Data? {
        if let data = super.encode() {
            if _value != nil {
                var succeed = false
                switch T.self {
                case is Bool.Type:
                    succeed = data.setBool(Vars.Consts.KeyValue, value: _value as Bool)
                case is Int32.Type:
                    succeed = data.setInt(Vars.Consts.KeyValue, value: _value as Int32)
                case is Int64.Type:
                    succeed = data.setLong(Vars.Consts.KeyValue, value: _value as Int64)
                case is Float.Type:
                    succeed = data.setFloat(Vars.Consts.KeyValue, value: _value as Float)
                case is Double.Type:
                    succeed = data.setDouble(Vars.Consts.KeyValue, value: _value as Double)
                case is String.Type:
                    succeed = data.setString(Vars.Consts.KeyValue, value: _value as String)
                default:
                    succeed = false
                }
                if (succeed) {
                    return data
                }
            }
        }
        return nil;
    }
    
    public override func decode(data: Data) -> Bool {
        if !super.decode(data) { return false }
        
        switch T.self {
        case is Bool.Type:
            _value = data.getBool(Vars.Consts.KeyValue) as? T
        case is Int32.Type:
            _value = data.getInt(Vars.Consts.KeyValue) as? T
        case is Int64.Type:
            _value = data.getLong(Vars.Consts.KeyValue) as? T
        case is Float.Type:
            _value = data.getFloat(Vars.Consts.KeyValue) as? T
        case is Double.Type:
            _value = data.getDouble(Vars.Consts.KeyValue) as? T
        case is String.Type:
            _value = data.getString(Vars.Consts.KeyValue) as? T
        default:
            return false;
        }
        return true;
    }}