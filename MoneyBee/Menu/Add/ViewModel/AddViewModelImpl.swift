import UIKit
import XCoordinator

class AddViewModelImpl: AddViewModel {
    
    private let router: UnownedRouter<AddRoute>

    init(router: UnownedRouter<AddRoute>) {
        self.router = router
    }
}
