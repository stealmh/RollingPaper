//
//  HomeDBImpl.swift
//  3kimWorld
//
//  Created by kimminho on 2023/02/12.
//

import Foundation
import FirebaseFirestore

struct HomeDBImpl: HomeDataSource {
    var database: Firestore = Firestore.firestore()
    
    func fetchTeam() async -> [Team] {
        var teams: [Team] = []
        do {
            let data = try await database.collection("rollingpaper").order(by: "team",descending: false).getDocuments()
            for document in data.documents {
                let id: String = document.documentID
                let docData = document.data()
                let teamNumber: String = docData["team"] as? String ?? ""
                let team: Team = Team(id: id, team: teamNumber)
                teams.append(team)
                print(id)
            }
            return teams
        } catch {
            print("error!")
            return []
        }
    }
}
