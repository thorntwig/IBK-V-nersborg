//
//  SelfConfiguringCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-10.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with report: Report)
}
