//
//  ClauseGroup.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public indirect enum ClauseGroup : CustomStringConvertible {
    case single(Clause)
    case not(ClauseGroup)
    case and (ClauseGroup, ClauseGroup)
    case or (ClauseGroup, ClauseGroup)
    
    public var description: String {
        return describe(self)
    }

    private func describe(_ sta: ClauseGroup) -> String {
        switch sta {
        case let .single(sta):
            return sta.description
        case let .not(sta):
            return " not " + sta.description
        case let .and (leftSta, rightSta):
            return leftSta.description + " and " + rightSta.description
        case let .or (leftSta, rightSta):
            return leftSta.description + " or " + rightSta.description
        }
    }
}
