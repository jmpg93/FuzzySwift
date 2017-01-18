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
    
    public func defuzzify() -> Double {
        return 0.0
    }
}
