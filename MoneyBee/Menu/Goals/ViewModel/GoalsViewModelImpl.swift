import UIKit
import XCoordinator

final class GoalsViewModelImpl: GoalsViewModel {
    
    private let router: UnownedRouter<GoalsRoute>

    init(router: UnownedRouter<GoalsRoute>) {
        self.router = router
    }
}
