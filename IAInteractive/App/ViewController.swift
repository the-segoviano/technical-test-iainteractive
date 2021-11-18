//
//  ViewController.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 17/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Here is where everything start!"
        label.textAlignment = .center
        self.view.addSubview(label)
        label.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    
}


class LoginViewController: BaseViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.ImageName.logo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var emailField: UITextField = {
        let field = CustomTextField.getTextField(withPlaceholder: Constants.Strings.email)
        field.delegate = self
        field.keyboardType = .emailAddress
        field.returnKeyType = .continue
        field.text = "user-example@mail.com"
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = CustomTextFieldPassword()
        field.delegate = self
        field.placeholder = "• • • • • • • •"
        field.returnKeyType = .next
        field.text = "123456"
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        let button = BaseButton.loginButton()
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Strings.loginTitle
        self.hideKeyboardWhenTappedAround()
        
        mainView.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let wdTextField: CGFloat = scrollView.frame.width - 24
        
        imageView.widthAnchor.constraint(equalToConstant: Constants.Value.widthLogo).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.Value.heightLogo).isActive = true
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.Value.padding).isActive = true
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        emailField.heightAnchor.constraint(equalToConstant: Constants.Value.htTextField).isActive = true
        emailField.widthAnchor.constraint(equalToConstant: wdTextField).isActive = true
        emailField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.Value.padding).isActive = true
        emailField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        passwordField.heightAnchor.constraint(equalToConstant: Constants.Value.htTextField).isActive = true
        passwordField.widthAnchor.constraint(equalToConstant: wdTextField).isActive = true
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: Constants.Value.padding).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: Constants.Value.htButton).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: wdTextField).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Constants.Value.padding).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
    }
    
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // MARK: Evento de Tap del boton de login
    //
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    @objc private func loginButtonTapped() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        do {
            try login()
            
            let homeTabBarController: HomeTabBarController = HomeTabBarController()
            homeTabBarController.modalPresentationStyle = .overCurrentContext
            self.present(homeTabBarController, animated: true, completion: nil)
            
        } catch LoginError.incompleteForm {
            Alert.showIncompleteFormAlert(on: self)
        } catch LoginError.invalidEmail {
            Alert.showInvalidEmailAlert(on: self)
        } catch {
            Alert.showIncompleteFormAlert(on: self)
        }
        
    }
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // MARK: Validaciones de los campos de Login
    //
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    func login() throws {
        let email = emailField.text!.trim()
        let password = passwordField.text!.trim()
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 6 {
            throw LoginError.incorrectPasswordLength
        }
    }
    
    
    
    
    
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// DELEGATE PARA LAS FUNCIONES DE SIGUIENTE EN CADA INPUNT DEL
// BOTON DE RETURN DEL KEYBOARD.
//
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            loginButtonTapped()
        }

        return true
    }

}


enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
}





extension UIViewController {
    /**
     * Funciones para ocultar el keyword cuando se toca en cualquier region de la pantalla
     *
     */
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
        
}



class HomeTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startViewController = ViewController()
        startViewController.title = "Cartelera"
        startViewController.tabBarItem.image = UIImage(named: "home")
        
        let profileViewController = ViewController()
        profileViewController.title = "Perfil"
        profileViewController.tabBarItem.image = UIImage(named: "avatar")
        
        viewControllers = [startViewController, profileViewController]
    }
    
}


