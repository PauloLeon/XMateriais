//
//  LoginViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 21/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    let kBorderWidth: CGFloat = 1.0
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: Private Functions

    private func setupView() {
        signInButton.layer.cornerRadius = kTwo
        signUpButton.layer.cornerRadius = kTwo
        signUpButton.layer.borderWidth = kBorderWidth
        signUpButton.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        self.navigationController?.navigationBar.tintColor = UIColor.getPrimaryColor()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: IBActions's

    @IBAction func signInButtonPressed(_ sender: UIButton) {}
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {}
}
