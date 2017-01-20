import Foundation
import FuzzySwift

public enum Nearness: FuzzySet {
    case close
    case far
    case medium
    
    public static var sets: [FuzzySet] {
        return _sets
    }
    
    private static var _sets: [Nearness] {
        return [.close, .far, .medium]
    }
    
    public var function: FuzzyFunction {
        switch self {
        case .close:
            return TrapetzoidalFunction(0, 20, 40, 60)
        case .medium:
            return TrapetzoidalFunction(40, 60, 80, 100)
        case .far:
            return TrapetzoidalFunction(80, 100, 120, 140)
        }
    }
    
    public var name: String {
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
