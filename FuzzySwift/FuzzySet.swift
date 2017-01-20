//
//  FuzzySet.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzySet : CustomStringConvertible {
    static var sets: [FuzzySet] { get }
    
    var leftLimit: Double { get }
    var rightLimit: Double { get }
    
    var function: FuzzyFunction { get }
    var name: String { get }
    
    func membershipDegree(of value: Double) -> Double
}

public extension FuzzySet {
    public var description: String {
        return name + ": [\(leftLimit), \(rightLimit)]"
    }
    
    var leftLimit: Double {
        return function.leftLimit
    }
    
    var rightLimit: Double {
        return function.rightLimit
    }
    
    func membershipDegree(of value: Double) -> Double {
        return function.membershipDegree(of: value)
    }
}
