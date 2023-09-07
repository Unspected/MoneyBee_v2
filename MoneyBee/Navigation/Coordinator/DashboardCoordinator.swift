import XCoordinator
import UIKit

enum DashBoardRoute: Route {
    case dashboard
    case pop
    case dismiss
}

final class DashBoardCoordinator: NavigationCoordinator<DashBoardRoute> {
    
    
    init() {
        super.init(initialRoute: .dashboard)
    }
    
    override func prepareTransition(for route: DashBoardRoute) -> NavigationTransition {
        switch route {
        case .dashboard:
            let viewModel = DashBoardViewModelImpl(router: unownedRouter)
            let viewController = DashboardViewController(viewModel: viewModel)
            return .push(viewController)
        case .pop:
            return .pop()
        case .dismiss:
            return .dismiss()
        }
    }
    
}
