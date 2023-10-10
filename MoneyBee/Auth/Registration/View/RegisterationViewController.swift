
import UIKit
import Stevia
import RxSwift
import RxCocoa
import Combine

class RegisterationViewController: UIViewController {
    
    private var viewModel: RegisterViewModel!
    
    private var cancallables = Set<AnyCancellable>()
    
    private var disposeBag = DisposeBag()
    
    init(viewModel: RegisterViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let headerView: UIView = {
       let view = UIView()
       view.backgroundColor = .gray
       return view
    }()
    
    private let imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "header_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = .systemFont(ofSize: 21)
        label.textColor = .whiteColor
        return label
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .backgroundTextField
        textField.layer.cornerRadius = 10
        textField.textColor = .whiteColor
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let emailLabel: UILabel = {
       let label = UILabel()
        label.text = "Email Address"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .backgroundTextField
        textField.layer.cornerRadius = 10
        textField.textColor = .whiteColor
        textField.autocapitalizationType = .none
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
        textField.textColor = .whiteColor
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let repeatPasswordLabel: UILabel = {
       let label = UILabel()
        label.text = "Confirm Password"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .backgroundTextField
        textField.layer.cornerRadius = 10
        textField.textColor = .whiteColor
        textField.autocapitalizationType = .none
        return textField
    }()
    
    // TODO настроить состояние кнопки enable когда поля пустые и заполнение
    private let createAccountButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Create New Account", for: .normal)
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
    
    private func bind() {
        usernameTextField.textPublisher.sink { [weak self] text in
            self?.viewModel.userNameSubject.send(text)
        }.store(in: &cancallables)
        
        emailTextField.textPublisher.sink { [weak self] text in
            self?.viewModel.emailSubject.send(text)
        }.store(in: &cancallables)
        
        passwordTextField.textPublisher.sink { [weak self] text in
            self?.viewModel.passwordSubject.send(text)
        }.store(in: &cancallables)
        
        repeatPasswordTextField.textPublisher.sink { [weak self] text in
            self?.viewModel.repeatPasswordSubject.send(text)
        }.store(in: &cancallables)
        
        
        createAccountButton.rx.tap.bind {  _ in
            print("register")
            self.viewModel.isValidatedDataForm.sink(receiveValue: { result in
                if !result {
                    self.simpleAlert(title: "Error", message: "erro", buttonTitle: "ok")
                } else {
                    self.viewModel.saveCorrectUser()
                    self.viewModel.loginScreen()
                    self.usernameTextField.text = ""
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    self.repeatPasswordTextField.text = ""
                }
            }).store(in: &self.cancallables)
            
        }.disposed(by: disposeBag)
        
    }
    
    private func setupViews() {
        view.backgroundColor = .darkGray
        
        headerView.subviews {
            imageViewLogo
        }
        
        view.subviews {
            headerView
            titleLabel
            usernameLabel
            usernameTextField
            emailLabel
            emailTextField
            passwordLabel
            passwordTextField
            repeatPasswordLabel
            repeatPasswordTextField
            createAccountButton
            
        }
        
    }
    
    private func setupConstrains() {
        
        headerView.layout(
            |imageViewLogo.centerHorizontally()| ~ 70,
             0
        )
        
        view.layout(
            0,
            |-0-headerView-0-| ~ 15%,
            30,
            titleLabel.centerHorizontally(),
            40,
            |-60-usernameLabel| ~ 10,
            5,
            |-60-usernameTextField-60-| ~ 45,
            20,
            |-60-emailLabel| ~ 10,
            5,
            |-60-emailTextField-60-| ~ 45,
            20,
            |-60-passwordLabel| ~ 10,
            5,
            |-60-passwordTextField-60-| ~ 45,
            20,
            |-60-repeatPasswordLabel| ~ 10,
            5,
            |-60-repeatPasswordTextField-60-| ~ 45,
            100,
            |-40-createAccountButton-40-| ~ 45,
            15%
            
        )
    }
    
    

}
