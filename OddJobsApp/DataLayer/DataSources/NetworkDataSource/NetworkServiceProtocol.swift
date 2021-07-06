//
//  NetworkServiceProtocol.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

import Foundation

protocol NetworkServiceProtocol {
    
    func executeUrlRequest<T: Decodable>(_ request: URLRequest, completionHandler: @escaping(Result<T, RequestError>) -> Void)
}
