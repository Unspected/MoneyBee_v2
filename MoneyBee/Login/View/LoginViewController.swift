
import UIKit
import Stevia
import Combine


class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModel!
    
    private var cancellable = Set<AnyCancellable>()

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "frontBackground")
        image.contentMode = .scaleAspectFit
       return image
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .backgroundTextField
        textField.layer.cornerRadius = 10
        textField.textColor = .whiteColor
        textField.autocapitalizationType = .none
        textField.tintColor = .whiteColor
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordLabel: UILabel = {
       let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .backgroundTextField
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        textField.textColor = .whiteColor
        textField.autocapitalizationType = .none
        textField.tintColor = .whiteColor
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.whiteColor, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.whiteColor, for: .normal)
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureTapHiddingKeyBoard()
        setupViews()
        setupConstrains()
        bind()
        
    }
    
    func bind() {
        
        loginTextField.publisher(for: \.text).sink { [weak self] text in
            self?.viewModel.loginValue.value = text ?? ""
        }.store(in: &cancellable)
        
        passwordTextField.textPublisher.sink { [weak self] val in
            self?.viewModel.passwordValue.value = val
        }.store(in: &cancellable)
        
        viewModel.isValid.sink { [weak self] value in
            guard let self else { return }
            print("trigger")
            if value {
              //  let viewModel = BudgetViewModelImpl()
              //  self.present(BudgetViewController(viewModel: viewModel), animated: true)
                
            } else {
                simpleAlert(title: "Invalid Error", message: "Wrong login or password", buttonTitle: "try again")
               
            }
        }.store(in: &cancellable)

        signInButton.publisher(forEvent: .touchUpInside).sink { _ in
            self.viewModel.authorization()
        }.store(in: &cancellable)
        
        
        createAccountButton.publisher(forEvent: .touchUpInside).sink { [weak self] _ in
            guard let self else { return }
            viewModel.signUpButtonPressed()
            
        }.store(in: &cancellable)
        
        
    }
    
    private func setupViews() {
        view.backgroundColor = .darkGray
        
        view.subviews {
            imageViewLogo
            usernameLabel
            loginTextField
            passwordLabel
            passwordTextField
            signInButton
            createAccountButton
        }
        
    }
    
    private func setupConstrains() {
    
        view.layout {
            5%
            |-40-imageViewLogo-40-| ~ 200
            15%
            |-60-usernameLabel| ~ 10
            5
            |-60-loginTextField-60-| ~ 45
            15
            |-60-passwordLabel| ~ 10
            5
            |-60-passwordTextField-60-| ~ 45
            50
            |-80-signInButton-80-| ~ 45
            15%
            |-40-createAccountButton-40-| ~ 45
            10%
        }
        
        
    }

}

