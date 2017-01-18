//
//  FuzzyRule.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyRule : CustomStringConvertible {
    var name: String? { get set }
    var statement: Statement { get }
    var consequent: Consequent { get }
    
    var firingStrength: Double { get }
}

public extension FuzzyRule {
    public var description: String {
        return "\(name): if \(statement) then \(consequent)"
    }
}
