//
//  FuzzyVariable.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyVariable : CustomStringConvertible {
    var name: String { get }
    var sets: [FuzzySet] { get }
    
    var beginning: Double { get }
    var end: Double { get }
    
    func membership(of: FuzzySet, value: Double) -> Double
}

extension FuzzyVariable {
    public var description: String {
        return name + " " + sets.map({$0.name}).joined(separator: ",")
    }
    
    public var beginning: Double {
        return sets.first!.leftLimit
    }
    
    public var end: Double {
        return sets.last!.rightLimit
    }
    
    public func membership(of set: FuzzySet, value: Double) -> Double {
        return sets.contains(where: { $0.name == set.name }) ? set.membershipDegree(of: value) : 0
    }
}
