//
//  PatternMatcher.swift
//  DAP
//
//  Created by YJ Park on 14/10/21.
//  Copyright (c) 2014年 AngelDnD. All rights reserved.
//

import Foundation

public class PatternMatcher {
    public struct Consts {
        public static let WildcastSegment = "*"
        public static let WildcastSegments = "**"
    }
    
    public let separator: String
    public let pattern: String
    private let segments: [String]
    
    public init(separator: String, pattern: String) {
        self.separator = separator
        self.pattern = pattern
        self.segments = pattern.componentsSeparatedByString(separator)
    }
    
    public func isMatched(path: String) -> Bool {
        let pathSegments = path.componentsSeparatedByString(separator)
        //TODO:Matching
        return false
    }
}