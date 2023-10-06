import SwiftUI
import UIKit

extension UIView {
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 4.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
