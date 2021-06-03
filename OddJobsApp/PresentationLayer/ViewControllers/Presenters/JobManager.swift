//
//  JobManager.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

class JobManager {
    static func sortBySections(_ jobs: [Job]) -> [[Job]] {
        let groupedDict = Dictionary(grouping: jobs, by: { $0.category })
        let array2d = groupedDict.map({ $0.value })
        return array2d
    }
}
