
import UIKit


extension String {
    
    struct EmailValidation {
        static let firstPart = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let emailFormat = firstPart + "@" + "gmail.com"
        static let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    }
    
    func isEmail() -> Bool {
        return EmailValidation.emailPredicate.evaluate(with: self)
    }
}
