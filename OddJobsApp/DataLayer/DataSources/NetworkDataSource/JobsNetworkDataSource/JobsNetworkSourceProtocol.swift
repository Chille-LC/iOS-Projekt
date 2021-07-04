//
//  JobsNetworkSourceProtocol.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

protocol JobsNetworkSourceProtocol {
    func fetchJobsFromNetwork(completionHandler: @escaping (Result<[Job], RequestError>) -> Void)
}
