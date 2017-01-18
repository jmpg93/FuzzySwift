//
//  FuzzyVariable.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct FuzzyVariable {
    public let name: String
    public let sets: [FuzzySet]
    
    init(name: String, sets: FuzzySet...) {
        self.name = name
        self.sets = sets
    }
}
