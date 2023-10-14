
import XCoordinator
import Foundation

class NewCategoryViewModelImpl: NewCategoryViewModel {
    
    private let router: UnownedRouter<AddRoute>

    init(router: UnownedRouter<AddRoute>) {
        self.router = router
    }
    
}
