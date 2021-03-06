//
//  Clause.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Clause : FuzzyClause {
    public let variable: FuzzyVariable
    public let set: FuzzySet
    
    public init(variable: FuzzyVariable, set: FuzzySet) {
        self.variable = variable
        self.set = set
    }
}
