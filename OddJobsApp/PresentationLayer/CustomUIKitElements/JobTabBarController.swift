//
//  JobTabBarController.swift
//  OddJobsApp
//
//  Created by Mac Use on 03.06.2021..
//

import UIKit

class JobTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(JobTabBar(frame: tabBar.frame), forKey: "tabBar")
        modalPresentationStyle = .fullScreen
    }
}
