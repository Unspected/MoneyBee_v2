import Foundation
import Combine
import UIKit
import XCoordinator

// TODO move to Model
enum LoginViewError: LocalizedError {
    case authorizationError
    case loginLenghtError
    
    var errorDescription: String? {
        switch self {
        case .authorizationError:
            return "authorizationError"
        case .loginLenghtError:
            return "login too small"
        }
    }
}

class LoginViewModelImpl {
    
    private let errorSubject = PassthroughSubject<LoginViewError?, Never>()
    
    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
    
    let authService = AuthorizationService.shared
    
    private var cancellable = Set<AnyCancellable>()
    

}

extension LoginViewModelImpl: LoginViewModel {
    
    func signIn(login: String, password: String) {
        if !authService.validLogin(login: login) {
            errorSubject.send(.loginLenghtError)
        }

        if authService.users.contains(where: { $0.userName == login && $0.password == password }) {
            successAuth()
        } else {
            errorSubject.send(.authorizationError)
        }
    }
    
    var error: AnyPublisher<LoginViewError?, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    func signUpButtonPressed() {
        router.trigger(.registration)
    }
    
    func successAuth() {
        self.router.trigger(.tabBar)
    }
    
    
}
