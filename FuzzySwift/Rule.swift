//
//  Rule.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//
//

import Foundation

public class Rule : FuzzyRule {
    public var name: String?
    public let statement: Statement
    public let consequent: Consequent
    
    public var firingStrength: Double {
        return 0.0
    }
    
    public init(statement: Statement, consequent: Consequent) {
        self.statement = statement
        self.consequent = consequent
    }
    
    private func calculateFiringStrength(statement: Statement, consequent: Consequent) -> Double {
        var stack = Stack<Double>()
        
        stack.push(consequent.evaluate())
        
        
        return stack.pop()
    }
    
}
