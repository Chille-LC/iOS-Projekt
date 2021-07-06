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
    private var networkService: NetworkServiceProtocol
    
    init(coordinator: NavigationCoordinator, networkService: NetworkServiceProtocol){
        self.coordinator = coordinator
        self.reachability = Reachability(hostname: "https://oddjobsapp.azurewebsites.net/api")
        self.networkService = networkService
    }
    
    func showSignupForm() {
        coordinator.setSignupVC()
    }
    
    func login(username: String, password: String, completion:@escaping (LoginStatus?)->()) {
        if ((reachability?.isReachable()) != nil && reachability?.isReachable() == true) {
            guard let url = URL(string: "https://oddjobsapp.azurewebsites.net/api/login/\(username)/\(password)") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            networkService.executeUrlRequest(request) { (result: Result<User,
            RequestError>) in
                switch result {
                case .failure(let error):
                    print(error)
                    completion(.error(1, "Request error"))
                case .success(let value):
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(value.id, forKey: "id")
                    userDefaults.set(value.name, forKey: "name")
                    userDefaults.set(value.surname, forKey: "surname")
                    userDefaults.set(value.phone, forKey: "phone")
                    userDefaults.set(value.earned, forKey: "earned")
                    userDefaults.set(value.noOfJobs, forKey: "noOfJobs")
                    completion(.success)
                    DispatchQueue.main.asyncAfter(deadline: .now()){
                        self.coordinator.setJobsMenuVC()
                    }
                }
            }
        }
        else {
            completion(.error(2, "No internet connection"))
        }
    }
}
