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

    public func addHandler(handlerPath: String) -> Handler? {
        let handler: Handler? = add(handlerPath)
        return handler
    }

    //SILP: ADD_REMOVE_HELPER(RequestChecker, handlerPath, handler, Handler, RequestChecker, checker, DataChecker)
    public func addRequestChecker(handlerPath: String, checker: DataChecker) -> Bool {    //__SILP__
        if let handler: Handler = get(handlerPath) {                                      //__SILP__
            return handler.addRequestChecker(checker)                                     //__SILP__
        }                                                                                 //__SILP__
        return false                                                                      //__SILP__
    }                                                                                     //__SILP__
                                                                                          //__SILP__
    public func removeRequestChecker(handlerPath: String, checker: DataChecker) -> Bool { //__SILP__
        if let handler: Handler = get(handlerPath) {                                      //__SILP__
            return handler.removeRequestChecker(checker)                                  //__SILP__
        }                                                                                 //__SILP__
        return false                                                                      //__SILP__
    }                                                                                     //__SILP__

    //SILP: ADD_REMOVE_HELPER(RequestListener, handlerPath, handler, Handler, RequestListener, listener, RequestListener)
    public func addRequestListener(handlerPath: String, listener: RequestListener) -> Bool {    //__SILP__
        if let handler: Handler = get(handlerPath) {                                            //__SILP__
            return handler.addRequestListener(listener)                                         //__SILP__
        }                                                                                       //__SILP__
        return false                                                                            //__SILP__
    }                                                                                           //__SILP__
                                                                                                //__SILP__
    public func removeRequestListener(handlerPath: String, listener: RequestListener) -> Bool { //__SILP__
        if let handler: Handler = get(handlerPath) {                                            //__SILP__
            return handler.removeRequestListener(listener)                                      //__SILP__
        }                                                                                       //__SILP__
        return false                                                                            //__SILP__
    }                                                                                           //__SILP__

    //SILP: ADD_REMOVE_HELPER(ResponseListener, handlerPath, handler, Handler, ResponseListener, listener, ResponseListener)
    public func addResponseListener(handlerPath: String, listener: ResponseListener) -> Bool {    //__SILP__
        if let handler: Handler = get(handlerPath) {                                              //__SILP__
            return handler.addResponseListener(listener)                                          //__SILP__
        }                                                                                         //__SILP__
        return false                                                                              //__SILP__
    }                                                                                             //__SILP__
                                                                                                  //__SILP__
    public func removeResponseListener(handlerPath: String, listener: ResponseListener) -> Bool { //__SILP__
        if let handler: Handler = get(handlerPath) {                                              //__SILP__
            return handler.removeResponseListener(listener)                                       //__SILP__
        }                                                                                         //__SILP__
        return false                                                                              //__SILP__
    }                                                                                             //__SILP__

    public func handleRequest(path: String, req: Data?) -> Data? {
        if let handler: Handler = get(path) {
            return handler.handleRequest(req)
        }
        return nil
    }
}
