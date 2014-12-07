//
//  Registry.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public final class Registry : Entity {
    public struct Consts {
        public static let Separator = "/"
    }
    public override var separator: String { return Registry.Consts.Separator }
    
    public final class var Global: Registry {
        struct Static {
            static let Instance: Registry = Registry()
        }
        return Static.Instance
    }
    
    public let factory: Factory
    
    public required init(factory: Factory) {
        self.factory = factory;
        super.init()
    }
    
    public convenience override init() {
        self.init(factory: Factory.NewBuiltinFactory())
    }
    
    public override func factoryAspect(entity: Entity, path: String, type: String) -> Aspect? {
        return factory.factoryAspect(entity, path: path, type: type);
    }
}