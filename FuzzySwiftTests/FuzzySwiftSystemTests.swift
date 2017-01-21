//
//  FuzzySwiftSystemTests.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

import XCTest
@testable import FuzzySwift

class FuzzySwiftSystemTests: XCTestCase {
    
    var ruleset: SpeedRuleSet!
    var system: InferenceManager!
    
    override func setUp() {
        super.setUp()
        ruleset = SpeedRuleSet()
        system = InferenceManager(ruleSets: [ruleset])
    }
    
    /*
     if: frontalDistance == Nearness.far,
     then: speed => Velocity.fast)
     
     if: frontalDistance == Nearness.medium,
     then: speed => Velocity.normal)
     
     if: frontalDistance == Nearness.close,
     then: speed => Velocity.slow)
     */
    
    func testSystemWithOneClause() {
        system.set(input: 10, for: ruleset.frontalDistance)
        let evaluated = system.evaluate(variable: ruleset.speed)
        
        if !Velocity.slow.range.contains(evaluated) {
            XCTFail()
        }
    }
    
    func testSystemWithTwoOrClauses() {
        system.set(input: 10, for: ruleset.speed)
        let evaluated = system.evaluate(variable: ruleset.speed)
        
        if !Nearness.close.range.contains(evaluated) {
            XCTFail()
        }
    }
    
}

extension FuzzySet {
    var range: Range<Double> {
        return Range(uncheckedBounds: (lower: leftLimit, upper: rightLimit))
    }
}
