//
//  LoggedResearcherViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoggedResearcherViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var registerSampleButton: UIButton!
    @IBOutlet weak var sampleResultButton: UIButton!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    let kBorderWidth: CGFloat = 1.0
    var ref: DatabaseReference?

    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        initDataBase()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        setupNameLabel()
    }
    
    // MARK: Private Functions
    
    private func initDataBase() {
        ref = Database.database().reference()
    }
    
    private func setupView() {
        RoundedHelper.roundContinueButton(button: registerSampleButton)
        sampleResultButton.layer.cornerRadius = kTwo
        sampleResultButton.layer.borderWidth = kBorderWidth
        sampleResultButton.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        renameNavigationBackButton()
        removeNavigationBorder()
    }
    
    private func setupNameLabel() {
        let userID : String = (Auth.auth().currentUser?.uid)!
        print("Current user ID is" + userID)
        self.ref!.child("users").child(userID).observeSingleEvent(of: .value, with: {(snapshot) in
            let name = (snapshot.value as! NSDictionary)["name"] as! String
            self.helloLabel.text = "Oi! \(name)"
        })
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: IBActions's

    @IBAction func registerSampleButtonDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "sampleSegue", sender: self)
    }
    
    @IBAction func sampleResultButtonDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    @IBAction func aboutButtonDidPressed(_ sender: Any) {}
}
