
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
    
    var text_publisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap {
            ($0.object as? UITextField)?.text
        }
        .eraseToAnyPublisher()
    }
}


extension UIControl {
    
    class InteractionSubscription<S: Subscriber>: Subscription
    where S.Input == UIControl {
        
        private let subscriber: S?
        private let control: UIControl
        private let event: UIControl.Event
        
        init(subscriber: S,
             control: UIControl,
             event: UIControl.Event) {
            
            self.subscriber = subscriber
            self.control = control
            self.event = event
            
            self.control.addTarget(self, action: #selector(handleEvent), for: event)
        }
        
        @objc func handleEvent(_ sender: UIControl) {
            _ = self.subscriber?.receive(sender)
        }
        
        func request(_ demand: Subscribers.Demand) {}
        func cancel() {}
    }
    
    struct InteractionPublisher: Publisher {
        
        typealias Output = UIControl
        typealias Failure = Never
        
        private let control: UIControl
        private let event: UIControl.Event
        
        init(control: UIControl, event: UIControl.Event) {
            self.control = control
            self.event = event
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, UIControl == S.Input {
            
            let subscription = InteractionSubscription(
                subscriber: subscriber,
                control: control,
                event: event
            )
            subscriber.receive(subscription: subscription)
        }
    }
    
    func publisher(for event: UIControl.Event) -> UIControl.InteractionPublisher {
        
        return InteractionPublisher(control: self, event: event)
    }
}

