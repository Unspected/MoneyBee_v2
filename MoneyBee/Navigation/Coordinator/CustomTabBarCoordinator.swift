import XCoordinator
import UIKit

enum TabBarList: Route {
    case dashboard
    case goals
    case add
    case budget
    case account
}

final class CustomTabBarCoordinator: TabBarCoordinator<TabBarList> {
    
    private let dashboardRoute: StrongRouter<DashBoardRoute>
    private let goalsRoute: StrongRouter<GoalsRoute>
    private let addRoute: StrongRouter<AddRoute>
    private let budgetRoute: StrongRouter<BudgetRoute>
    private let accountRoute: StrongRouter<AccountRoute>
    
    convenience init() {
        
        let dashBoardCoordinator = DashBoardCoordinator()
        let dashboardTabItem = UITabBarItem(title: "Dashboard",
                                            image: UIImage(named: "dashboard"),
                                            selectedImage: UIImage(named: "dashboard"))
        dashboardTabItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        dashBoardCoordinator.rootViewController.tabBarItem = dashboardTabItem
        
        let goalsCoordinator = GoalsCoordinator()
        let goalsTabItem = UITabBarItem(title: "Goals",
                                        image: UIImage(named: "goals"),
                                        selectedImage: UIImage(named: "goals"))
        goalsTabItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        goalsCoordinator.rootViewController.tabBarItem = goalsTabItem
        
        let addCoordinator = AddCoordinator()
        let addTabItem = UITabBarItem(title: "Add",
                                      image: UIImage(named:"add"),
                                      selectedImage: UIImage(named:"add"))
        addTabItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        addCoordinator.rootViewController.tabBarItem = addTabItem
        
        let budgetCoordinator = BudgetCoordinator()
        let budgetTabItem = UITabBarItem(title: "Budget",
                                         image: UIImage(named: "budget"),
                                         selectedImage: UIImage(named: "budget"))
        budgetTabItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        budgetCoordinator.rootViewController.tabBarItem = budgetTabItem
        
        let accountCoordinator = AccountCoordinator()
        let accountTabItem = UITabBarItem(title: "Account",
                                          image: UIImage(named: "account"),
                                          selectedImage: UIImage(named: "account"))
        accountTabItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        accountCoordinator.rootViewController.tabBarItem = accountTabItem
        
        self.init(dashboardRoute: dashBoardCoordinator.strongRouter,
                  goalsRoute: goalsCoordinator.strongRouter,
                  addRoute: addCoordinator.strongRouter,
                  budgetRoute: budgetCoordinator.strongRouter,
                  accountRoute: accountCoordinator.strongRouter)
        
        setupTheme()
    }
    
    init(dashboardRoute: StrongRouter<DashBoardRoute>, goalsRoute: StrongRouter<GoalsRoute>, addRoute: StrongRouter<AddRoute>, budgetRoute: StrongRouter<BudgetRoute>, accountRoute: StrongRouter<AccountRoute>) {
        self.dashboardRoute = dashboardRoute
        self.goalsRoute = goalsRoute
        self.addRoute = addRoute
        self.budgetRoute = budgetRoute
        self.accountRoute = accountRoute
        super.init(tabs: [dashboardRoute,goalsRoute,addRoute,budgetRoute,accountRoute])
    }
    
    override func prepareTransition(for route: TabBarList) -> TabBarTransition {
        switch route {
        
        case .dashboard:
            return .select(dashboardRoute)
        case .goals:
            return .select(goalsRoute)
        case .add:
            return .select(addRoute)
        case .budget:
            return .select(budgetRoute)
        case .account:
            return .select(accountRoute)
        }
    }
}

private extension CustomTabBarCoordinator {
    
    func setupTheme() {
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = UIColor.gray
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().backgroundColor = UIColor.green
        rootViewController.tabBar.standardAppearance = apperance
        rootViewController.tabBar.tintColor = UIColor.lightGray
        rootViewController.tabBar.backgroundColor = UIColor.red
        rootViewController.tabBar.clipsToBounds = true
    }
}
