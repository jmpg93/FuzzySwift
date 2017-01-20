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
    public private(set) var ruleSets : [FuzzyRuleSet]
    public private(set) var inputs: [String : Input]
    
    public init(defuzzier: Defuzzier = CentroidDefuzzifier(), ruleSets: [FuzzyRuleSet] = []) {
        self.defuzzier = defuzzier
        self.ruleSets = ruleSets
        self.inputs = [:]
    }
    
    public func add(ruleSet: FuzzyRuleSet) {
        ruleSets += [ruleSet]
    }
    
    public func add(ruleSets: [FuzzyRuleSet]) {
        ruleSets.forEach(add)
    }
    
    public func set(input: Double, for variable: FuzzyVariable) {
       inputs[variable.name] = Input(variable: variable, value: input)
    }
    
    public func defuzzify(output: Output) -> Double {
        return defuzzier.defuzzify(output: output)
    }
    
    public func evaluate(variable: FuzzyVariable) -> Double {
        defer { inputs = [:] }
        
        var output = Output(variable: variable)
        
        //For every rule we search for a match of evaluating variable and consequence.
        for rule in rules where rule.consequence.variable.name == variable.name {
            
            //If we got a match, then evaluate the rule with the input and add an output
            if let input = inputs[variable.name] {
                
                let associatedSet = rule.consequence.set
                let firingStrength = rule.firingStrength(for: input)
                
                output.add(firingStrength: firingStrength, for: associatedSet)
            }
        }
        
        return defuzzify(output: output)
    }
    
    private var rules: [Rule] {
        return ruleSets.flatMap({ $0.rules })
    }
    
    private var variables: [FuzzyVariable] {
        return ruleSets.flatMap({ $0.variables })
    }
    
}
