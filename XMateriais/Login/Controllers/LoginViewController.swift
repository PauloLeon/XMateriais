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
    
    let kThree: CGFloat = 3.0
    let kBorderWidth: CGFloat = 1.0
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    // MARK: Private Functions

    private func setupView() {
        RoundedHelper.roundContinueButton(button: signInButton)
        RoundedHelper.roundDisableContinueButton(button: signUpButton)
        self.navigationController?.navigationBar.tintColor = UIColor.getPrimaryColor()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: IBActions's

    @IBAction func signInButtonPressed(_ sender: UIButton) {}
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {}
}
