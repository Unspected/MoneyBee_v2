import XCoordinator
import Foundation

class NewTransactionViewModelImpl: NewTransactionViewModel {
    
    private let router: UnownedRouter<AddRoute>

    init(router: UnownedRouter<AddRoute>) {
        self.router = router
    }
}
