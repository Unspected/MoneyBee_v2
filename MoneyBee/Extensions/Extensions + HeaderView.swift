import UIKit
import Stevia

extension UIViewController {
    func setupHeaderView() {
        let headerView: UIView = {
            let view = UIView()
            view.backgroundColor = .tabBarColor
            return view
        }()
        
        let imageViewLogo: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "header_logo")
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        // Add to view
        headerView.subviews {
            imageViewLogo
        }
        
        view.subviews {
            headerView
        }
        
        // Constrains
        headerView.layout {
            imageViewLogo.bottom(0).centerHorizontally().height(70)
        }
        view.layout([
            headerView.height(15%).left(0).right(0).top(0),
            
        ])
        
    }
}
