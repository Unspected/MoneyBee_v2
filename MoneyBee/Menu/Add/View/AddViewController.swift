import Stevia
import UIKit

class AddViewController: UIViewController {
    
    private var viewModel: AddViewModel!
    
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
        setupHeaderView()
    }

    init(viewModel: AddViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    private func setupViews() {
        view.backgroundColor = .darkGray

    }
    
    // MARK: - Constrains
    private func setupConstrains() {

    }
    

}
