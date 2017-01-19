//
//  FuzzySwiftTestHelper.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import FuzzySwift

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
            return TrapezoidalFunction(0, 40, 60, upperSide: .left)
        case .medium:
            return TrapezoidalFunction(40, 60, 80, 100)
        case .far:
            return TrapezoidalFunction(80, 100, 120, 140)
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
            return TrapezoidalFunction(0, 40, 60, upperSide: .left)
        case .center:
            return TrapezoidalFunction(40, 60, 80, 100)
        case .right:
            return TrapezoidalFunction(80, 100, 120, 140)
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
            return TrapezoidalFunction(0, 40, 60, upperSide: .left)
        case .normal:
            return TrapezoidalFunction(40, 60, 80, 100)
        case .fast:
            return TrapezoidalFunction(80, 100, 120, 140)
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


struct Speed : FuzzyVariable {
    var name: String {
        return "Speed"
    }
    
    var sets: [FuzzySet] {
        return Velocity.sets
    }
}
