//
//  Section.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-10.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import Foundation

struct Section: Decodable, Hashable {
    
    var id: Int
    var type: String
    var items: [Report]
    var title: String
}
