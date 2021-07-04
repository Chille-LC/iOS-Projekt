//
//  RequestError.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

enum RequestError: Error {
    case clientError
    case serverError
    case noDataError
    case decodingError
    case fetchingFromNetError
}
