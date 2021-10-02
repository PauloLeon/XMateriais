//
//  FirstPresentationViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 27/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class FirstPresentationViewController: UIViewController {

    // MARK: IBOutlet's

    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's

    let kSegueResearcher = ""
    let kSegueCollaborator = ""
    
    var type: Int?
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        RoundedHelper.roundContinueButton(button: continueButton)
        renameNavigationBackButton()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        guard let typeRegister = type else { return }
        if typeRegister == 0 {
            performSegue(withIdentifier: kSegueCollaborator, sender: nil)
        } else {
            performSegue(withIdentifier: kSegueResearcher, sender: nil)
        }
    }
}
