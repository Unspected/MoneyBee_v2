//
//  Extensions + String .swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/20/23.
//

import Foundation
import UIKit

extension String {
    
    func isValidUserName() -> Bool {
        return self.count < 5 ? false : true
    }
    
    func isValidLoginEmail() -> Bool {
        let shortnameRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", shortnameRegex).evaluate(with: self)
    }
    
    func isValidPhoneNubmer() -> Bool {
        let shortnameRegex = #"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$"#
        return NSPredicate(format: "SELF MATCHES %@", shortnameRegex).evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
