//
//  FilterSettings.swift
//  OddJobsApp
//
//  Created by Mac Use on 04.07.2021..
//

struct FilterSettings {

    let searchText: String?

    init(searchText: String? = nil) {
        self.searchText = (searchText?.isEmpty ?? true) ? nil : searchText
    }

}
