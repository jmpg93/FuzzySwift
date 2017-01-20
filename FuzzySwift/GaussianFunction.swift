//
//  GaussianFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct GaussianFunction : FuzzyFunction {
    public let mean: Double
    public let standardDeviation: Double
    
    public init(mean: Double, standardDeviation: Double) {
        self.mean = mean
        self.standardDeviation = standardDeviation
    }
    
    public var leftLimit: Double {
        return mean - 4 * standardDeviation
    }
    
    public var rightLimit: Double {
        return mean + 4 * standardDeviation
    }
        
    public func membershipDegree(of value: Double) -> Double {
        return exp(
            -(value - mean) * (value - mean) / (2 * standardDeviation * standardDeviation)
        )
    }
}
