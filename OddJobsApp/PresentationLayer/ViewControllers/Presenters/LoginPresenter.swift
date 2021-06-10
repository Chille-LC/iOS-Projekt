//
//  LoginPresenter.swift
//  OddJobsApp
//
//  Created by Five on 10.06.2021..
//

import Foundation
import Reachability

class LoginPresenter {
    private var coordinator: NavigationCoordinator!
    private var reachability: Reachability!
    
    init(coordinator: NavigationCoordinator){
        self.coordinator = coordinator
        self.reachability = Reachability(hostname: "")
    }
    
    func showSignupForm() {
        coordinator.setSignupVC()
    }
    
    func login(username: String, password: String, completion: @escaping (Bool)->()) {
        if(username == "username" && password == "password") {
            completion(true)
            coordinator.setJobsMenuVC()
        } else {
            completion(false)
        }
    }
}
