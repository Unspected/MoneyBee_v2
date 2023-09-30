import Stevia
import UIKit

class GoalsViewController: UIViewController {
    
    private var viewModel: GoalsViewModel!
    
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
        setupHeaderView()

    }
    
    init(viewModel: GoalsViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    private func setupViews() {
        view.backgroundColor = .darkGray
        
        view.subviews {

            
        }
    }
    
    // MARK: - Constrains
    private func setupConstrains() {
        
    }
    

}
