

import Foundation
import UIKit
import Combine

protocol LoginViewModel {
    
    var loginValue: CurrentValueSubject<String, Never> { get }
    var passwordValue: CurrentValueSubject<String, Never> { get }
    var isValid: PassthroughSubject<Bool, Never> { get set }
    
    func authorization()
    
    
}

