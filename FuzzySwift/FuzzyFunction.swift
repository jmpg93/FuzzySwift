//
//  FuzzyFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyFunction {
    var leftLimit: Double { get }
    var rightLimit: Double { get }

    func membershipDegree(of value: Double) -> Double
}
