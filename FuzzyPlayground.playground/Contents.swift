
import FuzzySwift
import XCPlayground

let start = CACurrentMediaTime()

let ruleSet: SpeedRuleSet = SpeedRuleSet()

let system = InferenceManager(ruleSets: [ruleSet])
system.set(input: 10, for: ruleSet.frontalDistance)
let evaluated = system.evaluate(variable: ruleSet.speed)

let end = CACurrentMediaTime()

print("Ext time: \(end - start)")
