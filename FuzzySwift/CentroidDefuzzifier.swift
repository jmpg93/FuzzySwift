//
//  CentroidDefuzzifier.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class CentroidDefuzzifier : Defuzzier {
    public private(set) var intervals: Double
    
    public init(intervals: Double = 1000) {
        self.intervals = intervals
    }
    
    public func defuzzify(output: Output) -> Double {
        
        var weightSum: Double = 0
        var membershipSum: Double = 0
        
        let end = output.variable.end
        let beginning = output.variable.beginning
        let increment =  end - beginning
        
        for value in stride(from: beginning, to: end, by: increment) {
            for (firingStrength, set) in output.outputs {
                let membership = output.variable.membership(of: set, value: value)
                let constrainedMembership = min(membership, firingStrength)
                
                weightSum += (value * constrainedMembership)
                membershipSum += constrainedMembership
            }
        }
        
        if ( membershipSum == 0 ) {
            print("The numerical output in unavaliable. All memberships are zero.")
        }
        
        return weightSum / membershipSum
    }
}
