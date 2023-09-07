import Foundation
import XCoordinator

final class AccountViewModelImpl: AccountViewModel {
    
    private let router: UnownedRouter<AccountRoute>

    init(router: UnownedRouter<AccountRoute>) {
        self.router = router
    }
}
