//
//  Clause.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//
//

import Foundation

public struct Consequent : FuzzyClause {
    public private(set) var variable: FuzzyVariable!
    public private(set) var set: FuzzySet!
    
    public init(variable: FuzzyVariable, set: FuzzySet) {
        self.variable = variable
        self.set = set
    }
}
