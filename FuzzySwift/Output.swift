//
//  Output.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Output : FuzzyOutput {
    public let variable: FuzzyVariable
    public var outputs: [FiringStrengthSet]
    public init(variable: FuzzyVariable) {
        self.variable = variable
        self.outputs = []
    }
}
