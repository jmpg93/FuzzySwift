import Foundation
import FuzzySwift

public struct Speed : FuzzyVariable {
    public init() { }
    
    public var name: String {
        return "Speed"
    }
    
    public var sets: [FuzzySet] {
        return Velocity.sets
    }
}
