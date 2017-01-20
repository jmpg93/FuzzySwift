//
//  FuzzySetExtension.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 20/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import FuzzySwift

extension FuzzySet {
    var random: Double {
        return Double(arc4random_uniform(UInt32(rightLimit))) + leftLimit
    }
}
