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
    
    public init(intervals: Double = 5) {
        self.intervals = intervals
    }
    
    public func defuzzify(output: Output) -> Double {
        
        print("Number of outputs: \(output.outputs.count)")
        print("Starting defuzzification for \(intervals) intervals")
        print("Variable: \(output.variable)")
        
        var weightSum: Double = 0
        var membershipSum: Double = 0
        
        let end = output.variable.end
        let beginning = output.variable.beginning
        let increment =  (end - beginning) / intervals
        
        print("Increment: \(increment)")
        for segment in stride(from: beginning, to: end, by: increment) {
            for (firingStrength, set, rule) in output.outputs {
                
                let membership = output.variable.membership(of: set, value: segment)
                let constrainedMembership = min(membership, firingStrength)
                
                print("\nRule: \(rule)")
                print("Set: \(set.name) => Firing Strength: \(firingStrength)")
                print("Membership: \(membership)")
                print("Constrained Membership: \(constrainedMembership)")
                
                weightSum += (segment * constrainedMembership)
                membershipSum += constrainedMembership
            }
        }
        
        if ( membershipSum == 0 ) {
            print("WTF")
        }
        
        return weightSum / membershipSum
    }
}
