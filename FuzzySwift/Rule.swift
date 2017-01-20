//
//  Rule.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Rule : FuzzyRule {
    public let name: String
    public let statement: ClauseGroup
    public let consequence: Clause
    
    public func firingStrength(for input: FuzzyInput)  -> Double {
        return evaluate(statement, for: input)
    }
    
    public init(name: String, if statement: ClauseGroup, then consequence: Clause) {
        self.name = name
        self.statement = statement
        self.consequence = consequence
    }
    
    public func renamed(_ name: String) -> Rule {
        return Rule(name: name, if: statement, then: consequence)
    }
    
    fileprivate func evaluate(_ statementGroup: ClauseGroup, for input: FuzzyInput) -> Double {
        switch statementGroup {
        case let .single(sta):
            return sta.evaluate(input)
        case let .not(sta):
            return 1 - evaluate(sta, for: input)
        case let .and (leftSta, rightSta):
            return min(evaluate(leftSta, for: input), evaluate(rightSta, for: input))
        case let .or (leftSta, rightSta):
            return max(evaluate(leftSta, for: input), evaluate(rightSta, for: input))
        }
    }
}

fileprivate extension FuzzyClause {
    func evaluate(_ input: FuzzyInput) -> Double {
        if self.variable.name == input.variable.name {
            return evaluate(value: input.value)
        } else {
            return 0
        }
    }
}
