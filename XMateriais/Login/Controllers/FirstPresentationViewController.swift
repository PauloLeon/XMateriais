//
//  FirstPresentationViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 27/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class FirstPresentationViewController: UIViewController {

    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        renameNavigationBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addNavigationBorder()
    }
    
    // MARK: Private Functions
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    
    private func addNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
}
