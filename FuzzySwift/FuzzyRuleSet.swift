//
//  RuleBlock.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyRuleset {
    var name: String { get }
    var andOperator: FuzzyOperator { get }
    var orOperator: FuzzyOperator { get }
    
    var variables: [FuzzyVariable] { get }
    var rules: [Rule] { get }
}

public extension FuzzyRuleset {
    public var andOperator: FuzzyOperator {
        return MaxOperator()
    }
    
    public var orOperator: FuzzyOperator {
        return MaxOperator()
    }
}
