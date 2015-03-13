//
//  Vars.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

/*
 * Note that Vars and Var doesn't support serialization
 */
public class Vars : EntityAspect {
    public struct Consts {
        public static let TypeVars = "Vars"

        public static let TypeBoolVar = "BoolVar"
        public static let TypeIntVar = "IntVar"
        public static let TypeLongVar = "LongVar"
        public static let TypeFloatVar = "FloatVar"
        public static let TypeDoubleVar = "DoubleVar"
        public static let TypeStringVar = "StringVar"

        public static let KeyValue = "value"
    }
    public override var type: String? { return Vars.Consts.TypeVars }

    public final func addVar<T: Var>(varPath: String, value: T.ValueType?) -> T? {
        if let v: T = add(varPath) {
            v.setValue(value)
            return v
        }
        return nil
    }

    public final func addAnyVar<T>(varPath: String, value: T) -> AnyVar<T>? {
        if let v: AnyVar<T> = add(varPath) {
        /*
        let v = AnyVar<T>(entity: self, path: varPath)
        if addAspect(v) {
        */
            v.setValue(value)
            return v
        }
        return nil
    }

    public final func getAnyValue<T>(varPath: String) -> T? {
        if let v: AnyVar<T> = get(varPath) {
            return v.value
        }
        return nil
    }

    public final func getAnyValue<T>(varPath: String, hint: T) -> T? {
        if let v: AnyVar<T> = get(varPath) {
            return v.value
        }
        return nil
    }

    public final func setAnyValue<T>(varPath: String, value: T?) -> Bool? {
        if let v: AnyVar<T> = get(varPath) {
            return v.setValue(value)
        }
        return nil
    }
}
