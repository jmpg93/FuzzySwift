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
    public let statement: StatementGroup
    public let consequent: Clause
    
    public func firingStrength(for inputBox: InputBox)  -> Double {
        return evaluate(statement, for: inputBox)
    }
    
    public init(name: String, if statement: StatementGroup, then consequent: Clause) {
        self.name = name
        self.statement = statement
        self.consequent = consequent
    }
    
    public func renamed(_ name: String) -> Rule {
        return Rule(name: name, if: statement, then: consequent)
    }
    
    fileprivate func evaluate(_ statementGroup: StatementGroup, for inputBox: InputBox) -> Double {
        switch statementGroup {
        case let .single(sta):
            return sta.evaluate(inputBox)
        case let .not(sta):
            return 1 - evaluate(sta, for: inputBox)
        case let .and (leftSta, rightSta):
            return min(evaluate(leftSta, for: inputBox), evaluate(rightSta, for: inputBox))
        case let .or (leftSta, rightSta):
            return max(evaluate(leftSta, for: inputBox), evaluate(rightSta, for: inputBox))
        }
    }
}

fileprivate extension FuzzyClause {
    func evaluate(_ inputBox: InputBox) -> Double {
        if let currentStatement = inputBox[variable.name] {
            return evaluate(value: currentStatement)
        } else {
            return 0
        }
    }
}
