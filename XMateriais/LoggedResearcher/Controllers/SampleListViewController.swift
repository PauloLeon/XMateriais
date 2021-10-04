//
//  SampleListViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import NVActivityIndicatorView

class SampleListViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variable's
    
    let kReusableIdentifier = "sampleCell"
    let kSegue = "segueEmail"
    let kNameMaterial = "nameMaterial"
    let kCode = "code"
    
    var ref: DatabaseReference?
    var materials: [NSDictionary]? = []
    var material: NSDictionary?
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataBase()
        getMaterials()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegue {
            if let nextViewController = segue.destination as? EmailViewController {
                    nextViewController.material = material
            }
        }
    }
    
    // MARK: Private Functions
    
    private func initDataBase() {
        ref = Database.database().reference()
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getMaterials() {
        startAnimating()
        let userID : String = (Auth.auth().currentUser?.uid)!
        self.ref!.child("users/\(userID)/materials").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            for (_, valueNew) in value! {
                self.materials?.append(valueNew as! NSDictionary)
            }
            self.tableView.reloadData()
            self.stopAnimating()
        })
    }
}

extension SampleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kReusableIdentifier, for: indexPath) as! SampleTableViewCell
        if let dicMaterials = materials {
            let material: NSDictionary =  dicMaterials[indexPath.row]
            if let name = material[kNameMaterial] as? String, let code = material[kCode] as? String {
                cell.configCell(nameMaterial: name, code: code)
            }
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materials?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dicMaterials = materials {
            let material: NSDictionary = dicMaterials[indexPath.row]
            self.material = material
        }
        performSegue(withIdentifier: kSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }

}
