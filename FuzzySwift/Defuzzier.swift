//
//  Defuzzier.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol Defuzzier {
    func defuzzify(output: Output) -> Double
}
