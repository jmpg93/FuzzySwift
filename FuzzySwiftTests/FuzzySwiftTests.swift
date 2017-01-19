//
//  FuzzySwiftTests.swift
//  FuzzySwiftTests
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import XCTest
@testable import FuzzySwift

class FuzzySwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
        // Variables
        let speed = Speed()
        let rightDistance = Distance.right
        let leftDistance = Distance.left
        let frontalDistance = Distance.frontal
        
        
        // System
        let system = InferenceManager()
        system.add(variables: [speed, rightDistance, leftDistance, frontalDistance])
        
        // Rules
        let rule = Rule(name: "R1", if: (rightDistance =? Nearness.far) || (frontalDistance =? Nearness.medium), then: speed == Velocity.fast)
        
        print(rule)
        
        system.add(rule: rule)
        
        //Evaluation
        system.set(input: 50, for: frontalDistance)
        let value = system.evaluate(variable: speed)
        
        print(value)
    }
    
}
