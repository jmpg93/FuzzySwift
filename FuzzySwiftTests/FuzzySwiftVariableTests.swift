//
//  FuzzySwiftVariableTests.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

import XCTest
@testable import FuzzySwift

class FuzzySwiftVariableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
        // Variables
        let speed = Speed()
        /*
        case .slow: TrapezoidalFunction(0, 20, 40, 60)
        case .normal: TrapezoidalFunction(40, 60, 80, 100)
        case .fast: TrapezoidalFunction(80, 100, 120, 140)
         */
        
        let slow1 = speed.membership(of: Velocity.slow, value: -1)
        let slow2 = speed.membership(of: Velocity.slow, value: 0)
        let slow3 = speed.membership(of: Velocity.slow, value: 1)
        let slow4 = speed.membership(of: Velocity.slow, value: 20)
        let slow5 = speed.membership(of: Velocity.slow, value: 50)
        let slow6 = speed.membership(of: Velocity.slow, value: 60)
        let slow7 = speed.membership(of: Velocity.slow, value: 70)
        
        print(slow1, slow2, slow3, slow4, slow5, slow6, slow7)
    }
    
}
