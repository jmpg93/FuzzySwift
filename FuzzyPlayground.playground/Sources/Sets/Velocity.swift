import Foundation
import FuzzySwift

public enum Velocity: FuzzySet {
    case slow
    case normal
    case fast
    
    public static var sets: [FuzzySet] {
        return _sets
    }
    
    private static var _sets: [Velocity] {
        return [.slow, .normal, .fast]
    }
    
    public var function: FuzzyFunction {
        switch self {
        case .slow:
            return TrapetzoidalFunction(0, 20, 40, 60)
        case .normal:
            return TrapetzoidalFunction(40, 60, 80, 100)
        case .fast:
            return TrapetzoidalFunction(80, 100, 120, 140)
        }
    }
    
    public var name: String {
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
