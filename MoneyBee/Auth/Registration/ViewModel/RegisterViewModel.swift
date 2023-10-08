
import Foundation
import Combine

enum RegisterationError: LocalizedError {
    case invalidUserName
    case invalidEmail
    case invalidPassword
    case missmatchPasswords
}

protocol RegisterViewModel {
    
    // input 
    var username: AnyPublisher<Bool, Never> { get }
    var email: AnyPublisher<Bool, Never> { get }
    var password: AnyPublisher<Bool, Never> { get }
    var repeatpassword: AnyPublisher<Bool, Never> { get }
    func userNamePublisher(with text: String)
    func emailPublisher(with email: String)
    func passwordPublisher(with password: String)
    func repeatPasswordPublisher(with password: String)
    
    // output
    var validationError: AnyPublisher<RegisterationError?, Never> { get }
    func isValidatedDataForm() -> AnyPublisher<Bool, Never>
    func saveCorrectUser()
    
}
