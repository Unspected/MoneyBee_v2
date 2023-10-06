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
    // TODO move AuthService
    private let users = [UserModel(userName: "pasha", password: "123", email: ""),
                 UserModel(userName: "masha", password: "321", email: ""),
                 UserModel(userName: "vasya", password: "542", email: ""),
                 UserModel(userName: "petya", password: "643", email: ""),
                 UserModel(userName: "admin", password: "1", email: "admin")
    ]
    
    private var cancellable = Set<AnyCancellable>()
    
    private func successAuth() {
        self.router.trigger(.tabBar)
    }
    
    func signUpButtonPressed() {
        router.trigger(.registration)
       }

}

extension LoginViewModelImpl: LoginViewModel {
    
    func signIn(login: String, password: String) {
        guard login.count > 3 else {
            errorSubject.send(.loginLenghtError)
            return
        }
        
        if users.contains(where: { $0.userName == login && $0.password == password }) {
            successAuth()
        } else {
            errorSubject.send(.authorizationError)
        }
    }
    
    var error: AnyPublisher<LoginViewError?, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    
}
