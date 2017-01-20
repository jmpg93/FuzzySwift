
import FuzzySwift
import XCPlayground

let start = CACurrentMediaTime()

let ruleset: SpeedRuleSet = SpeedRuleSet()

let system = InferenceManager(ruleSets: [ruleset])
system.set(input: 10, for: ruleset.frontalDistance)
let evaluated = system.evaluate(variable: ruleset.speed)

let end = CACurrentMediaTime()

print("Ext time: \(end - start)")
