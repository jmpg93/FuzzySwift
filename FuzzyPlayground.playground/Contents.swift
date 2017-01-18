//: Playground - noun: a place where people can play

import Cocoa
import FuzzySwift
import XCPlayground
import Accelerate

typealias DoubleStatement = Statement<Double>

enum Distance: FuzzySet {
    case close
    case far
    case medium
    
    static var sets: [FuzzySet] {
        return _sets
    }
    
    private static var _sets: [Distance] {
        return [.close, .far, .medium]
    }
    
    var function: FuzzyFunction {
        switch self {
        case .close:
            return TrapezoidalFunction(0, 20, 40, 60)
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

enum Speed: FuzzySet {
    case slow
    case normal
    case fast
    
    static var sets: [FuzzySet] {
        return _sets
    }
    
    private static var _sets: [Speed] {
        return [.slow, .normal, .fast]
    }
    
    var function: FuzzyFunction {
        switch self {
        case .slow:
            return TrapezoidalFunction(0, 20, 40, 60)
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


