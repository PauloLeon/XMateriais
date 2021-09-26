//
//  PasswordRecoverViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class PasswordRecoverViewController: UIViewController {

    // MARK: IBOutlet's

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        emailTextField.delegate = self
        errorEmailLabel.isHidden = true
    }
    
    // MARK: IBActions's

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if emailTextField.text == "" || emailTextField.text == nil {
            createAlert(title: "Por favor, insira um e-mail", message: "tente novamente")
        } else {
            createAlert(title: "Fluxo não habilitado", message: "tente mais tarde")
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
}
