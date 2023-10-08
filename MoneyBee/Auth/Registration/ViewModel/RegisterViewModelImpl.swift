
import Foundation
import UIKit
import XCoordinator
import Combine


class RegisterViewModelImpl  {
    
    private var cancellable = Set<AnyCancellable>()
    
    private let userNameSubject = CurrentValueSubject<String, Never>("")
    private let emailSubject = CurrentValueSubject<String, Never>("")
    private let passwordSubject = CurrentValueSubject<String, Never>("")
    private let repeatPasswordSubject = CurrentValueSubject<String, Never>("")
    
    private let errorSubject = PassthroughSubject<RegisterationError?, Never>()
    
    private let authorizationService = AuthorizationService.shared
    
    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
    
}

extension RegisterViewModelImpl: RegisterViewModel {
    
    var username: AnyPublisher<Bool, Never> {
        userNameSubject
            .filter { !$0.isEmpty}
            .map { $0.isValidUserName() }
            .eraseToAnyPublisher()
    }
    
    var email: AnyPublisher<Bool, Never> {
        emailSubject
            .filter { !$0.isEmpty }
            .map { $0.isValidEmail() }
            .eraseToAnyPublisher()
    }
    
    var password: AnyPublisher<Bool, Never> {
        passwordSubject
            .filter { !$0.isEmpty }
            .map { $0.isValidPassword() }
            .eraseToAnyPublisher()
    }
    
    var repeatpassword: AnyPublisher<Bool, Never> {
        repeatPasswordSubject
            .filter { !$0.isEmpty }
            .map { $0.isValidPassword() }
            .eraseToAnyPublisher()
    }
    
    var validationError: AnyPublisher<RegisterationError?, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    func userNamePublisher(with text: String) {
        self.userNameSubject.send(text)
    }
    
    func emailPublisher(with email: String) {
        self.emailSubject.send(email)
    }
    
    func passwordPublisher(with password: String) {
        self.passwordSubject.send(password)
    }
    
    func repeatPasswordPublisher(with password: String) {
        self.repeatPasswordSubject.send(password)
    }
    
    private func passwordMatcherPublisher() -> AnyPublisher<Bool, Never> {
        passwordSubject.combineLatest(repeatPasswordSubject).map { $0 == $1 }.eraseToAnyPublisher()
    }
    
    func isValidatedDataForm() -> AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(username, email, password ,passwordMatcherPublisher())
            .map { $0 && $1 && $2 && $3 }
            .eraseToAnyPublisher()
    }
    
    func saveCorrectUser() {
        let user = UserModel(userName: userNameSubject.value,
                             password: passwordSubject.value,
                             email: emailSubject.value)
        authorizationService.addNewUser(user: user)
    }
    
}
