//
//  SampleTableViewCell.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation
import UIKit

class SampleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    let kTitleAttrbuted = "Material: "
    let kCode = " Código: "
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func configCell(nameMaterial: String, code: String) {
        helloLabel.attributedText = setAttributedText(nameMaterial: nameMaterial, code: code)
    }
    
    func setAttributedText(nameMaterial: String, code: String) -> NSMutableAttributedString {
        let attrBlack = [ NSAttributedString.Key.foregroundColor: UIColor.black]
        let attrOrange = [ NSAttributedString.Key.foregroundColor: UIColor.getPrimaryColor()]
        let myAttrString = NSAttributedString(string: kTitleAttrbuted, attributes: attrBlack)
        let myAttrString2 = NSAttributedString(string: nameMaterial, attributes: attrOrange)
        let myAttrString3 = NSAttributedString(string: kCode, attributes: attrBlack)
        let myAttrString4 = NSAttributedString(string: code, attributes: attrOrange)
        let combination = NSMutableAttributedString()
        combination.append(myAttrString)
        combination.append(myAttrString2)
        combination.append(myAttrString3)
        combination.append(myAttrString4)
        return combination
    }
}
