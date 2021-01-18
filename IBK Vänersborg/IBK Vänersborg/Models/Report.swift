//
//  report.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-10.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import Foundation

struct Report: Codable, Hashable {
    var id: Int
    //var type: String
    var game: Game?
    var title: String
    var content: String
    
//    init(id: Int, type: String, game: Game, title: String, content: String) {
//        self.id      = id
//        self.type    = type
//        self.game    = game
//        self.title   = title
//        self.content = content
//    }
}
