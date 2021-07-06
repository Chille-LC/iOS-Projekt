//
//  AddJobPresenter.swift
//  OddJobsApp
//
//  Created by Five on 05.07.2021..
//

import Foundation
import Reachability

class AddJobPresenter {
    private var coordinator: NavigationCoordinator!
    private var reachability: Reachability!
    private var networkService: NetworkServiceProtocol
    
    init(coordinator: NavigationCoordinator, networkService: NetworkServiceProtocol){
        self.coordinator = coordinator
        self.reachability = Reachability(hostname: "https://oddjobsapp.azurewebsites.net/api")
        self.networkService = networkService
    }
    
    func addJob(title: String, description: String, price: Float, category: JobCategory, completion:@escaping (LoginStatus?)->()) {
        if ((reachability?.isReachable()) != nil && reachability?.isReachable() == true) {
            guard let url = URL(string: "https://oddjobsapp.azurewebsites.net/api/jobs") else { return }
            let body: [String: Any] = ["title": title,
                                       "category": category.rawValue,
                                       "description": description,
                                       "price": price,
                                       "id": UserDefaults.standard.string(forKey: "id")!]
            let bodyJson = try? JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            print(body)
            request.httpBody = bodyJson
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("\(String(describing: bodyJson?.count))", forHTTPHeaderField: "Content-Length")
            
            networkService.executeUrlRequest(request) { (result: Result<Job,
            RequestError>) in
                switch result {
                case .failure(_):
                    completion(.error(1, "Request error"))
                case .success(_):
                    completion(.success)
                }
            }
        }
        else {
            completion(.error(2, "No internet connection"))
        }
    }
}

