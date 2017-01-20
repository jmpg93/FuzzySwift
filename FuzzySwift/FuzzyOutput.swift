//
//  FuzzyOutput.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public typealias FiringStrengthSet = (firingStrengthSet: Double, set: FuzzySet, rule: FuzzyRule)

public protocol FuzzyOutput : CustomStringConvertible {
    var variable: FuzzyVariable { get }
    var outputs: [FiringStrengthSet] { get set }
    
    mutating func add(firingStrength: Double, for set: FuzzySet, by rule: FuzzyRule)
}

public extension FuzzyOutput {
    public var description: String {
        return "\(variable). Outputs: \(outputs)"
    }
    
    public mutating func add(firingStrength: Double, for set: FuzzySet, by rule: FuzzyRule) {
        self.outputs.append( (firingStrength, set, rule) )
    }
}
