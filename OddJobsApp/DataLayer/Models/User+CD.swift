//
//  User+CD.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

import CoreData

extension User {
    
    init(with entity: CDUser) {
        id = Int(entity.identifier)
        name = entity.name
        surname = entity.surname
        phone = entity.phone
        earned = entity.earned
        noOfJobs = Int(entity.noOfJobs)
    }
    
    func populate(_ entity: CDUser) {
        entity.identifier = Int32(id)
        entity.name = name
        entity.surname = surname
        entity.phone = phone
        entity.earned = earned
        entity.noOfJobs = Int32(noOfJobs)
    }
}
