//
//  JobsRepositoryProtocol.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

protocol JobsRepositoryProtocol {
    func fetchNetworkData(completionHandler: @escaping (Error?) -> Void)
    func fetchLocalData(filter: FilterSettings) -> [Job]
    func deleteLocalData(withId id: Int)
}
