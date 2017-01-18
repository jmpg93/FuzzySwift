//
//  TrapezoidalFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class TrapezoidalFunction : BaseFunction {
    
    public init(_ leftBotton: Point, _ leftTop: Point, _ rightTop: Point, _ rightBottom: Point) {
        super.init([leftBotton, leftTop, rightTop, rightBottom])
    }
    
    public init(_ leftBotton: Double, _ leftTop: Double, _ rightTop: Double, _ rightBottom: Double) {
        super.init(
            [
                Point(leftBotton, 0),
                Point(leftTop, 100),
                Point(rightTop, 100),
                Point(rightBottom, 0)
            ]
        )
    }
    
}
