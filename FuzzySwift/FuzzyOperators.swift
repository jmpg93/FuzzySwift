//
//  FuzzyComparable.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

//TODO: Set predecende.

 /*
precedencegroup Comparative {
    associativity: left
    higherThan: Logical
}

infix operator =? : Comparative
infix operator == : Comparative

precedencegroup Logical {
    associativity: left
    higherThan: Equivalence
}

infix operator && : Logical
infix operator || : Logical

precedencegroup Equivalence {
    associativity: left
}
infix operator => : Equivalence
*/

//TODO: Remove => use == in both cases.

infix operator =>
infix operator =?

// FuzzyVariable, FuzzySet
public func ==(lhs: FuzzyVariable, rhs: FuzzySet) -> Statement {
    return Statement(variable: lhs, set: rhs)
}

public func =?(lhs: FuzzySet, rhs: FuzzyVariable) -> Statement {
    return Statement(variable: rhs, set: lhs)
}

// Rule
//TODO: Remove => use == in both cases ????.
//public func =>(lhs: StatementGroup, rhs: Consequent) -> Rule {
//    return Rule(name:"", if: lhs, then: rhs)
//}

// Consequent
public func =>(lhs: FuzzyVariable, rhs: FuzzySet) -> Consequent {
    return Consequent(variable: lhs, set: rhs)
}

// Statements

// Not Operator
prefix public func !(a: Statement) -> StatementGroup {
    return .not(a.asStatementGroup)
}

prefix public func !(a: StatementGroup) -> StatementGroup {
    return .not(a)
}

// And Operator
public func &&(lhs: Statement, rhs: Statement) -> StatementGroup {
    return .and(lhs.asStatementGroup, rhs.asStatementGroup)
}

public func &&(lhs: StatementGroup, rhs: Statement) -> StatementGroup {
    return .and(lhs, rhs.asStatementGroup)
}

public func &&(lhs: Statement, rhs: StatementGroup) -> StatementGroup {
    return .and(lhs.asStatementGroup, rhs)
}

public func &&(lhs: StatementGroup, rhs: StatementGroup) -> StatementGroup {
    return .and(lhs, rhs)
}

// Or Operator
public func ||(lhs: Statement, rhs: Statement) -> StatementGroup {
    return .or(lhs.asStatementGroup, rhs.asStatementGroup)
}

public func ||(lhs: StatementGroup, rhs: Statement) -> StatementGroup {
    return .or(lhs, rhs.asStatementGroup)
}

public func ||(lhs: Statement, rhs: StatementGroup) -> StatementGroup {
    return .or(lhs.asStatementGroup, rhs)
}

public func ||(lhs: StatementGroup, rhs: StatementGroup) -> StatementGroup {
    return .or(lhs, rhs)
}

fileprivate extension Statement {
    var asStatementGroup: StatementGroup {
        return .single(self)
    }
}
