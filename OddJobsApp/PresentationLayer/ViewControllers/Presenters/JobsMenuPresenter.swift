//
//  JobsMenuPresenter.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

import Foundation
import Reachability

final class JobsVCPresenter {

    private var jobUseCase: JobsUseCase!
    private var reachability: Reachability!
    private var jobs: [Job] = []
    private var currentFilterSettings: FilterSettings

    init() {
        let coreDataContext = CoreDataStack(modelName: "JobsCD").managedContext
        let jobRepository = JobsDataRepository(networkDataSource: JobsNetworkDataSource(), coreDataSource: JobsCoreDataSource(coreDataContext: coreDataContext))
        self.jobUseCase = JobsUseCase(jobsRepo: jobRepository)
        self.currentFilterSettings = FilterSettings()
    }

    func refreshJobs(completionHandler: @escaping (Result<[Job], Error>) -> Void) {
        jobUseCase.refreshData { error in
            if error == nil {
                completionHandler(.success(self.filterJobs(filter: self.currentFilterSettings)))
            } else {
                completionHandler(.failure(error!))
            }
        }
    }

    func filterJobs(filter: FilterSettings) -> [Job] {
        currentFilterSettings = filter
        jobs = jobUseCase.getJobs(filter: filter)
        return jobs
    }

}
