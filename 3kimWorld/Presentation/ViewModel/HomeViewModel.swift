//
//  HomeViewModel.swift
//  3kimWorld
//
//  Created by kimminho on 2023/02/12.
//

import Foundation

protocol HomeViewInput {
    func fetchTeam() async 
}
protocol HomeViewOutput {}


class HomeViewModel: ObservableObject, HomeViewInput {
    var homeUseCase = HomeUseCase(homeRepository: HomeRepositoryImpl(dataSource: HomeDBImpl()))
    @Published var teams: [Team] = []
    func fetchTeam() async {
        let data = await homeUseCase.fetchTeam()
        await MainActor.run {
            self.teams = data
        }
    }
}
