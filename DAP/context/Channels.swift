//
//  Channels.swift
//  DAP
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class Channels : EntityAspect {
    public struct Consts {
        static let Separator = "."
    }

    public override var separator: String { return Channels.Consts.Separator }
    
    public func addChannel(path: String) -> Channel? {
        let channel: Channel? = add(path)
        return channel
    }
    
    public func addChannelListener(path: String, listener: ChannelListener) -> Bool {
        if let channel: Channel = get(path) {
            return channel.addListener(listener)
        }
        return false
    }
    
    public func removeChannelListener(path: String, listener: ChannelListener) -> Bool {
        if let channel: Channel = get(path) {
            return channel.removeListener(listener)
        }
        return false
    }
    
    public func send(path: String, data: Data? = nil) -> Bool? {
        if let channel: Channel = get(path) {
            return channel.send(data)
        }
        return nil
    }
}