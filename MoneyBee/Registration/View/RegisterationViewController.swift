
import UIKit
import Stevia

class RegisterationViewController: UIViewController {
    
    private let imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .darkGray
        
        view.subviews {
            imageViewLogo
        }
        
    }
    
    private func setupConstrains() {
        
        view.layout {
            5%
            |-40-imageViewLogo-40-| ~ 200
        }
    }

}
