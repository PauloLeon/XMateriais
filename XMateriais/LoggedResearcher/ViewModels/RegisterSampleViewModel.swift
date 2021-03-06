//
//  RegisterSampleViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class RegisterSampleViewModel {
    
    // MARK: Variable's
    
    var nameMaterial: String?
    var descriptionMaterial: String?
    var code: String?
    var ref: DatabaseReference?
    
    // MARK: Init Functions
    
    init() {
        nameMaterial = ""
        descriptionMaterial = ""
        ref = Database.database().reference()
    }
    
    // MARK: Public Functions
    
    func setNameMaterial(name: String) {
        nameMaterial = name
    }
    
    func setDescriptionMaterial(desc: String) {
        descriptionMaterial = desc
    }
    
    func saveMaterial() {
        let userID : String = (Auth.auth().currentUser?.uid)!
        self.ref!.child("users/\(userID)/materials").childByAutoId().setValue(setMaterialData())
    }
    
    // MARK: Private Functions
    
    private func setMaterialData() -> [String : Any] {
        guard let name = nameMaterial, let descMaterial = descriptionMaterial else {
            return [:]
        }
        code = randomCode()
        let materialData = ["nameMaterial": name, "descriptionMaterial": descMaterial, "code": code]
        return materialData
    }
    
    private func randomCode() -> String {
        var number = String()
        for _ in 1...3 {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}
