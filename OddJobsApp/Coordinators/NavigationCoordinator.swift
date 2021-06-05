//
//  NavigationCoordinator.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

import Foundation
import UIKit

protocol NavigationCoordinatorProtocol {
    func setStartScreen(in window: UIWindow?)
}

class NavigationCoordinator: NavigationCoordinatorProtocol {
    //MARK: - Coordinator vars
    private let navigationController: UINavigationController!
    
    //MARK: - Code
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK: - Functions
    func setStartScreen(in window: UIWindow?) {
        let tabBarViewController = JobTabBarController()
        
        let jobsVC = JobsMenuViewController(coordinator: self)
        let addJobVC = UIViewController()
        let settingsVC = UIViewController()

        jobsVC.tabBarItem = UITabBarItem(title: nil, image: ImageEnum.jobTabBarItem.image, selectedImage: ImageEnum.jobTabBarItemSelected.image)
        addJobVC.tabBarItem = UITabBarItem(title: nil, image: ImageEnum.addJobTabBarItem.image, selectedImage: ImageEnum.addJobTabBarItemSelected.image)
        settingsVC.tabBarItem = UITabBarItem(title: nil, image: ImageEnum.settingsTabBarItem.image, selectedImage: ImageEnum.settingsTabBarItemSelected.image)
        
        jobsVC.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -10, right: 0)
        addJobVC.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -10, right: 0)
        settingsVC.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -10, right: 0)
        
        tabBarViewController.viewControllers = [jobsVC, addJobVC, settingsVC]
        
        navigationController.setViewControllers([tabBarViewController], animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func setJobVC(for job: Job) {
        let vc = JobViewController(for: job)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
