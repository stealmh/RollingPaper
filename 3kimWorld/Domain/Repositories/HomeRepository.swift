//
//  HomeRepository.swift
//  3kimWorld
//
//  Created by kimminho on 2023/02/12.
//

import Foundation

protocol HomeRepository {
    func fetchTeam() async -> [Team]
}
