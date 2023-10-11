
import Foundation
import Combine

enum RegisterationError: LocalizedError {
    case invalidUserName
    case invalidEmail
    case invalidPassword
    case missmatchPasswords
}

enum FormState {
    case valid
    case invalid
    case empty
}

protocol RegisterViewModel {
    
    // input
    var userNameSubject: CurrentValueSubject<String, Never> { get }
    var emailSubject: CurrentValueSubject<String, Never> { get }
    var passwordSubject: CurrentValueSubject<String, Never> { get }
    var repeatPasswordSubject: CurrentValueSubject<String, Never> { get }
    
    // output
    var validationError: AnyPublisher<RegisterationError?, Never> { get }
    var isValidatedDataForm: AnyPublisher<Bool, Never> { get }
    func saveCorrectUser()
    func loginScreen() 
    
}
