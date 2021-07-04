//
//  SignupPresenter.swift
//  OddJobsApp
//
//  Created by Five on 10.06.2021..
//

import Foundation

class SignupPresenter {
    private var coordinator: NavigationCoordinator!
    
    init(coordinator: NavigationCoordinator){
        self.coordinator = coordinator
    }
    
    func showLoginForm() {
        coordinator.returnToLoginVC()
    }
    
    func signup(user: User, password: String, confirmedPassword: String) {
        //sign up
    }
}
