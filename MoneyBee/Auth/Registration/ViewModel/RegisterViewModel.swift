
import Foundation
import Combine

enum RegisterationError: LocalizedError {
    case invalidUserName
    case invalidEmail
    case invalidPassword
    case missmatchPasswords
    
    var errorDescription: String {
        switch self {
        case .invalidEmail:
            return "Invalid Email, type valid email"
        case .invalidPassword:
            return "Invalid password, type in valid password"
        case .missmatchPasswords:
            return "Passwords are missmatch, make sure your password are match"
        case .invalidUserName:
            return "Username is too short, username must be contain 3 or more characters"
        }
    }
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
