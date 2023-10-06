import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine

protocol AuthServiceProtocol {
    
    var users: [UserModel] { get }
    func validLogin(login: String) -> Bool
}

final class AuthService {
    
    static let shared = AuthService()
    
    private var cancellables = Set<AnyCancellable>()
    
    let db = Firestore.firestore()
    
    private init() {}
    
    /// A method to register user
    /// - Parameter registerModel: the user information (username, email, password)
    /// - Returns: two values
    /// Bool: register user was successfully
    /// Error?: error from Firebase
    func registerUser(with registerModel: RegisterUserModel) -> Future<Bool,Error> {
        Future { promise in
            let username = registerModel.username
            let email = registerModel.email
            let password = registerModel.password
            
            Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
                
                guard let resultUser = result?.user else {
                    promise(.success(false))
                    return
                }
                
                self.db.collection("users")
                    .document(resultUser.uid)
                    .setData([
                        "username": username,
                        "email": email,
                        "password": password
                    ]) { error in
                        if let error = error {
                            promise(.failure(error))
                        }
                        
                        promise(.success(true))
                    }
            })
        }
    }
}
// MARK: - AuthServiceProtocol
extension AuthService: AuthServiceProtocol {
    
    var users: [UserModel] {
        return [UserModel(userName: "pasha", password: "123", email: ""),
                UserModel(userName: "masha", password: "321", email: ""),
                UserModel(userName: "vasya", password: "542", email: ""),
                UserModel(userName: "petya", password: "643", email: ""),
                UserModel(userName: "admin", password: "1", email: "admin")]
    }
    
    func validLogin(login: String) -> Bool {
        login.count < 3 ? false : true
    }
    
    
    
}
