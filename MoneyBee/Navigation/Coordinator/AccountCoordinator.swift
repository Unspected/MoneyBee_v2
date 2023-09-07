import XCoordinator
import UIKit

enum AccountRoute: Route {
    case account
    case pop
    case dismiss
}

final class AccountCoordinator: NavigationCoordinator<AccountRoute> {
    
    init() {
        super.init(initialRoute: .account)
    }
    
    override func prepareTransition(for route: AccountRoute) -> NavigationTransition {
        switch route {
        case .account:
            let viewModel = AccountViewModelImpl(router: unownedRouter)
            let viewController = AccountViewController(viewModel: viewModel)
            return .push(viewController)
        case .dismiss:
            return .dismiss()
        case .pop:
            return .pop()
        }
    }
}
