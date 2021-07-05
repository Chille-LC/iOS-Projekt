//
//  SignupPresenter.swift
//  OddJobsApp
//
//  Created by Five on 10.06.2021..
//

import Foundation
import Reachability

class SignupPresenter {
    private var coordinator: NavigationCoordinator!
    private var reachability: Reachability!
    private var networkService: NetworkServiceProtocol
    
    init(coordinator: NavigationCoordinator, networkService: NetworkServiceProtocol){
        self.coordinator = coordinator
        self.reachability = Reachability(hostname: "https://oddjobsapp.azurewebsites.net/api")
        self.networkService = networkService
    }
    
    func showLoginForm() {
        coordinator.returnToLoginVC()
    }
    
    func signup(user: User, username: String, password: String, confirmedPassword: String, completion:@escaping (LoginStatus?)->()) {
        if ((reachability?.isReachable()) != nil && reachability?.isReachable() == true) {
            if (password != confirmedPassword) {
                completion(.error(3, "Passwords do not match!"))
                return
            }
            
            guard let url = URL(string: "https://oddjobsapp.azurewebsites.net/api/users") else { return }
            let body: [String: Any] = ["name": user.name,
                                       "surname": user.surname,
                                       "phone": user.phone,
                                       "earned": user.earned,
                                       "noOfJobs": user.noOfJobs,
                                       "username": username,
                                       "password": password]
            let bodyJson = try? JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            print(body)
            request.httpBody = bodyJson
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("\(String(describing: bodyJson?.count))", forHTTPHeaderField: "Content-Length")
            
            networkService.executeUrlRequest(request) { (result: Result<String,
            RequestError>) in
                switch result {
                case .failure(let error):
                    print(error)
                    completion(.error(1, "Request error"))
                case .success(let value):
                    let userDefaults = UserDefaults.standard
                    /*userDefaults.set(value.id, forKey: "id")
                    userDefaults.set(value.name, forKey: "name")
                    userDefaults.set(value.surname, forKey: "surname")
                    userDefaults.set(value.phone, forKey: "phone")
                    userDefaults.set(value.earned, forKey: "earned")
                    userDefaults.set(value.noOfJobs, forKey: "noOfJobs")*/
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
