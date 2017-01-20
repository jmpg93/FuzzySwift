//
//  BaseFunction.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 17/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol BaseFunction : FuzzyFunction {
    var points: [Point] { get }
}

extension BaseFunction {
    
    private var firstPoint : Point {
        return points.first!
    }
    
    private var lastPoint : Point {
        return points.first!
    }
    
    public var leftLimit: Double {
        return points.first?.x ?? 0
    }
    
    public var rightLimit: Double {
        return points.last?.x ?? 0
    }
    
    public func membershipDegree(of value: Double) -> Double {
        
        if (points.count == 0) {
            return 0
        }
        
        if (value < firstPoint.x) {
            return firstPoint.y
        }
        
        for i in 1...points.count - 1 {
            if (value < points[i].x) {
                let p1 = points[i]
                let p0 = points[i-1]
                
                if (p1.x == p0.x) {
                    // Vertical slope.
                    return 1
                }
                let m = (p1.y - p0.y) / (p1.x - p0.x)
                
                return m * (value - p0.x) + p0.y
            }
        }
        
        return lastPoint.y
    }
}
