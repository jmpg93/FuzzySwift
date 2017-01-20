//
//  TriangleFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 19/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct TriangularFunction : FuzzyPiecewiseFunction {
    public let points: [Point]
    
    public enum UpperSide {
        case left
        case right
    }
    
    public init(_ points: [Point]) {
        self.points = points
    }
    
    public init(_ leftBotton: Double, _ top: Double, _ rightBottom: Double) {
        points =
            [
                Point(leftBotton, 0),
                Point(top, 1),
                Point(rightBottom, 0)
        ]
    }
    
    public init(_ p1: Double, _ p2: Double, upperSide: UpperSide) {
        switch upperSide {
        case .left:
            self.init(p1, p1, p2)
        case .right:
            self.init(p1, p2, p2)
        }
    }
}
