//
//  MinOperator.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct MinOperator : FuzzyOperator {
    public func evaluate(leftValue: Double, rightValue: Double) -> Double {
        return min(leftValue, rightValue)
    }
}
