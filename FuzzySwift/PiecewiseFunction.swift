//
//  PiecewiseFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct PiecewiseFunction : PiecewiseBaseFunction {
    public let points: [Point]
    
    public init(_ points: [Point]) {
        self.points = points
    }
}
