//
//  Event.swift
//  DapCore
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public protocol RequestListener : class {
    func onRequest(handlerPath: String, req: Data?) -> Void
}

public protocol ResponseListener : class {
    func onResponse(handlerPath: String, req: Data?, res: Data?) -> Void
}

public protocol RequestHandler : class {
    func doHandle(handlerPath: String, req: Data?) -> Data?
}

public final class Handler : BaseAspect {
    private var _handler: RequestHandler?

    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }

    public func setup(handler: RequestHandler) -> Bool {
        if _handler == nil {
            _handler = handler
            return true
        }
        return false
    }

    private var _requestCheckers = [DataChecker]()
    private var _requestListeners = [RequestListener]()
    private var _responseListeners = [ResponseListener]()

    //SILP: DECLARE_LIST(RequestChecker, checker, DataChecker, _requestCheckers)
    private func getIndexOfRequestChecker(checker: DataChecker) -> Int? {  //__SILP__
        for (i, obj) in enumerate(_requestCheckers) {                      //__SILP__
            if obj === checker {                                           //__SILP__
                return i                                                   //__SILP__
            }                                                              //__SILP__
        }                                                                  //__SILP__
        return nil                                                         //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public final func addRequestChecker(checker: DataChecker) -> Bool {    //__SILP__
        if getIndexOfRequestChecker(checker) == nil {                      //__SILP__
            _requestCheckers.append(checker)                               //__SILP__
            return true                                                    //__SILP__
        }                                                                  //__SILP__
        return false                                                       //__SILP__
    }                                                                      //__SILP__
                                                                           //__SILP__
    public final func removeRequestChecker(checker: DataChecker) -> Bool { //__SILP__
        if let index = getIndexOfRequestChecker(checker) {                 //__SILP__
            _requestCheckers.removeAtIndex(index)                          //__SILP__
            return true                                                    //__SILP__
        }                                                                  //__SILP__
        return false                                                       //__SILP__
    }                                                                      //__SILP__

    //SILP: DECLARE_LIST(RequestListener, listener, RequestListener, _requestListeners)
    private func getIndexOfRequestListener(listener: RequestListener) -> Int? {  //__SILP__
        for (i, obj) in enumerate(_requestListeners) {                           //__SILP__
            if obj === listener {                                                //__SILP__
                return i                                                         //__SILP__
            }                                                                    //__SILP__
        }                                                                        //__SILP__
        return nil                                                               //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    public final func addRequestListener(listener: RequestListener) -> Bool {    //__SILP__
        if getIndexOfRequestListener(listener) == nil {                          //__SILP__
            _requestListeners.append(listener)                                   //__SILP__
            return true                                                          //__SILP__
        }                                                                        //__SILP__
        return false                                                             //__SILP__
    }                                                                            //__SILP__
                                                                                 //__SILP__
    public final func removeRequestListener(listener: RequestListener) -> Bool { //__SILP__
        if let index = getIndexOfRequestListener(listener) {                     //__SILP__
            _requestListeners.removeAtIndex(index)                               //__SILP__
            return true                                                          //__SILP__
        }                                                                        //__SILP__
        return false                                                             //__SILP__
    }                                                                            //__SILP__

    //SILP: DECLARE_LIST(ResponseListener, listener, ResponseListener, _responseListeners)
    private func getIndexOfResponseListener(listener: ResponseListener) -> Int? {  //__SILP__
        for (i, obj) in enumerate(_responseListeners) {                            //__SILP__
            if obj === listener {                                                  //__SILP__
                return i                                                           //__SILP__
            }                                                                      //__SILP__
        }                                                                          //__SILP__
        return nil                                                                 //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func addResponseListener(listener: ResponseListener) -> Bool {    //__SILP__
        if getIndexOfResponseListener(listener) == nil {                           //__SILP__
            _responseListeners.append(listener)                                    //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__
                                                                                   //__SILP__
    public final func removeResponseListener(listener: ResponseListener) -> Bool { //__SILP__
        if let index = getIndexOfResponseListener(listener) {                      //__SILP__
            _responseListeners.removeAtIndex(index)                                //__SILP__
            return true                                                            //__SILP__
        }                                                                          //__SILP__
        return false                                                               //__SILP__
    }                                                                              //__SILP__


    public final func handleRequest(req: Data?) -> Data? {
        if _handler == nil {
            return nil
        }

        for checker in _requestCheckers {
            if !checker.isValid(req) {
                return nil
            }
        }

        for listener in _requestListeners {
            listener.onRequest(path, req: req)
        }

        let res = _handler!.doHandle(path, req: req)

        for listener in _responseListeners {
            listener.onResponse(path, req: req, res: res)
        }
        return res
    }
}
