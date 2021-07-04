//
//  JobsDataRepository.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

class JobsDataRepository: JobsRepositoryProtocol {
    
    private let networkDataSource: JobsNetworkSourceProtocol
    private let coreDataSource: JobsCoreDataSourceProtocol
    
    init(networkDataSource: JobsNetworkSourceProtocol, coreDataSource: JobsCoreDataSourceProtocol) {
        self.networkDataSource = networkDataSource
        self.coreDataSource = coreDataSource
    }
    
    func fetchNetworkData(completionHandler: @escaping (Error?) -> Void) {
        networkDataSource.fetchJobsFromNetwork{ result in
            switch result {
            case .success(let jobs):
                self.coreDataSource.saveNewJobs(jobs)
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
    func fetchLocalData(filter: FilterSettings) -> [Job] {
        coreDataSource.fetchJobsFromCoreData(filter: filter)
    }
    
    func deleteLocalData(withId id: Int) {
        coreDataSource.deleteJob(withId: id)
    }
}
