//
//  User.swift
//  OddJobsApp
//
//  Created by Mac Use on 03.06.2021..
//

struct User: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id, name, surname, earned, phone
        case noOfJobs = "no_of_jobs"
    }
    
    let id: Int
    let name: String
    let surname: String
    let phone: String
    let earned: Float
    let noOfJobs: Int
}
