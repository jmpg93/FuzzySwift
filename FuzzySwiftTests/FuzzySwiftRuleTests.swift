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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRuleFiringStrength() {
        let speed = Speed()
        let distance = Distance.frontal
        
        let rule = Rule(name: "R1",
                        if: distance == Nearness.far || distance == Nearness.medium,
                        then: speed => Velocity.fast)

        
        var box = InputBox()
        box[distance.name] = 70
        
        let s = InferenceManager(variables: [])
        s.add(variables: [speed, distance])
        s.set(input: 70, for: distance)
        
        s.add(rule: rule)
        
        let e = s.evaluate(variable: speed)
        
        print(e)
        
        
    }
    
}
