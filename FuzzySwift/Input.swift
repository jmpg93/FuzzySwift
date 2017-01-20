//
//  Input.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Input: FuzzyInput {
    public let variable: FuzzyVariable
    public let value: Double
    
    public init(variable: FuzzyVariable, value: Double) {
        self.variable = variable
        self.value = value
    }
}

