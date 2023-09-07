import XCoordinator
import UIKit

enum BudgetRoute: Route {
    case budget
    case pop
    case dismiss
}

final class BudgetCoordinator: NavigationCoordinator<BudgetRoute> {
    
    init() {
        super.init(initialRoute: .budget)
    }
    
    override func prepareTransition(for route: BudgetRoute) -> NavigationTransition {
        switch route {
        case .budget:
            let viewModel = BudgetViewModelImpl(router: unownedRouter)
            let viewController = BudgetViewController(viewModel: viewModel)
            return .push(viewController)
        case .dismiss:
            return .dismiss()
        case .pop:
            return .pop()
        }
    }
}

