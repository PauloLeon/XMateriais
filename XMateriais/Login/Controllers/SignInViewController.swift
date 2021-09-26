//
//  SignInViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    let kBorderWidth: CGFloat = 1.0

    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegate()
        setupUI()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        errorEmailLabel.isHidden = true
        errorPasswordLabel.isHidden = true
        
        continueButton.isEnabled = false
        continueButton.layer.cornerRadius = kTwo
        continueButton.layer.borderWidth = kBorderWidth
        continueButton.backgroundColor = UIColor.getDisableColor()
        continueButton.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        continueButton.setTitleColor(UIColor.getDisableTextColor(), for: .disabled)
    }
    
    private func setTextFieldDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: IBActions's

    @IBAction func resetPasswordDidPressed(_ sender: UIButton) {
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
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
}
