//
//  RuleBlock.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyRuleSet {
    var andOperator: FuzzyOperator { get }
    var orOperator: FuzzyOperator { get }
    
    var variables: [FuzzyVariable] { get }
    var rules: [Rule] { get }
}

public extension FuzzyRuleSet {
    public var andOperator: FuzzyOperator {
        return MaxOperator()
    }
    
    public var orOperator: FuzzyOperator {
        return MaxOperator()
    }
}
