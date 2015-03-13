//
//  Factory.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public typealias EntityFactory = () -> Entity
public typealias AspectFactory = (Entity, String) -> Aspect

public final class Factory: Entity {
    public struct Consts {
        static let PathEntities = "entities"
        static let PathAspects = "aspects"
    }
    public override var type: String? { return nil }

    public class final func NewBuiltinFactory() -> Factory {
        var result = Factory()
        //Entities
        result.registerEntity(Context.Consts.TypeContext, {Context()})

        //Aspects
        result.registerAspect(Item.Consts.TypeItem, {Item(entity: $0, path: $1)})

        //Vars
        result.registerAspect(Vars.Consts.TypeVars, {Vars(entity: $0, path: $1)})

        result.registerAspect(Vars.Consts.TypeBoolVar, {BoolVar(entity: $0, path: $1)})
        result.registerAspect(Vars.Consts.TypeIntVar, {IntVar(entity: $0, path: $1)})
        result.registerAspect(Vars.Consts.TypeFloatVar, {FloatVar(entity: $0, path: $1)})
        result.registerAspect(Vars.Consts.TypeDoubleVar, {DoubleVar(entity: $0, path: $1)})
        result.registerAspect(Vars.Consts.TypeStringVar, {StringVar(entity: $0, path: $1)})

        //Properties
        result.registerAspect(Properties.Consts.TypeProperties, {Properties(entity: $0, path: $1)})

        result.registerAspect(Properties.Consts.TypeBoolProperty, {BoolProperty(entity: $0, path: $1)})
        result.registerAspect(Properties.Consts.TypeIntProperty, {IntProperty(entity: $0, path: $1)})
        result.registerAspect(Properties.Consts.TypeFloatProperty, {FloatProperty(entity: $0, path: $1)})
        result.registerAspect(Properties.Consts.TypeDoubleProperty, {DoubleProperty(entity: $0, path: $1)})
        result.registerAspect(Properties.Consts.TypeStringProperty, {StringProperty(entity: $0, path: $1)})

        return result
    }

    private let _entities: Vars?
    public var entities: Vars { return _entities! }

    private let _aspects: Vars?
    public var aspects: Vars { return _aspects! }

    public override required init() {
        super.init()
        _entities = add(Factory.Consts.PathEntities)
        _aspects = add(Factory.Consts.PathAspects)
    }

    public final func registerEntity(type: String, factory: EntityFactory) -> Bool {
        return entities.addAnyVar(type, value: factory) != nil
    }

    public final func registerAspect(type: String, factory: AspectFactory) -> Bool {
        return aspects.addAnyVar(type, value: factory) != nil
    }

    public final func factoryEntity(type: String) -> Entity? {
        if let factory: EntityFactory = entities.getAnyValue(type) {
            return factory()
        }
        return nil
    }

    public final override func factoryAspect(entity: Entity, path: String, type: String) -> Aspect? {
        if let factory: AspectFactory = aspects.getAnyValue(type) {
            return factory(entity, path)
        }
        return nil
    }
}
