import UIKit
import XCoordinator

// MARK: - AppRoute

enum AppRoute: Route {
    case login
    case registration
    case tabBar
    case dismiss
    case pop
}

final class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .login)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        
        switch route {
        case .login:
            let viewModel = LoginViewModelImpl(router: unownedRouter)
            let viewController = LoginViewController(viewModel: viewModel)
            return .push(viewController)
        case .registration:
            let viewModel = RegisterViewModelImpl(router: unownedRouter)
            let viewController = RegisterationViewController(viewModel: viewModel)
            return .push(viewController)
        case .tabBar:
            let coordinator = CustomTabBarCoordinator().strongRouter
            return .presentFullScreen(coordinator, animation: .none)
        case .dismiss:
            return .dismiss()
        case .pop:
            return .pop()
        }
    }
    
}
