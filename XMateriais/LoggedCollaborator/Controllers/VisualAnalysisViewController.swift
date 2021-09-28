//
//  VisualAnalysisViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class VisualAnalysisViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var sensationOneView: UIView!
    @IBOutlet weak var sensationOneZeroButton: UIButton!
    @IBOutlet weak var sensationOneOneButton: UIButton!
    @IBOutlet weak var sensationOneTwoButton: UIButton!
    @IBOutlet weak var sensationOneThreeButton: UIButton!
    @IBOutlet weak var sensationOneMinusOneButton: UIButton!
    @IBOutlet weak var sensationOneMinusTwoButton: UIButton!
    @IBOutlet weak var sensationOneMinusThreeButton: UIButton!
    
    @IBOutlet weak var sensationTwoView: UIView!
    @IBOutlet weak var sensationTwoZeroButton: UIButton!
    @IBOutlet weak var sensationTwoOneButton: UIButton!
    @IBOutlet weak var sensationTwoTwoButton: UIButton!
    @IBOutlet weak var sensationTwoThreeButton: UIButton!
    @IBOutlet weak var sensationTwoMinusOneButton: UIButton!
    @IBOutlet weak var sensationTwoMinusTwoButton: UIButton!
    @IBOutlet weak var sensationTwoMinusThreeButton: UIButton!
    
    @IBOutlet weak var sensationThreeView: UIView!
    @IBOutlet weak var sensationThreeZeroButton: UIButton!
    @IBOutlet weak var sensationThreeOneButton: UIButton!
    @IBOutlet weak var sensationThreeTwoButton: UIButton!
    @IBOutlet weak var sensationThreeThreeButton: UIButton!
    @IBOutlet weak var sensationThreeMinusOneButton: UIButton!
    @IBOutlet weak var sensationThreeMinusTwoButton: UIButton!
    @IBOutlet weak var sensationThreeMinusThreeButton: UIButton!
    
    @IBOutlet weak var sensationFourView: UIView!
    @IBOutlet weak var sensationFourZeroButton: UIButton!
    @IBOutlet weak var sensationFourOneButton: UIButton!
    @IBOutlet weak var sensationFourTwoButton: UIButton!
    @IBOutlet weak var sensationFourThreeButton: UIButton!
    @IBOutlet weak var sensationFourMinusOneButton: UIButton!
    @IBOutlet weak var ssensationFourMinusTwoButton: UIButton!
    @IBOutlet weak var sensationFourMinusThreeButton: UIButton!
    
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
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        continueButton.layer.cornerRadius = kTwo
        renameNavigationBackButton()
        roundedButtons()
        
    }
    
    private func roundedView() {
        RoundedHelper.roundView(view: sensationOneView)
        RoundedHelper.roundView(view: sensationTwoView)
        RoundedHelper.roundView(view: sensationThreeView)
        RoundedHelper.roundView(view: sensationFourView)
    }
    
    private func roundedButtons() {
        RoundedHelper.roundButtons(button: sensationOneZeroButton)
        RoundedHelper.roundButtons(button: sensationOneOneButton)
        RoundedHelper.roundButtons(button: sensationOneTwoButton)
        RoundedHelper.roundButtons(button: sensationOneThreeButton)
        RoundedHelper.roundButtons(button: sensationOneMinusOneButton)
        RoundedHelper.roundButtons(button: sensationOneMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationOneMinusThreeButton)
        
        RoundedHelper.roundButtons(button: sensationTwoZeroButton)
        RoundedHelper.roundButtons(button: sensationTwoOneButton)
        RoundedHelper.roundButtons(button: sensationTwoTwoButton)
        RoundedHelper.roundButtons(button: sensationTwoThreeButton)
        RoundedHelper.roundButtons(button: sensationTwoMinusOneButton)
        RoundedHelper.roundButtons(button: sensationTwoMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationTwoMinusThreeButton)
        
        RoundedHelper.roundButtons(button: sensationThreeZeroButton)
        RoundedHelper.roundButtons(button: sensationThreeOneButton)
        RoundedHelper.roundButtons(button: sensationThreeTwoButton)
        RoundedHelper.roundButtons(button: sensationThreeThreeButton)
        RoundedHelper.roundButtons(button: sensationThreeMinusOneButton)
        RoundedHelper.roundButtons(button: sensationThreeMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationThreeMinusThreeButton)
        
        RoundedHelper.roundButtons(button: sensationFourZeroButton)
        RoundedHelper.roundButtons(button: sensationFourOneButton)
        RoundedHelper.roundButtons(button: sensationFourTwoButton)
        RoundedHelper.roundButtons(button: sensationFourThreeButton)
        RoundedHelper.roundButtons(button: sensationFourMinusOneButton)
        RoundedHelper.roundButtons(button: ssensationFourMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationFourMinusThreeButton)
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: IBAction's

    @IBAction func sensationOneZeroDidPressed(_ sender: Any) {}
    @IBAction func sensationOneOneDidPressed(_ sender: Any) {}
    @IBAction func sensationOneTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationOneThreeDidPressed(_ sender: Any) {}
    @IBAction func sensationOneMinusOneDidPressed(_ sender: Any) {}
    @IBAction func sensationOneMinusTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationOneMinusThreeDidPressed(_ sender: Any) {}
    
    @IBAction func sensationTwoZeroDidPressed(_ sender: Any) {}
    @IBAction func sensationTwoOneDidPressed(_ sender: Any) {}
    @IBAction func sensationTwoTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationTwoThreeDidPressed(_ sender: Any) {}
    @IBAction func sensationTwoMinusOneDidPressed(_ sender: Any) {}
    @IBAction func sensationTwoMinusTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationTwoMinusThreeDidPressed(_ sender: Any) {}

    @IBAction func sensationThreeZeroDidPressed(_ sender: Any) {}
    @IBAction func sensationThreeOneDidPressed(_ sender: Any) {}
    @IBAction func sensationThreeTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationThreeThreeDidPressed(_ sender: Any) {}
    @IBAction func sensationThreeMinusOneDidPressed(_ sender: Any) {}
    @IBAction func sensationThreeMinusTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationThreeMinusThreeDidPressed(_ sender: Any) {}

    @IBAction func sensationFourZeroDidPressed(_ sender: Any) {}
    @IBAction func sensationFourOneDidPressed(_ sender: Any) {}
    @IBAction func sensationFourTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationFourThreeDidPressed(_ sender: Any) {}
    @IBAction func sensationFourMinusOneDidPressed(_ sender: Any) {}
    @IBAction func sensationFourMinusTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationFourMinusThreeDidPressed(_ sender: Any) {}

    @IBAction func sensationFiveZeroDidPressed(_ sender: Any) {}
    @IBAction func ssensationFiveOneDidPressed(_ sender: Any) {}
    @IBAction func sensationFiveTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationFiveThreeDidPressed(_ sender: Any) {}
    @IBAction func sensationFiveMinusOneDidPressed(_ sender: Any) {}
    @IBAction func sensationFiveMinusTwoDidPressed(_ sender: Any) {}
    @IBAction func sensationFiveMinusThreeDidPressed(_ sender: Any) {}
}
