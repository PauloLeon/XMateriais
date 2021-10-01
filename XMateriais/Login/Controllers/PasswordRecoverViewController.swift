//
//  PasswordRecoverViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Lottie
import Firebase


class PasswordRecoverViewController: UIViewController {

    // MARK: IBOutlet's

    @IBOutlet weak var lottieAnimation: AnimationView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
        
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        setupLottie()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        emailTextField.delegate = self
        errorEmailLabel.isHidden = true
        RoundedHelper.roundContinueButton(button: continueButton)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupLottie() {
        lottieAnimation.contentMode = .scaleAspectFit
        lottieAnimation.loopMode = .loop
        lottieAnimation.animationSpeed = 0.5
        lottieAnimation.play()
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
    
    private func resetPassword() {
        Auth.auth().languageCode = "pt_br"
        Auth.auth().sendPasswordReset(withEmail: getEmailAddress()) { (error) in
            if let error = error as NSError? {
            switch AuthErrorCode(rawValue: error.code) {
            case .userNotFound: break
              // Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
            case .invalidEmail: break
              // Error: The email address is badly formatted.
            case .invalidRecipientEmail: break
              // Error: Indicates an invalid recipient email was sent in the request.
            case .invalidSender: break
              // Error: Indicates an invalid sender email is set in the console for this action.
            case .invalidMessagePayload: break
              // Error: Indicates an invalid email template for sending update email.
            default:
              print("Error message: \(error.localizedDescription)")
            }
          } else {
            self.createAlert(title: "E-mail enviado", message: "verifique sua caixa de mensagens do e-mail")
            print("Reset password email has been successfully sent")
          }
        }
    }
    
    // MARK: IBActions's

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if emailTextField.text == "" || emailTextField.text == nil || !isValidEmail(testStr: emailTextField.text!) {
            createAlert(title: "Por favor, insira um e-mail válido", message: "tente novamente")
        } else {
            resetPassword()
        }
    }
}

extension PasswordRecoverViewController: UITextFieldDelegate {
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
