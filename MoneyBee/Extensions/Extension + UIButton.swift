
import UIKit

class GradientButton: UIButton {
    
    // Define the colors for the gradient
    var startColor: UIColor = UIColor.startColor {
        didSet {
            updateGradient()
        }
    }
    var endColor: UIColor = UIColor.endColor {
        didSet {
            updateGradient()
        }
    }
    // Create gradient layer
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        // Set the gradient frame
        gradientLayer.frame = rect
        // Set the colors
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        // Gradient is linear from left to right
        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0.1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        // Add gradient layer into the button
        layer.insertSublayer(gradientLayer, at: 0)
        // Round the button corners
        layer.cornerRadius = 15
        clipsToBounds = true
        
    }

    func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}
