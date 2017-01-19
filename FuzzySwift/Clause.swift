//
//  Clause.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//
//

import Foundation

public struct Consequent : FuzzyClause {
    public let variable: FuzzyVariable
    public let set: FuzzySet
    
    public init(variable: FuzzyVariable, set: FuzzySet) {
        self.variable = variable
        self.set = set
    }
}
