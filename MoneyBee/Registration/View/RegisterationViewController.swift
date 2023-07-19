
import UIKit
import Stevia

class RegisterationViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstrains()
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
            |-60-confirmPasswordTextField-60-| ~ 45
            
            
            
            
        )
        
        
    }

}
