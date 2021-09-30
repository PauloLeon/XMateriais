//
//  RoundedHelper.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class RoundedHelper: NSObject {

    static func roundCells(cell: UICollectionViewCell) {
        cell.layer.cornerRadius = 2.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true

        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }

    static func roundView(view: UIView) {
        view.layer.cornerRadius = 2.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        view.layer.masksToBounds = true
    }

    static func roundButtons(button: UIButton) {
        button.layer.cornerRadius = button.layer.bounds.size.width/2
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.masksToBounds = true
    }

    static func roundImage(imageView: UIImageView) {
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true

        imageView.layer.shadowColor = UIColor.darkGray.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        imageView.layer.shadowRadius = 5.0
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.masksToBounds = false
        imageView.layer.shadowPath = UIBezierPath(roundedRect: imageView.bounds, cornerRadius: imageView.layer.cornerRadius).cgPath
    }
    static func roundViewNoShadow(view: UIView) {
        view.layer.cornerRadius = 10.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.masksToBounds = true
    }
    static func roundButtonsShadow(button: UIButton) {
        button.layer.cornerRadius = 10.0
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.masksToBounds = true

        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        button.layer.shadowRadius = 5.0
        button.layer.shadowOpacity = 0.5
        button.layer.masksToBounds = false
        button.layer.shadowPath = UIBezierPath(roundedRect: button.bounds, cornerRadius: button.layer.cornerRadius).cgPath
    }
}
