//
//  Statement.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public enum Statement<T : FuzzyLogical> {
    indirect case and(Statement, Statement)
    indirect case or(Statement, Statement)
    indirect case clause(Statement, Statement)
    case assing(FuzzySet, FuzzyVariable)
}

public protocol FuzzyLogical {
    static func &&(lhs: Self, rhs: Self) -> Self
    static func ||(lhs: Self, rhs: Self) -> Self
}

extension Double: FuzzyLogical {
    public static func &&(lhs: Double, rhs: Double) -> Double {
        return 1
    }
    
    public static func ||(lhs: Double, rhs: Double) -> Double {
        return 0
    }
}
