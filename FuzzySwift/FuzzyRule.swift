//
//  FuzzyRule.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyRule : CustomStringConvertible {
    var name: String { get }
    var statement: StatementGroup { get }
    var consequent: Clause { get }
    
    func firingStrength(for inputBox: InputBox)  -> Double
}

public extension FuzzyRule {
    public var description: String {
        return "\(name): if \(statement) then \(consequent)"
    }
}
