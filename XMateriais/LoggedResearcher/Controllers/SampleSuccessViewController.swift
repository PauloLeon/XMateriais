//
//  SampleSuccessViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Lottie

class SampleSuccessViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var lottieAnimation: AnimationView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: Private Functions
    
    private func setupView() {
        RoundedHelper.roundContinueButton(button: continueButton)
        setupLottie()
        removeNavigationBackButton()
    }
    
    private func removeNavigationBackButton() {
         self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func setupLottie() {
        lottieAnimation.contentMode = .scaleAspectFit
        lottieAnimation.loopMode = .loop
        lottieAnimation.animationSpeed = 0.5
        lottieAnimation.play()
    }
    
    // MARK: IBActions's
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
