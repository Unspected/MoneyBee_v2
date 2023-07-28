//
//  BudgetViewModelImpl.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/16/23.
//

import Foundation
import Combine

class BudgetViewModelImpl: BudgetViewModel {
    
    
    var goals = CurrentValueSubject<[GoalModel], Never>([])
    
    func fetchGoals() {
        let fetchGoals = [GoalModel(type: Category(name: "food"), goalName: "restaraunt", budgetAmount: 250, currentCosts: 200),
                                  GoalModel(type: Category(name: "food"), goalName: "whole foods", budgetAmount: 1000, currentCosts: 100),
                                  GoalModel(type: Category(name: "food"), goalName: "mcDonalds", budgetAmount: 100, currentCosts: 15),
                                  GoalModel(type: Category(name: "bills"), goalName: "utilities", budgetAmount: 50, currentCosts: 10)]
        goals.value = fetchGoals
    }
    
    init() {
        fetchGoals()
    }
    
    
}
