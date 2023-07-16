
import Foundation
import UIKit

extension UIViewController {
    
    func simpleAlert(title: String, message: String?, buttonTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(actionAlert)
       
        present(alert, animated: true, completion: nil)
    }
}
