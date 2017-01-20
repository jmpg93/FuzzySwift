//
//  FuzzySwiftTestHelper.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import FuzzySwift


enum TrapezoidalSet: FuzzySet {
    case left
    case center
    case right
    
    static var sets: [FuzzySet] {
        return _sets
    }
    
    private static var _sets: [TrapezoidalSet] {
        return [.left, .center, .right]
    }
    
    var function: FuzzyFunction {
        switch self {
        case .left:
            return TrapetzoidalFunction(0, 40, 60, upperSide: .left)
        case .center:
            return TrapetzoidalFunction(40, 60, 80, 100)
        case .right:
            return TrapetzoidalFunction(80, 100, 140,  upperSide: .right)
        }
    }
    
    var name: String {
        switch self {
        case .left:
            return "Left"
        case .center:
            return "Center"
        case .right:
            return "Right"
        }
    }
}

struct TrapezoidalVariable : FuzzyVariable {
    var name: String {
        return "TrapezoidalVariable"
    }
    
    var sets: [FuzzySet] {
        return TrapezoidalSet.sets
    }
}
