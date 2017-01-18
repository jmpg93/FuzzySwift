//
//  Statement.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Statement : CustomStringConvertible {
    private let variable: FuzzyVariable?
    private let set: FuzzySet?
    
    public init(variable: FuzzyVariable, set: FuzzySet) {
        self.variable = variable
        self.set = set
    }
    
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
    
    public var description: String {
        return variable!.name + " is " + set!.name
    }
}
