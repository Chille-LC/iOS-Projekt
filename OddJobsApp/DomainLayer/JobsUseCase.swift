//
//  JobsUseCase.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

final class JobsUseCase {

    private let jobsRepo: JobsRepositoryProtocol


    init(jobsRepo: JobsRepositoryProtocol) {
        self.jobsRepo = jobsRepo
    }

    func refreshData(completionHandler: @escaping (Error?) -> Void) {
        jobsRepo.fetchNetworkData{ error in
            if error == nil {
                completionHandler(nil)
            } else {
                completionHandler(error)
            }
        }
    }

    func getJobs(filter: FilterSettings) -> [Job] {
        jobsRepo.fetchLocalData(filter: filter)
    }

    func deleteQuiz(withId id: Int) {
        jobsRepo.deleteLocalData(withId: id)
    }

}
