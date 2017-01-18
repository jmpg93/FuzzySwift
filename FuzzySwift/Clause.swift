//
//  Clause.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//
//

import Foundation

public struct Clause : CustomStringConvertible {
    private let variable: FuzzyVariable
    private let set: FuzzySet
    
    public init(variable: FuzzyVariable, set: FuzzySet) {
        self.variable = variable
        self.set = set
    }
    
    public var description: String {
        return variable.name + " is " + set.name
    }
}
