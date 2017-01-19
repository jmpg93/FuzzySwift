//
//  InferenceManager.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public typealias RuleBox = Dictionary<String, Rule>
public typealias VariableBox = Dictionary<String, FuzzyVariable>
public typealias InputBox = Dictionary<String, Double>

//TODO: Make Protocol
public class InferenceManager {
    private let defuzzier: Defuzzier
    public private(set) var inputBox: InputBox
    public private(set) var rulebox: RuleBox
    public private(set) var variableBox: VariableBox
    
    public init(defuzzier: Defuzzier = CentroidDefuzzifier(), variables: [FuzzyVariable] = []) {
        self.defuzzier = defuzzier
        
        self.rulebox = RuleBox()
        self.variableBox = VariableBox()
        self.inputBox = InputBox()
    }
    
    public func add(variable: FuzzyVariable) {
        if variable.name.isEmpty {
            print("A rule with no name cannot be added to the system")
            return
        }
        
        if variableBox.contains(where: { $0.key == variable.name }) {
            print("A rule with the name \(variable.name) was already in the system")
            return
        }
        
        variableBox[variable.name] = variable
    }
    
    public func add(variables: [FuzzyVariable]) {
        variables.forEach(add)
    }
    
    public func add(rule: Rule) {
        if rule.name.isEmpty {
            print("A rule with no name cannot be added to the system")
            return
        }
        
        if rulebox.contains(where: { $0.key == rule.name }) {
            print("A rule with the name \(rule.name) was already in the system")
            return
        }
        
        rulebox[rule.name] = rule
    }
    
    public func add(rules: [Rule]) {
        rules.forEach(add)
    }
    
    public func add(rules: Rule...) {
        rules.forEach(add)
    }
    
    public func set(input: Double, for variable: FuzzyVariable) {
        if let variable = variableBox[variable.name] {
            inputBox[variable.name] = input
        } else {
            print("Could not find variable \(variable.name) in the system")
        }
        
    }
    
    public func defuzzify(output: Output) -> Double {
        return defuzzier.defuzzify(output: output)
    }
    
    public func evaluate(variable: FuzzyVariable) -> Double {
        defer { inputBox.removeAll() }
        
        var output = Output(variable: variable)
        
        for rule in rulebox.values {
            if rule.consequent.variable.name == variable.name {
                let associatedSet = rule.consequent.set
                let firingStrength = rule.firingStrength(for: inputBox)
                
                output.add(firingStrength: firingStrength, for: associatedSet)
                
            }
        }

        return defuzzify(output: output)
    }
}
