//
//  InferenceManager.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class InferenceManager {
    private let defuzzier: Defuzzier
    
    public init(defuzzier: Defuzzier = CentroidDefuzzifier()) {
        self.defuzzier = defuzzier
    }
    
    public func add(variable: FuzzyVariable) {
        
    }
    
    public func add(variables: FuzzyVariable...) {
        
    }
    
    public func add(rule: Rule) {
        
    }
    
    public func add(rules: Rule...) {
        
    }
    
    public func set(input: Double, for variable: FuzzyVariable) {
        
    }
    
    public func evaluate(variable: FuzzyVariable) -> Double {
        return 0
    }
}
