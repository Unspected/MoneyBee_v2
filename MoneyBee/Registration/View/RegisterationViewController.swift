
import UIKit
import Stevia
import RxSwift

class RegisterationViewController: UIViewController {
    
    private var viewModel: RegisterViewModel!
    
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
    
    private let confirmPasswordLabel: UILabel = {
       let label = UILabel()
        label.text = "Confirm Password"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .backgroundTextField
        textField.layer.cornerRadius = 10
        textField.textColor = .whiteColor
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let createAccountButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Create Account", for: .normal)
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
        usernameTextField.rx.text.debounce(.milliseconds(300), scheduler: MainScheduler.instance).subscribe { val in
            self.viewModel.usernamePublisher.onNext(val ?? "")
            self.usernameTextField.layer.borderWidth = 0
            self.usernameTextField.layer.borderColor = .none
        }.disposed(by: disposeBag)
        
        emailTextField.rx.text.debounce(.milliseconds(300), scheduler: MainScheduler.instance).subscribe { val in
            self.viewModel.emailPublisher.onNext(val ?? "")
            self.emailTextField.layer.borderWidth = 0
            self.emailTextField.layer.borderColor = .none
        }.disposed(by: disposeBag)
        
        passwordTextField.rx.text.debounce(.milliseconds(300), scheduler: MainScheduler.instance).subscribe { val in
            self.viewModel.passwordPublisher.onNext(val ?? "")
            self.passwordTextField.layer.borderWidth = 0
            self.passwordTextField.layer.borderColor = .none
        }.disposed(by: disposeBag)
        
        confirmPasswordTextField.rx.text.debounce(.milliseconds(300), scheduler: MainScheduler.instance).subscribe { val in
            self.viewModel.repeatPasswordPublisher.onNext( val ?? "")
            self.confirmPasswordTextField.layer.borderWidth = 0
            self.confirmPasswordTextField.layer.borderColor = .none
        }.disposed(by: disposeBag)
        
        viewModel.validPassword.subscribe { [weak self] isValid in
            if !isValid {
                self?.simpleAlert(title: "Invalid Password", message: "Make sure password data is correct", buttonTitle: "try again")
                self?.confirmPasswordTextField.layer.borderWidth = 1
                self?.confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                self?.passwordTextField.layer.borderWidth = 1
                self?.passwordTextField.layer.borderColor = UIColor.red.cgColor
            }
        }.disposed(by: disposeBag)
        
        viewModel.validUserData.subscribe { [weak self] isValid in
            if !isValid {
                self?.simpleAlert(title: "Invalid Username or Email", message: "Make sure your data in username or email is correct", buttonTitle: "try again")
                self?.emailTextField.layer.borderWidth = 1
                self?.emailTextField.layer.borderColor = UIColor.red.cgColor
                self?.usernameTextField.layer.borderWidth = 1
                self?.usernameTextField.layer.borderColor = UIColor.red.cgColor
                
            }
        }.disposed(by: disposeBag)
        
        
        Observable.combineLatest(viewModel.validUserData, viewModel.validPassword).subscribe { [weak self] isValidLogin, isValidPass in
            if isValidLogin && isValidPass {
                self?.simpleAlert(title: "Success", message: "User successfully created", buttonTitle: "ok")
            }
        }.disposed(by: disposeBag)
        
//        viewModel.isValidFullUserData.subscribe{ [weak self] isValidData in
//            if isValidData {
//                self?.simpleAlert(title: "Success", message: "User successfully created", buttonTitle: "ok")
//            }
//        }.disposed(by: disposeBag)
        
        createAccountButton.rx.tap.subscribe { tap in
            self.viewModel.createNewUser()
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
            confirmPasswordLabel
            confirmPasswordTextField
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
            |-60-confirmPasswordLabel| ~ 10,
            5,
            |-60-confirmPasswordTextField-60-| ~ 45,
            100,
            |-40-createAccountButton-40-| ~ 45,
            15%
            
        )
    }
    
    

}
