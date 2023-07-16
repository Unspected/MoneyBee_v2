
import Foundation


struct UserModel {
    var userName: String
    var password: String
    var email: String
}

extension UserModel {
    
    var isValid: Bool {
        !userName.isEmpty && !password.isEmpty
    }
}

