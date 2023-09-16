import Stevia
import UIKit

class AccountViewController: UIViewController {
    
    private var viewModel: AccountViewModel!
    
    init(viewModel: AccountViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        setupViews()
        setupConstrains()
    }

    // MARK: - Views
    private func setupViews() {
        view.backgroundColor = .darkGray
  
    }

    // MARK: - Constrains
    private func setupConstrains() {
    }
    


}
