//
//  FuzzyVariable.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyVariable {
    var name: String { get }
    var sets: [FuzzySet] { get }
}
