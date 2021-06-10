//
//  Constants.swift
//  OddJobsApp
//
//  Created by Mac Use on 01.06.2021..
//
import UIKit

let gradientColors: [CGColor] = [UIColor(red: 255/255, green: 190/255, blue: 70/255, alpha: 1).cgColor,
                                 UIColor(red: 251/255, green: 163/255, blue: 0, alpha: 1).cgColor]

let gradientColorsSecondary: [CGColor] = [UIColor(red: 255/255, green: 190/255, blue: 70/255, alpha: 0.9).cgColor,
                                          UIColor(red: 251/255, green: 163/255, blue: 0, alpha: 0.9).cgColor]

let textFieldHeight: CGFloat = 50
let elementInset: CGFloat = 30

//Colors from figma
struct MainColors {
    static let primaryOrange: UIColor = UIColor(red: 254/255, green: 178/255, blue: 38/255, alpha: 1)
    static let smoothPurple: UIColor = UIColor(red: 83/255, green: 83/255, blue: 111/255, alpha: 1)
    static let darkBlue: UIColor = UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 1)
    static let secondaryGray: UIColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
}

struct CellDimensions {
    static let X: CGFloat = 170
    static let Y: CGFloat = 170
}
