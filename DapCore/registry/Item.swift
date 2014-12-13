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
        public static let TypeItem = "Item"
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
    
    public override func factoryAspect(entity: Entity, path: String, type: String) -> Aspect? {
        return self.registry?.factoryAspect(entity, path: path, type: type)
    }
}