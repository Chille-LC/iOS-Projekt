//
//  CDUser+CoreDataProperties.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var identifier: Int32
    @NSManaged public var name: String
    @NSManaged public var surname: String
    @NSManaged public var phone: String
    @NSManaged public var earned: Float
    @NSManaged public var noOfJobs: Int32
    @NSManaged public var job: NSSet?

}

// MARK: Generated accessors for job
extension CDUser {

    @objc(addJobObject:)
    @NSManaged public func addToJob(_ value: CDJob)

    @objc(removeJobObject:)
    @NSManaged public func removeFromJob(_ value: CDJob)

    @objc(addJob:)
    @NSManaged public func addToJob(_ values: NSSet)

    @objc(removeJob:)
    @NSManaged public func removeFromJob(_ values: NSSet)

}

extension CDUser : Identifiable {

}
