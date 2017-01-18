//
//  Point.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Point: CustomStringConvertible {
    
    public var description: String {
        return "(\(x), \(y))"
    }
    
    public let x: Double
    public let y: Double
    
    public init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
}
