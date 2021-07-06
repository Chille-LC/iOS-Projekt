//
//  JobsCoreDataSource.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

import CoreData

struct JobsCoreDataSource: JobsCoreDataSourceProtocol {

    private let coreDataContext: NSManagedObjectContext

    init(coreDataContext: NSManagedObjectContext) {
        self.coreDataContext = coreDataContext
    }

    func fetchJobsFromCoreData(filter: FilterSettings) -> [Job] {
        let request: NSFetchRequest<CDJob> = CDJob.fetchRequest()
        var titlePredicate = NSPredicate(value: true)

        if let text = filter.searchText, !text.isEmpty {
            titlePredicate = NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(CDJob.title), text)
        }

        request.predicate = titlePredicate
        do {
            return try coreDataContext.fetch(request).map { Job(with: $0)}
        } catch {
            print("Error when fetching jobs from core data: \(error)")
            return []
        }
    }

    func saveNewJobs(_ jobs: [Job]) {
        do {
            let newIds = jobs.map { $0.id }
            try deleteAllJobsExcept(withId: newIds)
        }
        catch {
            print("Error when deleting jobs from core data: \(error)")
        }
        jobs.forEach { job in
            do {
                let cdJob = try fetchJob(withId: job.id) ?? CDJob(context: coreDataContext)
                job.populate(cdJob, in: coreDataContext)
            } catch {
                print("Error when fetching/creating a job: \(error)")
            }
            do {
                try coreDataContext.save()
            } catch {
                print("Error when saving updated job: \(error)")
            }
        }
    }

    func deleteJob(withId id: Int) {
        guard let job = try? fetchJob(withId: id) else { return }

        coreDataContext.delete(job)

        do {
            try coreDataContext.save()
        } catch {
            print("Error when saving after deletion of job: \(error)")
        }

    }

    private func fetchJob(withId id: Int) throws -> CDJob? {
        let request: NSFetchRequest<CDJob> = CDJob.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %u", #keyPath(CDJob.identifier), id)

        let cdResponse = try coreDataContext.fetch(request)
        return cdResponse.first
    }

    private func deleteAllJobsExcept(withId ids: [Int]) throws {
        let request: NSFetchRequest<CDJob> = CDJob.fetchRequest()
        request.predicate = NSPredicate(format: "NOT %K IN %@", #keyPath(CDJob.identifier), ids)

        let jobsToDelete = try coreDataContext.fetch(request)
        jobsToDelete.forEach { coreDataContext.delete($0) }
        try coreDataContext.save()
    }

}
