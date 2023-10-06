
import Foundation
import Combine
import XCoordinator

class BudgetViewModelImpl: BudgetViewModel {
    
    func fetchGoals() -> AnyPublisher<[GoalModel], Never> {
        let fetchGoals = [GoalModel(type: Category(name: "food"), goalName: "restaraunt", budgetAmount: 250, currentCosts: 200),
                                  GoalModel(type: Category(name: "food"), goalName: "whole foods", budgetAmount: 1000, currentCosts: 100),
                                  GoalModel(type: Category(name: "food"), goalName: "mcDonalds", budgetAmount: 100, currentCosts: 15),
                          GoalModel(type: Category(name: "bills"), goalName: "utilities", budgetAmount: 50, currentCosts: 10)]
        return Just(fetchGoals).eraseToAnyPublisher()
    }
    
    var goals = PassthroughSubject<[GoalModel], Never>()
    
    private let router: UnownedRouter<BudgetRoute>

    init(router: UnownedRouter<BudgetRoute>) {
        self.router = router
    }
    
    func createNewBudget() {
     //   router.trigger(.create_new_budget)
    }
}
