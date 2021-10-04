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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func configCell(text: String) {
        helloLabel.attributedText = setAttributedText(text: text)
    }
    
    func setAttributedText(text: String) -> NSMutableAttributedString {
        let attrBlack = [ NSAttributedString.Key.foregroundColor: UIColor.black]
        let attrOrange = [ NSAttributedString.Key.foregroundColor: UIColor.getPrimaryColor()]
        let myAttrString = NSAttributedString(string: kTitleAttrbuted, attributes: attrBlack)
        let myAttrString2 = NSAttributedString(string: text, attributes: attrOrange)
        let combination = NSMutableAttributedString()
        combination.append(myAttrString)
        combination.append(myAttrString2)
        return combination
    }
}
