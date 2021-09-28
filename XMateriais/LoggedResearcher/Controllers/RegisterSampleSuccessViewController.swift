//
//  RegisterSampleSuccessViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class RegisterSampleSuccessViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var continueButton: UIButton!
    
    let kTwo: CGFloat = 2.0

    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: Private Functions
    
    private func setupView() {
        continueButton.layer.cornerRadius = kTwo
        renameNavigationBackButton()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: IBActions's
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
