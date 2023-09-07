import XCoordinator
import UIKit

enum AddRoute: Route {
    case add
    case pop
    case dismiss
}

final class AddCoordinator: NavigationCoordinator<AddRoute> {
    
    init() {
        super.init(initialRoute: .add)
    }
    
    override func prepareTransition(for route: AddRoute) -> NavigationTransition {
        switch route {
        case .add:
            let viewModel = AddViewModelImpl(router: unownedRouter)
            let viewController = AddViewController(viewModel: viewModel)
            return .push(viewController)
        case .dismiss:
            return .dismiss()
        case .pop:
            return .pop()
        }
    }
}
