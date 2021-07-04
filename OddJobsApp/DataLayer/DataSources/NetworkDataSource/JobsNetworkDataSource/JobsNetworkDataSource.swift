//
//  JobsNetworkDataSource.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

import Foundation

struct JobsNetworkDataSource: JobsNetworkSourceProtocol {
    
    func fetchJobsFromNetwork(completionHandler: @escaping (Result<[Job], RequestError>) -> Void) {
        guard let url = URL(string: "https://oddjobsapp.azurewebsites.net/api/jobs") else {
            print("Error fetching from network.")
            return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        networkService.executeUrlRequest(request) { (result: Result<[Job], RequestError>) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let value):
                completionHandler(.success(value))
            }
        }
    }
}
