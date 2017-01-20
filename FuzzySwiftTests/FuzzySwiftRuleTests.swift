//
//  FuzzySwiftRuleTests.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

import XCTest
@testable import FuzzySwift

class FuzzySwiftRuleTests: XCTestCase {
    public let speed = Speed()
    public let rightDistance = Distance.right
    public let leftDistance = Distance.left
    public let frontalDistance = Distance.frontal
    
    var singleRule: Rule!
    var andRule: Rule!
    var orRule: Rule!
    
    override func setUp() {
        super.setUp()
        singleRule = Rule(name: "Single",
                          if: frontalDistance == Nearness.far,
                          then: speed => Velocity.fast)
        
        andRule = Rule(name: "And",
                       if: frontalDistance == Nearness.far && leftDistance == Nearness.medium,
                       then: speed => Velocity.fast)
        
        orRule = Rule(name: "Or",
                      if: frontalDistance == Nearness.far || leftDistance == Nearness.medium,
                      then: speed => Velocity.fast)
    }
    
    func testRuleFiringStrengthOne() {
        let input = Input(variable: frontalDistance, value: 130)
        let fs = singleRule.firingStrength(for: [input])
        
        if (fs != 1) {
            XCTFail()
        }
    }
    
    func testRuleFiringStrengthZero() {
        let input = Input(variable: frontalDistance, value: 0)
        let fs = singleRule.firingStrength(for: [input])
        
        if (fs != 0) {
            XCTFail()
        }
    }
    
    func testRuleFiringStrengthBetween() {
        let input = Input(variable: frontalDistance, value: 90)
        let fs = singleRule.firingStrength(for: [input])
        
        
        if (fs != 0.5) {
            XCTFail()
        }
    }
    
    func testRuleFiringStrengthOneAndOperator() {
        let inputFar = Input(variable: frontalDistance, value: 120)
        let inputMedium = Input(variable: leftDistance, value: 60)
        let fs = andRule.firingStrength(for: [inputFar, inputMedium])
        
        print(fs)
        if (fs != 1) {
            XCTFail()
        }
    }
    
    func testRuleFiringStrengthZeroAndOperator() {
        let inputFar = Input(variable: frontalDistance, value: 120)
        let inputMedium = Input(variable: leftDistance, value: 0)
        let fs = andRule.firingStrength(for: [inputFar, inputMedium])
        
        print(fs)
        if (fs != 0) {
            XCTFail()
        }
    }
    
    
    func testRuleFiringStrengthBetweenAndOperator() {
        let inputFar = Input(variable: frontalDistance, value: 90)
        let inputMedium = Input(variable: leftDistance, value: 50)
        let fs = andRule.firingStrength(for: [inputFar, inputMedium])
        
        print(fs)
        if (fs != 0.5) {
            XCTFail()
        }
    }
    
    func testRuleFiringStrengthOneOrOperator() {
        let input = Input(variable: frontalDistance, value: 120)
        let fs = orRule.firingStrength(for: [input])

        if (fs != 1) {
            XCTFail()
        }
    }
    
    func testRuleFiringStrengthZeroOrOperator() {
        let inputFar = Input(variable: frontalDistance, value: 0)
        let inputMedium = Input(variable: leftDistance, value: 0)
        let fs = orRule.firingStrength(for: [inputFar, inputMedium])
        
        if (fs != 0) {
            XCTFail()
        }
    }
    
    func testRuleFiringStrengthBetweenOrOperator() {
        let inputFar = Input(variable: frontalDistance, value: 90)
        let inputMedium = Input(variable: leftDistance, value: 0)
        
        let fs = orRule.firingStrength(for: [inputFar, inputMedium])
        
        if (fs != 0.5) {
            XCTFail()
        }
    }
}
