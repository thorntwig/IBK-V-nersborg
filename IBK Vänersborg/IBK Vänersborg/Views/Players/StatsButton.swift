//
//  StatsButton.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-18.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class StatsButton: UIButton {
    
    enum typeOfStat {
        case games
        case goal
        case assist
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        setupBotton()
    }
    
    lazy var totalLabel: UILabel = {
        let totalLabel = UILabel()
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        return totalLabel
    }()
    
    lazy var typeOfStatsLabel: UILabel = {
        let typeOfStatsLabel = UILabel()
        typeOfStatsLabel.translatesAutoresizingMaskIntoConstraints = false
        typeOfStatsLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        typeOfStatsLabel.textColor = .secondaryLabel
        return typeOfStatsLabel
    }()
    
    func setupBotton () {
        addSubview(totalLabel)
        addSubview(typeOfStatsLabel)
        NSLayoutConstraint.activate([
            totalLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            totalLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            typeOfStatsLabel.bottomAnchor.constraint(equalTo: totalLabel.topAnchor, constant: 5),
            typeOfStatsLabel.centerXAnchor.constraint(equalTo: totalLabel.centerXAnchor)
        ])
    }
    
    func setupButton(for player: Player, typeOfStat: typeOfStat) {
        switch typeOfStat {
        case .games:
            totalLabel.text = "\(player.games)"
            typeOfStatsLabel.text = "Matcher 19/20"
        case .goal:
            totalLabel.text = "\(player.games)"
            typeOfStatsLabel.text = "Mål 19/20"
        case .assist:
            totalLabel.text = "\(player.games)"
            typeOfStatsLabel.text = "Assist 19/20"
        }
        
    }
    
}
