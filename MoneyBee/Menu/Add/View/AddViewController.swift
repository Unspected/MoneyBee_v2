import UIKit
import Combine

class AddViewController: UIViewController {
    
    private var cancellable = Set<AnyCancellable>()
    
    private var viewModel: AddViewModel!
    
    private let newTransactionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New Transaction", for: .normal)
        button.tintColor = .whiteColor
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor.cgColor
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tabBarColor
        return button
    }()
    
    private let newCategoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tabBarColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.whiteColor.cgColor
        button.setTitle("New Category", for: .normal)
        button.tintColor = .whiteColor
        button.titleLabel?.font = UIFont(name: "", size: 20)
        return button
    }()
    
    private let newGoalButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.whiteColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tabBarColor
        button.setTitle("New Goal", for: .normal)
        button.tintColor = .whiteColor
        button.titleLabel?.font = UIFont(name: "", size: 20)
        return button
    }()
    
    private var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        setupHeaderView()
        bind()
    }

    init(viewModel: AddViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        newTransactionButton.publisher(forEvent: .touchUpInside).sink { _ in
            print("TRANSACTION")
        }.store(in: &cancellable)
        
        newCategoryButton.publisher(forEvent: .touchUpInside).sink { _ in
            print("CATEGORY")
        }.store(in: &cancellable)
        
        newGoalButton.publisher(forEvent: .touchUpInside).sink { _ in
            print("NEW GOAL")
        }.store(in: &cancellable)
    }
    
    // MARK: - Views
    private func setupViews() {
        view.backgroundColor = .darkGray
        self.stackView = UIStackView(arrangedSubviews: [newTransactionButton, newCategoryButton, newGoalButton],axis: .vertical, spacing: 50 ,distribution: .fillEqually)
        view.addSubview(self.stackView)
        
    }
    
    // MARK: - Constrains
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            
        
        ])
    }
    

}
