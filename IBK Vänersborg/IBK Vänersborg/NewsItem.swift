//
//  NewsItem.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-10.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import Foundation

protocol NewsItem: Decodable {
    var type: String { get }
}
