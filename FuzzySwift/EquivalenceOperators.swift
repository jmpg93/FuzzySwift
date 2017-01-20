//
//  FuzzyComparable.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

precedencegroup Equivalence {
    associativity: left
}

infix operator =>

// FuzzyVariable, FuzzySet
public func ==(lhs: FuzzyVariable, rhs: FuzzySet) -> ClauseGroup {
    return .single(Clause(variable: lhs, set: rhs))
}

public func ==(lhs: FuzzySet, rhs: FuzzyVariable) -> ClauseGroup {
    return .single(Clause(variable: rhs, set: lhs))
}

// Clause
public func =>(lhs: FuzzyVariable, rhs: FuzzySet) -> Clause {
    return Clause(variable: lhs, set: rhs)
}

// Not Operator
prefix public func !(a: Clause) -> ClauseGroup {
    return .not(a.asClauseGroup)
}

prefix public func !(a: ClauseGroup) -> ClauseGroup {
    return .not(a)
}

// And Operator
public func &&(lhs: Clause, rhs: Clause) -> ClauseGroup {
    return .and(lhs.asClauseGroup, rhs.asClauseGroup)
}

public func &&(lhs: ClauseGroup, rhs: Clause) -> ClauseGroup {
    return .and(lhs, rhs.asClauseGroup)
}

public func &&(lhs: Clause, rhs: ClauseGroup) -> ClauseGroup {
    return .and(lhs.asClauseGroup, rhs)
}

public func &&(lhs: ClauseGroup, rhs: ClauseGroup) -> ClauseGroup {
    return .and(lhs, rhs)
}

// Or Operator
public func ||(lhs: Clause, rhs: Clause) -> ClauseGroup {
    return .or(lhs.asClauseGroup, rhs.asClauseGroup)
}

public func ||(lhs: ClauseGroup, rhs: Clause) -> ClauseGroup {
    return .or(lhs, rhs.asClauseGroup)
}

public func ||(lhs: Clause, rhs: ClauseGroup) -> ClauseGroup {
    return .or(lhs.asClauseGroup, rhs)
}

public func ||(lhs: ClauseGroup, rhs: ClauseGroup) -> ClauseGroup {
    return .or(lhs, rhs)
}

fileprivate extension Clause {
    var asClauseGroup: ClauseGroup {
        return .single(self)
    }
}
