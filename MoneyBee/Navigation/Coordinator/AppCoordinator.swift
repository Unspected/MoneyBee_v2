//
//  AppCoordinator.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/26/23.
//

import UIKit
import XCoordinator

// MARK: - AppRoute

enum AppRoute: Route {
    case login
    case registration
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
        case .dismiss:
            return .dismiss()
        case .pop:
            return .pop()
        }
    }
    
    //    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
    //        setupNavBar()
    //
    //        switch route {
    //        case .onboarding:
    //            let viewController = OnboardingVC.instantiateFromNib()
    //            let viewModel = OnboardingViewModelImpl(router: unownedRouter)
    //            viewController.bind(to: viewModel)
    //            return .push(viewController)
    //        case .auth:
    //            let viewController = AuthSceneController.instantiateFromNib()
    //            let viewModel = AuthViewModelImpl(router: unownedRouter)
    //            viewController.bind(to: viewModel)
    //            return .push(viewController)
    //        case .home:
    //            let coordinator = CustomTabBarCoordinator().strongRouter
    //            return .presentFullScreen(coordinator, animation: .fade)
    //        case .dismiss:
    //            return .dismiss()
    //        case .pop:
    //            return .pop()
    //        }
    //    }
}
