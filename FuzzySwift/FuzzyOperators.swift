//
//  FuzzyComparable.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
infix operator =?

public func =?(lhs: FuzzyVariable, rhs: FuzzySet) -> Statement {
    return Statement()
}

public func =?(lhs: FuzzySet, rhs: FuzzyVariable) -> Statement {
    return Statement()
}

infix operator =>
public func =>(lhs: Statement, rhs: Clause) -> Rule {
    return Rule()
}

public func ==(lhs: FuzzyVariable, rhs: FuzzySet) -> Clause {
    return Clause(variable: lhs, set: rhs)
}
