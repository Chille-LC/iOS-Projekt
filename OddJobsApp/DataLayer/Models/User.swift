//
//  User.swift
//  OddJobsApp
//
//  Created by Mac Use on 03.06.2021..
//

struct User: Decodable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        case id, name, surname, earned, phone, noOfJobs
    }
    
    //let username: String
    //let password: String
    let id: Int
    let name: String
    let surname: String
    let phone: String
    let earned: Float
    let noOfJobs: Int
}
