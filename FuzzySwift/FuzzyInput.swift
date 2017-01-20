//
//  FuzzyInput.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyInput {
    var variable: FuzzyVariable { get }
    var value: Double { get }
}
