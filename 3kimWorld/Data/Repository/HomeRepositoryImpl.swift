//
//  HomeRepositoryImpl.swift
//  3kimWorld
//
//  Created by kimminho on 2023/02/12.
//

import Foundation

struct HomeRepositoryImpl: HomeRepository {
    var dataSource: HomeDataSource
    
    func fetchTeam() async -> [Team] {
        let data = await dataSource.fetchTeam()
        return data
    }
    
}
