//
//  ImageEnum.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

import UIKit

public enum ImageEnum {
    
    //MARK: Tab Bar Items
    case jobTabBarItem
    case jobTabBarItemSelected
    case addJobTabBarItem
    case addJobTabBarItemSelected
    case settingsTabBarItem
    case settingsTabBarItemSelected
    
    var image: UIImage {
        switch self {
        case .jobTabBarItem: return (UIImage(named: "jobs.svg")?.withTintColor(MainColors.darkBlue, renderingMode: .alwaysOriginal))!
        case .jobTabBarItemSelected: return (UIImage(named: "jobs.svg")?.withTintColor(MainColors.primaryOrange, renderingMode: .alwaysOriginal))!

        case .addJobTabBarItem: return (UIImage(named: "plus.svg")?.withTintColor(MainColors.darkBlue, renderingMode: .alwaysOriginal))!
        case .addJobTabBarItemSelected: return (UIImage(named: "plus.svg")?.withTintColor(MainColors.primaryOrange, renderingMode: .alwaysOriginal))!

        case .settingsTabBarItem: return (UIImage(named: "settings.svg")?.withTintColor(MainColors.darkBlue, renderingMode: .alwaysOriginal))!
        case .settingsTabBarItemSelected: return (UIImage(named: "settings.svg")?.withTintColor(MainColors.primaryOrange, renderingMode: .alwaysOriginal))!
        }
    }

}
