//
//  StatementGroup.swift
//  FuzzySwift
//
//  Created by Jose Maria Puerta on 18/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct StatementGroup {
    var leftStatment: StatementGroup
    var rigthStatment: StatementGroup?
    var op: StatementOperator
    
    public init(leftStatment: StatementGroup, op: StatementOperator, rigthStatment: StatementGroup? = nil) {
        self.leftStatment = leftStatment
        self.op = op
        self.rigthStatment = rigthStatment
    }
}
