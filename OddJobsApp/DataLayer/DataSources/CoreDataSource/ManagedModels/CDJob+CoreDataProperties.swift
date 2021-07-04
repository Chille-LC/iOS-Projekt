//
//  CDJob+CoreDataProperties.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//
//

import Foundation
import CoreData


extension CDJob {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDJob> {
        return NSFetchRequest<CDJob>(entityName: "CDJob")
    }

    @NSManaged public var identifier: Int32
    @NSManaged public var title: String
    @NSManaged public var jobDescription: String
    @NSManaged public var price: Int32
    @NSManaged public var category: String
    @NSManaged public var worker: CDUser

}

extension CDJob : Identifiable {

}
