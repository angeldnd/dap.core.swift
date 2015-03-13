//
//  Channels.swift
//  DapCore
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

    public func addChannel(channelPath: String) -> Channel? {
        let channel: Channel? = add(channelPath)
        return channel
    }

    //SILP: ADD_REMOVE_HELPER(EventChecker, channelPath, channel, Channel, EventChecker, checker, DataChecker)
    public func addEventChecker(channelPath: String, checker: DataChecker) -> Bool {    //__SILP__
        if let channel: Channel = get(channelPath) {                                    //__SILP__
            return channel.addEventChecker(checker)                                     //__SILP__
        }                                                                               //__SILP__
        return false                                                                    //__SILP__
    }                                                                                   //__SILP__
                                                                                        //__SILP__
    public func removeEventChecker(channelPath: String, checker: DataChecker) -> Bool { //__SILP__
        if let channel: Channel = get(channelPath) {                                    //__SILP__
            return channel.removeEventChecker(checker)                                  //__SILP__
        }                                                                               //__SILP__
        return false                                                                    //__SILP__
    }                                                                                   //__SILP__

    //SILP: ADD_REMOVE_HELPER(EventListener, channelPath, channel, Channel, EventListener, listener, EventListener)
    public func addEventListener(channelPath: String, listener: EventListener) -> Bool {    //__SILP__
        if let channel: Channel = get(channelPath) {                                        //__SILP__
            return channel.addEventListener(listener)                                       //__SILP__
        }                                                                                   //__SILP__
        return false                                                                        //__SILP__
    }                                                                                       //__SILP__
                                                                                            //__SILP__
    public func removeEventListener(channelPath: String, listener: EventListener) -> Bool { //__SILP__
        if let channel: Channel = get(channelPath) {                                        //__SILP__
            return channel.removeEventListener(listener)                                    //__SILP__
        }                                                                                   //__SILP__
        return false                                                                        //__SILP__
    }                                                                                       //__SILP__

    public func fireEvent(channelPath: String, evt: Data? = nil) -> Bool? {
        if let channel: Channel = get(channelPath) {
            return channel.fireEvent(evt)
        }
        return nil
    }
}
