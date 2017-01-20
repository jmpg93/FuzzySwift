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
public func ==(lhs: FuzzyVariable, rhs: FuzzySet) -> StatementGroup {
    return .single(Clause(variable: lhs, set: rhs))
}

public func ==(lhs: FuzzySet, rhs: FuzzyVariable) -> StatementGroup {
    return .single(Clause(variable: rhs, set: lhs))
}

// Clause
public func =>(lhs: FuzzyVariable, rhs: FuzzySet) -> Clause {
    return Clause(variable: lhs, set: rhs)
}

// Not Operator
prefix public func !(a: Clause) -> StatementGroup {
    return .not(a.asStatementGroup)
}

prefix public func !(a: StatementGroup) -> StatementGroup {
    return .not(a)
}

// And Operator
public func &&(lhs: Clause, rhs: Clause) -> StatementGroup {
    return .and(lhs.asStatementGroup, rhs.asStatementGroup)
}

public func &&(lhs: StatementGroup, rhs: Clause) -> StatementGroup {
    return .and(lhs, rhs.asStatementGroup)
}

public func &&(lhs: Clause, rhs: StatementGroup) -> StatementGroup {
    return .and(lhs.asStatementGroup, rhs)
}

public func &&(lhs: StatementGroup, rhs: StatementGroup) -> StatementGroup {
    return .and(lhs, rhs)
}

// Or Operator
public func ||(lhs: Clause, rhs: Clause) -> StatementGroup {
    return .or(lhs.asStatementGroup, rhs.asStatementGroup)
}

public func ||(lhs: StatementGroup, rhs: Clause) -> StatementGroup {
    return .or(lhs, rhs.asStatementGroup)
}

public func ||(lhs: Clause, rhs: StatementGroup) -> StatementGroup {
    return .or(lhs.asStatementGroup, rhs)
}

public func ||(lhs: StatementGroup, rhs: StatementGroup) -> StatementGroup {
    return .or(lhs, rhs)
}

fileprivate extension Clause {
    var asStatementGroup: StatementGroup {
        return .single(self)
    }
}
