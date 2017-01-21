import Foundation
import FuzzySwift

public struct SpeedRuleSet : FuzzyRuleset {
    public var name: String {
        return "SpeedRuleSet"
    }
    
    public let speed = Speed()
    public let rightDistance = Distance.right
    public let leftDistance = Distance.left
    public let frontalDistance = Distance.frontal
    
    public init() { }
    
    public var rules: [Rule] {
        return [
            Rule(name: "Movement 1",
                 if: frontalDistance == Nearness.far, then: speed => Velocity.fast),
            Rule(name: "Movement 2",
                 if: frontalDistance == Nearness.medium, then: speed => Velocity.normal),
            Rule(name: "Movement 3",
                 if: frontalDistance == Nearness.close, then: speed => Velocity.slow),
            Rule(name: "Movement 4",
                 if: speed == Velocity.slow || frontalDistance == Nearness.medium,
                 then: frontalDistance => Nearness.close)
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
