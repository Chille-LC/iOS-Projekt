//
//  DELETE.swift
//  OddJobsApp
//
//  Created by Mac Use on 02.06.2021..
//

import Foundation

//delete after implemented CD and network services
func generateRandomData() -> [[Job]] {
    let jobs: [Job] = [
        //School
        Job(id: 0, title: "Python", description: "I will solve your highschool Python homework. I am student at FER. Clean code", price: 12, category: JobCategory.school),
        Job(id: 1, title: "Maths", description: "I will teach you Maths. I won a silver medal in 2019 at IMO for highschool students.", price: 10, category: JobCategory.school),
        Job(id: 3, title: "C++", description: "I will solve your highschool C++ homework. I am student at FER. Clean code", price: 12, category: JobCategory.school),
        Job(id: 4, title: "Biology", description: "I will teach you Biology. I won a silver medal in 2019 at IMO for highschool students.", price: 10, category: JobCategory.school),
        
        //Fix and install
        Job(id: 5, title: "Plumber", description: "I will fix or install your plumbing. I have 25+ years of experience.", price: 23, category: JobCategory.fixInstall),
        Job(id: 6, title: "Paintwork", description: "I will paint your inside walls. You provide the paint. 10+ years of experience.", price: 10, category: JobCategory.fixInstall),
        Job(id: 7, title: "Plumber2", description: "I will fix or install your plumbing. I have 25+ years of experience.", price: 23, category: JobCategory.fixInstall),
        Job(id: 8, title: "Paintwork2", description: "I will paint your inside walls. You provide the paint. 10+ years of experience.", price: 10, category: JobCategory.fixInstall),
        
        //House chores
        Job(id: 9, title: "House cleaning", description: "I will clean your house. Vacuuming floors, dusting, cleaning windows.", price: 12, category: JobCategory.houseChores),
        Job(id: 10, title: "Groceries", description: "I will buy groceries for you and deliver them to your house.", price: 10, category: JobCategory.houseChores),
        Job(id: 9, title: "House cleaning2", description: "I will clean your house. Vacuuming floors, dusting, cleaning windows.", price: 12, category: JobCategory.houseChores),
        Job(id: 10, title: "Groceries2", description: "I will buy groceries for you and deliver them to your house.", price: 10, category: JobCategory.houseChores)
    ]
    
    return JobManager.sortBySections(jobs)
}


