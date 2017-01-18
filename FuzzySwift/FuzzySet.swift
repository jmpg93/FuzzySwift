//
//  FuzzySet.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzySet {
    static var sets: [FuzzySet] { get }
    
    var function: FuzzyFunction { get }
    var name: String { get }
}


