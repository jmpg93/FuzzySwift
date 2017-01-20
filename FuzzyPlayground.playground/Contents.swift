
import FuzzySwift
import XCPlayground

let speedRuleSet: SpeedRuleSet = SpeedRuleSet()

let system = InferenceManager(ruleSets: [speedRuleSet])
system.set(input: 10, for: speedRuleSet.frontalDistance)
let evaluated = system.evaluate(variable: speedRuleSet.speed)


print("Hola")
