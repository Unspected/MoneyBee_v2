
import Foundation
import UIKit
import XCoordinator
import Combine


class RegisterViewModelImpl  {
    
    private var cancellable = Set<AnyCancellable>()
    
    private let errorSubject = PassthroughSubject<RegisterationError?, Never>()
    
    private let authorizationService = AuthorizationService.shared
    
    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
    
}

extension RegisterViewModelImpl: RegisterViewModel {
    
    var userNameSubject: CurrentValueSubject<String, Never> {
        .init("")
    }
    
    var emailSubject: CurrentValueSubject<String, Never> {
        .init("")
    }
    
    var passwordSubject: CurrentValueSubject<String, Never> {
        .init("")
    }
    
    var repeatPasswordSubject: CurrentValueSubject<String, Never> {
        .init("")
    }
    
    private var userNameValidation: AnyPublisher<Bool, Never> {
        userNameSubject
            .filter { !$0.isEmpty}
            .map { $0.isValidUserName() }
            .eraseToAnyPublisher()
    }
    
    private var emailValidation: AnyPublisher<Bool, Never> {
        emailSubject
            .filter { !$0.isEmpty }
            .map { $0.isValidEmail() }
            .eraseToAnyPublisher()
    }
    
    private var passwordValidation: AnyPublisher<Bool, Never> {
        passwordSubject
            .filter { !$0.isEmpty }
            .map { $0.isValidPassword() }
            .eraseToAnyPublisher()
    }
    
    private var repeatpasswordValidation: AnyPublisher<Bool, Never> {
        repeatPasswordSubject
            .filter { !$0.isEmpty }
            .map { $0.isValidPassword() }
            .eraseToAnyPublisher()
    }
    
    var validationError: AnyPublisher<RegisterationError?, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    private func passwordMatcherPublisher() -> AnyPublisher<Bool, Never> {
        passwordSubject.combineLatest(repeatPasswordSubject).map { $0 == $1 }.eraseToAnyPublisher()
    }
    
    func isValidatedDataForm() -> AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(userNameValidation, emailValidation, passwordValidation , passwordMatcherPublisher())
            .map { $0 && $1 && $2 && $3 }
            .eraseToAnyPublisher()
    }
    
    func saveCorrectUser() {
        let user = UserModel(userName: userNameSubject.value,
                             password: passwordSubject.value,
                             email: emailSubject.value)
        authorizationService.addNewUser(user: user)
    }
    
    func loginScreen() {
        self.router.trigger(.login)
    }
}
