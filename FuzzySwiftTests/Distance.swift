import Foundation
import FuzzySwift

public enum Distance : FuzzyVariable {
    case frontal
    case left
    case right
    
    public var name: String {
        switch self {
        case .frontal:
            return "Frontal"
        case .left:
            return "Left"
        case .right:
            return "Right"
        }
    }
    
    public var sets: [FuzzySet] {
        return Nearness.sets
    }
}
