//
//  Rule.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//
//

import Foundation

public struct Rule : FuzzyRule {
    public let name: String
    public let statement: StatementGroup
    public let consequent: Consequent
    
    public var firingStrength: Double {
        return calculateFiringStrength(statement: statement, consequent: consequent)
    }
    
    public init(name: String, statement: StatementGroup, consequent: Consequent) {
        self.name = name
        self.statement = statement
        self.consequent = consequent
    }
    
    public func renamed(_ name: String) -> Rule {
        return Rule(name: name, statement: self.statement, consequent: self.consequent)
    }
    
    fileprivate func calculateFiringStrength(statement: StatementGroup, consequent: Consequent) -> Double {
        return evaluate(statement)
    }
    
    fileprivate func evaluate(_ statementGroup: StatementGroup) -> Double {
        switch statementGroup {
        case let .single(sta):
            return sta.evaluate()
        case let .not(sta):
            return 1 - evaluate(sta)
        case let .and (leftSta, rightSta):
            return min(evaluate(leftSta), evaluate(rightSta))
        case let .or (leftSta, rightSta):
            return max(evaluate(leftSta), evaluate(rightSta))
        }
    }
}
