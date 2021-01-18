//
//  Game.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-01-29.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import Foundation

struct Game: Codable, Hashable {
    let homeTeam: String
    let awayTeam: String
    let location: String
    let date: Date
    let score: Score
    
//    init(homeTeam: String, awayTeam: String, location: String,date:Date, score: Score) {
//        self.homeTeam = homeTeam
//        self.awayTeam = awayTeam
//        self.location = location
//        self.date     = date
//        self.score    = score
//    }
    
    struct Score: Codable, Hashable {
        let homeGoals: Int
        let awayGoals: Int
    
//        init(homeGoals: Int, awayGoals: Int) {
//            self.homeGoals = homeGoals
//            self.awayGoals = awayGoals
//        }
    }
}
