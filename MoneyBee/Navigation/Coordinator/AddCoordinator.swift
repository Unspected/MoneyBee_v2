import XCoordinator
import UIKit

enum AddRoute: Route {
    case add
    case pop
    case dismiss
    case newTransaction
    case newGoal
    case newCategory
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
        case .newTransaction:
            let viewModel = NewTransactionViewModelImpl(router: unownedRouter)
            let viewController = NewTransactionViewController(viewModel: viewModel)
            return  .push(viewController)
        case .newCategory:
            let viewModel = NewCategoryViewModelImpl(router: unownedRouter)
            let viewController = NewCategoryViewController(viewModel:  viewModel)
            return .push(viewController)
        case .newGoal:
            let viewModel = NewSavingGoalModelImpl(router: unownedRouter)
            let viewController = NewSavingGoalViewController(viewModel: viewModel)
            return .push(viewController)
        case .dismiss:
            return .dismiss()
        case .pop:
            return .pop()
        }
    }
}
