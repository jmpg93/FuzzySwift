import Foundation
import FuzzySwift

public struct SpeedRuleSet : FuzzyRuleSet {
    public let speed = Speed()
    public let rightDistance = Distance.right
    public let leftDistance = Distance.left
    public let frontalDistance = Distance.frontal
    
    public init() { }
    
    public var rules: [Rule] {
        return [
            Rule(name: "Movement 1",
                 if: rightDistance == Nearness.far || frontalDistance == Nearness.medium,
                 then: speed => Velocity.fast),
            Rule(name: "Movement 2",
                 if: rightDistance == Nearness.far || frontalDistance == Nearness.medium,
                 then: speed => Velocity.fast),
            Rule(name: "Movement 3",
                 if: rightDistance == Nearness.far || frontalDistance == Nearness.medium,
                 then: speed => Velocity.fast)
        ]
    }
    
    public var variables: [FuzzyVariable] {
        return [
            speed,
            rightDistance,
            leftDistance,
            frontalDistance
        ]
    }
}
