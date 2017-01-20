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

class FuzzySwiftFunctionTests: XCTestCase {
    
    func testTrapezoidalFunction() {
        
        // Variables
        let trapezoidal = TrapezoidalVariable()
        /*
         case .left: TrapezoidalFunction(0, 20, 40, 60)
         case .center: TrapezoidalFunction(40, 60, 80, 100)
         case .right: TrapezoidalFunction(80, 100, 120, 140)
         */

        let noBelongsLeft = trapezoidal.membership(of: TrapezoidalSet.left, value: -1)
        let belongsPoint = trapezoidal.membership(of: TrapezoidalSet.left, value: 0)
        let belongsInBetween = trapezoidal.membership(of: TrapezoidalSet.left, value: 20)
        let belongsToTwo = trapezoidal.membership(of: TrapezoidalSet.left, value: 50)
        let noBelongsPointRight = trapezoidal.membership(of: TrapezoidalSet.left, value: 60)
        let noBelongs = trapezoidal.membership(of: TrapezoidalSet.left, value: 70)
        
        if (noBelongsLeft != 0) {
            XCTFail("Point that no belongs on left is retrieving \(noBelongsLeft)")
        } else if (belongsPoint != 1) {
            XCTFail("Point that belongs is retrieving \(belongsPoint)")
        } else if (belongsInBetween != 1) {
            XCTFail("Point that clearly belongs is retrieving \(belongsInBetween)")
        } else if (belongsToTwo != 0.5) {
            XCTFail("Point that belongs to two is retrieving \(belongsToTwo)")
        } else if (noBelongsPointRight != 0) {
            XCTFail("Point that is right limit and no belongs is retrieving \(noBelongsPointRight)")
        } else if (noBelongs != 0) {
            XCTFail("Point that clearly no belongs is retrieving \(noBelongs)")
        }
    }
    
}
