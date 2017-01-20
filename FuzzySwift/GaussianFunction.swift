//
//  GaussianFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

struct GaussianFunction : FuzzyFunction {
    var leftLimit: Double {
        return 0
    }
    
    var rightLimit: Double {
        return 0
    }
    
    func membershipDegree(of value: Double) -> Double {
        return 0
    }
}
