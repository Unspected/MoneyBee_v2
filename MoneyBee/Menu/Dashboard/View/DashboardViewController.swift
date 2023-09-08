import Stevia
import UIKit

class DashboardViewController: UIViewController {
    
    private var viewModel: DashboardViewModel!
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .tabBarColor
        return view
    }()
    
    private let imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "header_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        
    }
    
    init(viewModel: DashboardViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    private func setupViews() {
        view.backgroundColor = .darkGray
        headerView.subviews {
            imageViewLogo
        }
        
        view.subviews {
            headerView
            
        }
    }
    
    // MARK: - Constrains
    private func setupConstrains() {
        headerView.layout {
            imageViewLogo.bottom(0).centerHorizontally().height(70)
        }
        
        view.layout([
            headerView.height(15%).left(0).right(0).top(0),
        ])
    }
    
    
}
