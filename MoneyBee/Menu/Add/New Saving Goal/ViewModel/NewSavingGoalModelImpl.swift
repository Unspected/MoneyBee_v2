import XCoordinator
import Foundation

final class NewSavingGoalModelImpl: NewSavingGoalModel {
    
    private let router: UnownedRouter<AddRoute>

    init(router: UnownedRouter<AddRoute>) {
        self.router = router
    }
}
