
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
        validationFields()
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
            .map { $0.isValidUserName() }
            .eraseToAnyPublisher()
    }
    
    private var emailValidation: AnyPublisher<Bool, Never> {
        emailSubject
            .map { $0.isValidEmail() }
            .eraseToAnyPublisher()
    }
    
    private var passwordValidation: AnyPublisher<Bool, Never> {
        passwordSubject
            .map { $0.isValidPassword() }
            .eraseToAnyPublisher()
    }
    
    private var repeatpasswordValidation: AnyPublisher<Bool, Never> {
        repeatPasswordSubject
            .map { $0.isValidPassword() }
            .eraseToAnyPublisher()
    }
    
    var validationError: AnyPublisher<RegisterationError?, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    private var passwordMatcherPublisher: AnyPublisher<Bool, Never> {
        passwordSubject.combineLatest(repeatPasswordSubject).map { $0 == $1 }.eraseToAnyPublisher()
    }
    
    var isValidatedDataForm: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(userNameValidation, emailValidation, passwordValidation , passwordMatcherPublisher)
            .map { $0 && $1 && $2 && $3 == true }
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
    
    private func validationFields() {
        userNameValidation.sink(receiveValue: { [weak self] valid in
            if !valid {
                self?.errorSubject.send(.invalidUserName)
            }
        }).store(in: &cancellable)
        
        emailValidation.sink(receiveValue: { [ weak self ] valid in
            if !valid {
                self?.errorSubject.send(.invalidEmail)
            }
        }).store(in: &cancellable)
        
        passwordValidation.sink(receiveValue: { [weak self] valid in
            if !valid {
                self?.errorSubject.send(.invalidPassword)
            }
        }).store(in: &cancellable)
        
        passwordMatcherPublisher.sink(receiveValue: { [weak self] valid in
            if !valid {
                self?.errorSubject.send(.missmatchPasswords)
            }
        }).store(in: &cancellable)
        
        
    }
}
