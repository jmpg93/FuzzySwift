
import FuzzySwift
import XCPlayground

let ruleSet: SpeedRuleSet = SpeedRuleSet()

let system = InferenceManager(ruleSets: [ruleSet])
system.set(input: 10, for: ruleSet.frontalDistance)
let evaluated = system.evaluate(variable: ruleSet.speed)


print("Hola")
