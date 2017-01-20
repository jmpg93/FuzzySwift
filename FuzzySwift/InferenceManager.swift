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
    private var rulesets : [FuzzyRuleset]
    private var inputs: [String : Input]
    
    public init(defuzzier: Defuzzier = CentroidDefuzzifier(), ruleSets: [FuzzyRuleset] = []) {
        self.defuzzier = defuzzier
        self.rulesets = ruleSets
        self.inputs = [:]
    }
    
    //TODO: Check
    public func add(ruleSet: FuzzyRuleset) {
        rulesets += [ruleSet]
    }
    
    public func add(ruleSets: [FuzzyRuleset]) {
        ruleSets.forEach(add)
    }
    
    public func set(input: Double, for variable: FuzzyVariable) {
        print("Setting input \(input), for \(variable.name)")
        inputs[variable.name] = Input(variable: variable, value: input)
    }
    
    public func defuzzify(output: Output) -> Double {
        return defuzzier.defuzzify(output: output)
    }
    
    public func evaluate(variable: FuzzyVariable) -> Double {
        //defer { inputs = [:] }
        
        var output = Output(variable: variable)
        
        //For every rule we search for a match of evaluating variable and consequence.
        for rule in rules where rule.consequence.variable.name == variable.name {
            //If we got a match, then evaluate the rule with the input and add an output
            
            let associatedSet = rule.consequence.set
            let firingStrength = rule.firingStrength(for: Array(inputs.values))
            
            output.add(firingStrength: firingStrength, for: associatedSet, by: rule)
            
        }
        
        return defuzzify(output: output)
    }
    
    private var rules: [Rule] {
        return rulesets.flatMap({ $0.rules })
    }
    
    private var variables: [FuzzyVariable] {
        return rulesets.flatMap({ $0.variables })
    }
    
}
