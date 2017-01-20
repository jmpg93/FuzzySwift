//: Playground - noun: a place where people can play

import Cocoa
import FuzzySwift
import XCPlayground
import Accelerate

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
            return TrapetzoidalFunction(0, 20, 40, 60)
        case .medium:
            return TrapetzoidalFunction(40, 60, 80, 100)
        case .far:
            return TrapetzoidalFunction(80, 100, 120, 140)
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
            return TrapetzoidalFunction(0, 20, 40, 60)
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

// Fuzzy variables
let speed = Speed()
let rightDistance = Distance.right
let leftDistance = Distance.left
let frontalDistance = Distance.frontal


// System
let system = InferenceManager(variables: [speed, rightDistance, leftDistance, frontalDistance])
// Rules
let coolRule = Rule(name: "Movement 1",
                    if: rightDistance == Nearness.far || frontalDistance == Nearness.medium,
                    then: speed => Velocity.fast)


print(coolRule)

//TODO: Improve input output system
//Evaluation
//system.set(input: 50, for: frontalDistance)
//let value = system.evaluate(variable: speed)
