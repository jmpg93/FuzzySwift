//
//  Output.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public typealias FiringStrengthSet = (firingStrengthSet: Double, set: FuzzySet)

//TODO: Make protocol
public struct Output {
    public let variable: FuzzyVariable
    public private(set)var outputs: [FiringStrengthSet]
    
    public init(variable: FuzzyVariable) {
        self.variable = variable
        self.outputs = []
    }
    
    public mutating func add(firingStrength: Double, for set: FuzzySet) {
        self.outputs.append(
            (firingStrength, set)
        )
    }
}
