//
//  Context.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class Context : Entity {
    public struct Consts {
        public static let TypeContext = "Context"
        
        public static let PathProperties = "properties"
        public static let PathChannels = "channels"
        public static let PathHandlers = "handlers"
    }
    
    public override var type: String? { return Consts.TypeContext }
    
    private let _properties: Properties?
    public var properties: Properties { return _properties! }
    
    private let _channels: Channels?
    public var channels: Channels { return _channels! }
    
    private let _handlers: Handlers?
    public var handlers: Handlers { return _handlers! }
    
    public override init() {
        super.init()
        _properties = add(Consts.PathProperties)
        _channels = add(Consts.PathChannels)
        _handlers = add(Consts.PathHandlers)
    }
}