//
//  Item.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class Item : Context, Aspect {
    public struct Consts {
        static let TypeItem = "Item"
    }
    public override var type: String? { return Item.Consts.TypeItem }
    
    public let entity: Entity
    public let path: String
    public let registry: Registry?
    
    public required init(entity: Entity, path: String) {
        self.entity = entity
        self.path = path
        super.init()
        self.registry = findRegistry(entity)
    }
    
    private func findRegistry(entity: Entity) -> Registry? {
        switch entity {
        case let register as Registry:
            return register
        case let aspect as EntityAspect:
            return findRegistry(aspect.entity)
        case let item as Item:
            return findRegistry(item.entity)
        default:
            return nil
        }
    }
    
    public override func factoryAspect(entity: Entity, path: String, data: Data) -> Aspect? {
        return self.registry?.factoryAspect(entity, path: path, data: data)
    }
    
    public override func encode(data: Data) -> Bool {
        return super.encode(data) && data.setString(DapObject.Consts.KeyPath, value: path)
    }
    
    public override func decode(data: Data) -> Bool {
        if !super.decode(data) { return false }
        
        if let value = data.getString(DapObject.Consts.KeyPath) {
            return path == value
        }
        return false
    }
    
    public override func encodeAspect(aspect: Aspect, data: Data) -> Bool {
        if let item = aspect as? Item {
            return item.encode(data)
        }
        return super.encodeAspect(aspect, data: data)
    }
    
    public override func decodeAspect(aspect: Aspect, data: Data) -> Bool {
        if let item = aspect as? Item {
            return item.decode(data)
        }
        return super.decodeAspect(aspect, data: data)
    }
}