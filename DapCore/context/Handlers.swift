//
//  Handlers.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class Handlers : EntityAspect {
    public struct Consts {
        static let Separator = "."
    }

    public override var separator: String { return Handlers.Consts.Separator }
    
    /*
     * For unknown reason, here can't specify T: Handler, so this method is just
     * a name, not really cheking type.
     */
    public func addHandler<T: Aspect>(path: String) -> T? {
        let handler: T? = add(path)
        return handler
    }
    
    public func addHandlerListener(path: String, listener: ChannelListener) -> Bool {
        if let channel: Channel = get(path) {
            return channel.addListener(listener)
        }
        return false
    }
    
    public func removeHandlerListener(path: String, listener: ChannelListener) -> Bool {
        if let channel: Channel = get(path) {
            return channel.removeListener(listener)
        }
        return false
    }
    
    public func handle(path: String, data: Data) -> Data? {
        if let handler: Handler = get(path) {
            return handler.handle(data)
        }
        return nil
    }
}