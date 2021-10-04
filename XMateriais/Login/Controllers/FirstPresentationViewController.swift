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

    let kSegueResearcher = "segueGoToLoggedResearcher"
    let kSegueCollaborator = "segueContinueOnboarding"
    
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
        removeNavigationBackButton()
    }
    
    private func removeNavigationBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: IBAction's

    @IBAction func continueButtonDidPressed(_ sender: Any) {
        guard let typeRegister = type else { return }
        if typeRegister == 0 {
            performSegue(withIdentifier: kSegueCollaborator, sender: nil)
        } else {
            performSegue(withIdentifier: kSegueResearcher, sender: nil)
        }
    }
}
