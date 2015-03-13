//
//  Aspect.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public protocol Aspect : class {
    var entity: Entity { get }
    var path: String { get }

    init(entity: Entity, path: String)
    func encode() -> Data?
    func decode(data: Data) -> Bool
}

public class BaseAspect : DapObject, Aspect {
    public unowned let entity: Entity
    public var path: String

    public required init(entity: Entity, path: String) {
        self.entity = entity
        self.path = path
    }
}

public class EntityAspect : Entity, Aspect {
    public unowned let entity: Entity
    public let path: String

    public required init (entity: Entity, path: String) {
        self.entity = entity
        self.path = path
    }

    public override func factoryAspect(entity: Entity, path: String, type: String) -> Aspect? {
        return self.entity.factoryAspect(entity, path: path, type: type)
    }
}
