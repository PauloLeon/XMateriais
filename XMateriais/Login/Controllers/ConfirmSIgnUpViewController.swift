//
//  ConfirmSIgnUpViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class ConfirmSIgnUpViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var errorCodeLabel: UILabel!
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTextFieldDelegate()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        errorCodeLabel.isHidden = true
    }
    
    private func setTextFieldDelegate() {
        codeTextField.delegate = self
    }

    // MARK: IBActions's

    @IBAction func retryButtonDidPressed(_ sender: UIButton) {
        createAlert(title: "Fluxo não habilitado", message: "tente mais tarde")
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        
    }
}

extension ConfirmSIgnUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
