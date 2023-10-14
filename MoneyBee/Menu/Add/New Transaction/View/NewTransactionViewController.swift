import UIKit

final class NewTransactionViewController: UIViewController {
    
    private var viewModel: NewTransactionViewModel!
    
    init(viewModel: NewTransactionViewModel!) {
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
    }
    
    
}

extension NewTransactionViewController {
    
    private func setupViews() {
        view.backgroundColor = .darkGray
    }
}
