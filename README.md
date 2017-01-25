# FuzzySwift 

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage) [![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](#swift-package-manager) ![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg) 

## What is FuzzySwift?
__FuzzySwift__ FuzzySwift provides basic tools to solve many different problems by using fuzzy logic with a handy syntax.

###FuzzySet
A fuzzy set just can be defined just by implementing the __FuzzySet__ procotol.

```swift
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
```
###FuzzyVariable
In the same way, it's possible to create a __FuzzyVariable__ and assign the corresponding __[FuzzySet]__

```swift
public struct Speed : FuzzyVariable {
    public init() { }
    
    public var name: String {
        return "Speed"
    }
    
    public var sets: [FuzzySet] {
        return Velocity.sets
    }
}
```

###FuzzyRuleset
__FuzzyRuleset__ will contain all the logic and rules of the __FuzzySet__ and __FuzzyVariable__.

```swift
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
                 if: speed == Velocity.slow || frontalDistance == Nearness.medium, then: frontalDistance => Nearness.close)
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
```

###InferenceManager
InferenceManager can evaluate data for given variable inputs.

```swift
let ruleset = SpeedRuleSet()
let system = InferenceManager(ruleSets: [ruleset])
system.set(input: 10, for: ruleset.speed)
let evaluated = system.evaluate(variable: ruleset.speed)
```
