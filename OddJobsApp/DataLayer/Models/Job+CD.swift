//
//  Job+CD.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

import CoreData

extension Job {
    
    init(with entity: CDJob) {
        id = Int(entity.identifier)
        title = entity.title
        description = entity.jobDescription
        price = Int(entity.price)
        category = JobCategory(rawValue: entity.category) ?? JobCategory.school
        worker = User(with: entity.worker as CDUser)
    }
    
    func populate(_ entity: CDJob, in context: NSManagedObjectContext) {
        entity.identifier = Int32(id)
        entity.title = title
        entity.jobDescription = description
        entity.price = Int32(price)
        entity.category = category.rawValue
        let cdUser: CDUser = CDUser(context: context)
        worker.populate(cdUser)
    }
}
