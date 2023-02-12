//
//  HomeUseCase.swift
//  3kimWorld
//
//  Created by kimminho on 2023/02/12.
//

import Foundation

protocol HomeUse {
    func fetchTeam() async -> [Team]
}

struct HomeUseCase: HomeUse {
    var homeRepository: HomeRepository
    func fetchTeam() async -> [Team] {
        let data = await homeRepository.fetchTeam()
        return data
    }
}
