//
//  FuzzyOutput.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public typealias FiringStrengthSet = (firingStrengthSet: Double, set: FuzzySet)

public protocol FuzzyOutput : CustomStringConvertible {
    var variable: FuzzyVariable { get }
    var outputs: [FiringStrengthSet] { get set }
    
    mutating func add(firingStrength: Double, for set: FuzzySet)
}

public extension FuzzyOutput {
    public var description: String {
        return "\(variable). Outputs: \(outputs)"
    }
    
    public mutating func add(firingStrength: Double, for set: FuzzySet) {
        self.outputs.append( (firingStrength, set) )
    }
}
