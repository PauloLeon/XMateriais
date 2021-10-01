//
//  SignInViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kSegue: String = ""
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegate()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        errorEmailLabel.isHidden = true
        errorPasswordLabel.isHidden = true
        RoundedHelper.roundContinueButton(button: continueButton)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setTextFieldDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    private func getEmailAddress() -> String {
        guard let email = emailTextField.text else {
            return ""
        }
        return email
    }
    
    private func getPassword() -> String {
        guard let password = passwordTextField.text else {
            return ""
        }
        return password
    }
    
    private func isFormValid() -> Bool {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            createAlert(title: "Cadastro Incompleto", message: "Preencha todos os campos corretamente")
            return false
        }
        
        if !isValidEmail(testStr: emailTextField.text!) {
            createAlert(title: "Por favor, insira um e-mail válido", message: "tente novamente")
            errorEmailLabel.isHidden = false
            return false
        }
        return true
    }
    
    private func signIn() {
        Auth.auth().signIn(withEmail: getEmailAddress(), password: getPassword()) { (authResult, error) in
          if let error = error as? NSError {
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed:
                self.createAlert(title: "Serviço fora do ar", message: "tente novamente mais tarde")
                print(error.localizedDescription)
              // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
            case .userDisabled:
                self.createAlert(title: "Serviço fora do ar", message: "tente novamente mais tarde")
                print(error.localizedDescription)
              // Error: The user account has been disabled by an administrator.
            case .wrongPassword:
                self.createAlert(title: "Serviço fora do ar", message: "tente novamente mais tarde")
                print(error.localizedDescription)
              // Error: The password is invalid or the user does not have a password.
            case .invalidEmail:
                self.createAlert(title: "Serviço fora do ar", message: "tente novamente mais tarde")
                print(error.localizedDescription)
              // Error: Indicates the email address is malformed.
            default:
                self.createAlert(title: "Serviço fora do ar", message: "tente novamente mais tarde")
                print("Error: \(error.localizedDescription)")
            }
          } else {
            self.performSegue(withIdentifier: self.kSegue, sender: self)
            print("User signs in successfully")
          }
        }
    }
    
    // MARK: IBActions's

    @IBAction func resetPasswordDidPressed(_ sender: UIButton) {
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        if isFormValid() {
            signIn()
        } else {
            createAlert(title: "Serviço fora do ar", message: "tente novamente mais tarde")
        }
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
