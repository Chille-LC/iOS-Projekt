//
//  JobsCoreDataSourceProtocol.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

protocol JobsCoreDataSourceProtocol {
    func fetchJobsFromCoreData(filter: FilterSettings) -> [Job]
    func saveNewJobs(_ jobs: [Job])
    func deleteJob(withId id: Int)
}
