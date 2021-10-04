//
//  SampleResultViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class SampleResultViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var errorCodeLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variables

    let kTwo: CGFloat = 2.0

    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: Private Functions
    
    private func setupView() {
        codeTextField.delegate = self
        errorCodeLabel.isHidden = true
        continueButton.layer.cornerRadius = kTwo
        renameNavigationBackButton()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: IBActions's
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "resultSucessSegue", sender: self)
    }
}

extension SampleResultViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
