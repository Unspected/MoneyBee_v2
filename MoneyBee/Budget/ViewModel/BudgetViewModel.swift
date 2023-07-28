//
//  BudgetViewModel.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/16/23.
//

import Foundation
import Combine

protocol BudgetViewModel {
    
    var goals: CurrentValueSubject<[GoalModel],Never> { get }
    func fetchGoals()
    
}
