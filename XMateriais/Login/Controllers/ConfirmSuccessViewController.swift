//
//  ConfirmSuccessViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Lottie

class ConfirmSuccessViewController: UIViewController {
   
    // MARK: IBOutlet's

    @IBOutlet weak var animationLottie: AnimationView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        setupLottie()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        continueButton.layer.cornerRadius = kTwo
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupLottie() {
        animationLottie.contentMode = .scaleAspectFit
        animationLottie.loopMode = .loop
        animationLottie.animationSpeed = 0.5
        animationLottie.play()
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }

}
