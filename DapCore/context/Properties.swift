//
//  Properties.swift
//  DAP
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class Properties : EntityAspect, Encodable {
    public struct Consts {
        public static let TypeProperties = "Properties"
        
        public static let TypeBoolProperty = "BoolProperty"
        public static let TypeIntProperty = "IntProperty"
        public static let TypeFloatProperty = "FloatProperty"
        public static let TypeDoubleProperty = "DoubleProperty"
        public static let TypeStringProperty = "StringProperty"
        
    }

    public override var type: String? { return Consts.TypeProperties }
    
    public final func add<T: Equatable>(path: String, value: T?) -> Property<T>? {
        let property = Property<T>(entity: self, path: path)
        if addAspect(property) {
            property.setValue(value)
            return property
        }
        return nil
    }
    
    public final func addWatcher<T: Equatable>(path: String, watcher: Property<T>.ValueWatcher) -> Property<T>? {
        if let property: Property<T> = get(path) {
            property.addWatcher(watcher)
        }
        return nil
    }
    
    public final func addChecker<T: Equatable>(path: String, checker: Property<T>.ValueChecker) -> Property<T>? {
        if let property: Property<T> = get(path) {
            property.addChecker(checker)
        }
        return nil
    }
    
    public final func getValue<T: Equatable>(path: String) -> T? {
        if let property: Property<T> = get(path) {
            return property.value
        }
        return nil
    }
    
    public final func getValue<T: Equatable>(path: String, hint: T) -> T? {
        if let property: Property<T> = get(path) {
            return property.value
        }
        return nil
    }
    
    public final func setValue<T: Equatable>(path: String, value: T?) -> Bool {
        if let property: Property<T> = get(path) {
            return property.setValue(value)
        }
        return false
    }
}