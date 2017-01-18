//
//  Statement.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Statement : FuzzyClause {
    public var variable: FuzzyVariable!
    public var set: FuzzySet!
    
    //TODO: Remove
    public init() {
        variable = nil
        set = nil
    }
    
    prefix public static func !(a: Statement) -> Statement {
        return Statement()
    }

    public static func &&(lhs: Statement, rhs: @autoclosure () throws -> Statement) rethrows -> Statement {
        return Statement()
    }
    
    public static func ||(lhs: Statement, rhs: @autoclosure () throws -> Statement) rethrows -> Statement {
        return Statement()
    }
}
