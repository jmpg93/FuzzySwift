//
//  FuzzyClause.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol FuzzyClause : CustomStringConvertible {
    var variable: FuzzyVariable!{ get }
    var set: FuzzySet! { get }
    
    func evaluate() -> Double
}

extension FuzzyClause {
    
    public var description: String {
        return variable.name + " is " + set.name
    }
    
    public func evaluate() -> Double {
        return set.membershipDegree(of: 0)
    }
}