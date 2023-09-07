import UIKit
import XCoordinator

final class DashBoardViewModelImpl: DashboardViewModel {
    
    private let router: UnownedRouter<DashBoardRoute>

    init(router: UnownedRouter<DashBoardRoute>) {
        self.router = router
    }
}
