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
            return TrapetzoidalFunction(80, 100, 120, 140)
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

enum Velocity: FuzzySet {
    case slow
    case normal
    case fast
    
    static var sets: [FuzzySet] {
        return _sets
    }
    
    private static var _sets: [Velocity] {
        return [.slow, .normal, .fast]
    }
    
    var function: FuzzyFunction {
        switch self {
        case .slow:
            return TrapetzoidalFunction(0, 40, 60, upperSide: .left)
        case .normal:
            return TrapetzoidalFunction(40, 60, 80, 100)
        case .fast:
            return TrapetzoidalFunction(80, 100, 120, 140)
        }
    }
    
    var name: String {
        switch self {
        case .slow:
            return "Slow"
        case .normal:
            return "Normal"
        case .fast:
            return "Fast"
        }
    }
}


struct Speed : FuzzyVariable {
    var name: String {
        return "Speed"
    }
    
    var sets: [FuzzySet] {
        return Velocity.sets
    }
}

enum Distance : FuzzyVariable {
    case frontal
    case left
    case right
    
    var name: String {
        switch self {
        case .frontal:
            return "Frontal"
        case .left:
            return "Left"
        case .right:
            return "Right"
        }
    }
    
    var sets: [FuzzySet] {
        return Nearness.sets
    }
}

enum Nearness: FuzzySet {
    case close
    case far
    case medium
    
    static var sets: [FuzzySet] {
        return _sets
    }
    
    private static var _sets: [Nearness] {
        return [.close, .far, .medium]
    }
    
    var function: FuzzyFunction {
        switch self {
        case .close:
            return TrapetzoidalFunction(0, 40, 60, upperSide: .left)
        case .medium:
            return TrapetzoidalFunction(40, 60, 80, 100)
        case .far:
            return TrapetzoidalFunction(80, 100, 140, upperSide: .right)
        }
    }
    
    var name: String {
        switch self {
        case .close:
            return "Close"
        case .far:
            return "Far"
        case .medium:
            return "Medium"
        }
    }
}
