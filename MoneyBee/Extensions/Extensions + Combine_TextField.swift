
import Combine
import UIKit

extension UITextField {
    
    var textPublisher: AnyPublisher<String,Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField}
            .map { $0.text ?? ""}
            .eraseToAnyPublisher()
            
    }
}
