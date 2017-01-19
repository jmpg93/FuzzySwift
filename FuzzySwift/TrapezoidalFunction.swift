//
//  TrapezoidalFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class TrapezoidalFunction : BaseFunction {
    
    public enum CloseSide {
        case left
        case right
    }
    
    public init(_ leftBotton: Point, _ leftTop: Point, _ rightTop: Point, _ rightBottom: Point) {
        super.init([leftBotton, leftTop, rightTop, rightBottom])
    }
    
    public init(_ leftBotton: Double, _ leftTop: Double, _ rightTop: Double, _ rightBottom: Double) {
        super.init(
            [
                Point(leftBotton, 0),
                Point(leftTop, 1),
                Point(rightTop, 1),
                Point(rightBottom, 0)
            ]
        )
    }
    
    //TODO: Do not use p1, p1 or p3, p3. m calculation of function will get NaN
    convenience public init(_ p1: Double, _ p2: Double, _ p3: Double, _ closeSide: CloseSide) {
        switch closeSide {
        case .left:
            self.init(p1, p1, p2, p3)
        case .right:
            self.init(p1, p2, p3, p3)
        }
    }
}
