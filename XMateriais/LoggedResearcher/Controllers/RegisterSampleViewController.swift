//
//  RegisterSampleViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class RegisterSampleViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionMaterialTextView: UITextView!
    @IBOutlet weak var photoTextField: UITextField!
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
        nameTextField.delegate = self
        photoTextField.delegate = self
        continueButton.layer.cornerRadius = kTwo
        renameNavigationBackButton()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: IBActions's
    @IBAction func continueDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "sampleSucessSegue", sender: self)        
    }
}

extension RegisterSampleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//extension RegisterSampleViewController: UITextViewDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//}
