//
//  StatementGroup.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public indirect enum StatementGroup : CustomStringConvertible {
    case single(Statement)
    case not(StatementGroup)
    case and (StatementGroup, StatementGroup)
    case or (StatementGroup, StatementGroup)
    
    public var description: String {
        return describe(self)
    }
    
    private func describe(_ sta: StatementGroup) -> String {
        return "TODO"
    }
}
