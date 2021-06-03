//
//  UITableViewCell.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

import UIKit

extension UITableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
