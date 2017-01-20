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
            return TrapetzoidalFunction(0, 40, 60, upperSide: .left)
        case .normal:
            return TrapetzoidalFunction(40, 60, 80, 100)
        case .fast:
            return TrapetzoidalFunction(80, 100, 140,  upperSide: .right)
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
