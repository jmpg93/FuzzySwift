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
    
    //TODO: Improve using dictionary
    public func firingStrength(for inputs: [FuzzyInput])  -> Double {
        return evaluate(statement, for: inputs)
    }
    
    public init(name: String, if statement: ClauseGroup, then consequence: Clause) {
        self.name = name
        self.statement = statement
        self.consequence = consequence
    }
    
    public func renamed(_ name: String) -> Rule {
        return Rule(name: name, if: statement, then: consequence)
    }
    
    fileprivate func evaluate(_ statementGroup: ClauseGroup, for inputs: [FuzzyInput]) -> Double {
        switch statementGroup {
        case let .single(sta):
            return sta.evaluate(inputs)
        case let .not(sta):
            return 1 - evaluate(sta, for: inputs)
        case let .and (leftSta, rightSta):
            return min(evaluate(leftSta, for: inputs), evaluate(rightSta, for: inputs))
        case let .or (leftSta, rightSta):
            return max(evaluate(leftSta, for: inputs), evaluate(rightSta, for: inputs))
        }
    }
}

fileprivate extension FuzzyClause {
    func evaluate(_ inputs: [FuzzyInput]) -> Double {
        for input in inputs where input.variable.name == variable.name {
            return evaluate(value: input.value)
        }
        
        return 0
    }
}
