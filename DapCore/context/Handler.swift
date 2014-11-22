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
    
    func onHandle(path: String, data: Data) -> Data {
        return data.newData()
    }
    
    public final func handle(data: Data) -> Data? {
        if send(data) {
            return onHandle(path, data: data)
        }
        return nil
    }
}