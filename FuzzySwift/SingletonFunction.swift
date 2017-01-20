//
//  SingletonFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct SingletonFunction : FuzzyFunction {
    private let value: Double
    
    public var leftLimit: Double {
        return value
    }
    
    public var rightLimit: Double {
        return value
    }
    
    public init(_ value: Double) {
        self.value = value
    }
    
    public func membershipDegree(of  value: Double) -> Double {
        return self.value == value ? 1 : 0
    }
}
