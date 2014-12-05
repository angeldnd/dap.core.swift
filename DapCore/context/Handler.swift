//
//  Event.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class Handler : Channel {
    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }
    
    public func doHandle(path: String, data: Data?) -> Data? {
        return nil
    }
    
    public final func handle(data: Data) -> Data? {
        if send(data) {
            return doHandle(path, data: data)
        }
        return nil
    }
}