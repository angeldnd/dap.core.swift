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
        public static let TypeFloatVar = "FloatVar"
        public static let TypeDoubleVar = "DoubleVar"
        public static let TypeStringVar = "StringVar"
        
        public static let KeyValue = "value"
    }
    public override var type: String? { return Vars.Consts.TypeVars }
    
    public final func add<T>(path: String, value: T?) -> Var<T>? {
        let v = Var<T>(entity: self, path: path)
        if addAspect(v) {
            v.setValue(value)
            return v
        }
        return nil
    }
    
    public final func getValue<T>(path: String) -> T? {
        if let v: Var<T> = get(path) {
            return v.value
        }
        return nil
    }
    
    public final func getValue<T>(path: String, hint: T) -> T? {
        if let v: Var<T> = get(path) {
            return v.value
        }
        return nil
    }
    
    public final func setValue<T>(path: String, value: T?) {
        if let v: Var<T> = get(path) {
            v.setValue(value)
        }
    }
}