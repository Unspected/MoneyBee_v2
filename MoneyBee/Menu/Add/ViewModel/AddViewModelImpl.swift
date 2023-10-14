import UIKit
import XCoordinator

class AddViewModelImpl: AddViewModel {
    
    private let router: UnownedRouter<AddRoute>

    init(router: UnownedRouter<AddRoute>) {
        self.router = router
    }
    
    func presentGoalView() {
        self.router.trigger(.newGoal)
    }
    
    func presentTransctionView() {
        self.router.trigger(.newTransaction)
    }
    
    func presentCategoryView() {
        self.router.trigger(.newCategory)
    }
    
    
}


