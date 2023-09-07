import XCoordinator
import UIKit

enum GoalsRoute: Route {
    case goals
    case pop
    case dismiss
}

final class GoalsCoordinator: NavigationCoordinator<GoalsRoute> {
    
    init() {
        super.init(initialRoute: .goals)
    }
    
    override func prepareTransition(for route: GoalsRoute) -> NavigationTransition {
        switch route {
        case .goals:
            let viewModel = GoalsViewModelImpl(router: unownedRouter)
            let viewController = GoalsViewController(viewModel: viewModel)
            return .push(viewController)
        case .dismiss:
            return .dismiss()
        case .pop:
            return .pop()
        }
    }
}
