

import Foundation
import UIKit
import Combine


protocol LoginViewModel {
    // MARK: - input
    func signIn(login: String, password: String)
    
    // MARK: - output
    var error: AnyPublisher<LoginViewError?, Never> { get }
    
}



