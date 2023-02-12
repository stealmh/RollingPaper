//
//  HomeDataSource.swift
//  3kimWorld
//
//  Created by kimminho on 2023/02/12.
//

import Foundation
import FirebaseFirestore

protocol HomeDataSource {
    func fetchTeam() async -> [Team]
    var database: Firestore { get }
    
}
