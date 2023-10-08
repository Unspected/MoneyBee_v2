import UIKit

protocol AuthorizationServiceProtocol {
    
    func validLogin(login: String) -> Bool
}

final class AuthorizationService {
    
    static let shared = AuthorizationService()
    
    var users: [UserModel] = [UserModel(userName: "pasha", password: "123", email: ""),
                UserModel(userName: "masha", password: "321", email: ""),
                UserModel(userName: "vasya", password: "542", email: ""),
                UserModel(userName: "petya", password: "643", email: ""),
                UserModel(userName: "admin", password: "1", email: "admin")]
    
    func addNewUser(user: UserModel) {
        self.users.append(user)
    }
    
}

// MARK: - AuthServiceProtocol
extension AuthorizationService: AuthorizationServiceProtocol {
    
    
    func validLogin(login: String) -> Bool {
        login.count < 3 ? false : true
    }
    
}
