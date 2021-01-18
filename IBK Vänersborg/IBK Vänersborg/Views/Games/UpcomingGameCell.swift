//
//  upcomingGameCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-07.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class UpcomingGameCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("hells no")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red:0.87, green:0.88, blue:0.92, alpha:1.0)
        setupView()
    }
    
    lazy var homeTeamImage: UIImageView = {
        let homeTeamImage = UIImageView()
        homeTeamImage.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImage.image = #imageLiteral(resourceName: "IBKLOGGA")
        homeTeamImage.contentMode = .scaleAspectFit
        return homeTeamImage
    }()
    
    lazy var awayTeamImage: UIImageView = {
        let awayTeamImage = UIImageView()
        awayTeamImage.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImage.image = #imageLiteral(resourceName: "varaibk")
        awayTeamImage.contentMode = .scaleAspectFit
        return awayTeamImage
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Lör, 12 Feb"
        dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return dateLabel
    }()
    
    lazy var tournamentLabel: UILabel = {
        let tournamentLabel = UILabel()
        tournamentLabel.translatesAutoresizingMaskIntoConstraints = false
        tournamentLabel.text = "Division 2"
        return tournamentLabel
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "14:00"
        return timeLabel
    }()
    
    func setupView() {
        contentView.addSubview(homeTeamImage)
        contentView.addSubview(awayTeamImage)
        contentView.addSubview(dateLabel)
        contentView.addSubview(tournamentLabel)
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            homeTeamImage.widthAnchor.constraint(equalToConstant: 70),
            homeTeamImage.heightAnchor.constraint(equalToConstant: 70),
            homeTeamImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            homeTeamImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            awayTeamImage.widthAnchor.constraint(equalToConstant: 70),
            awayTeamImage.heightAnchor.constraint(equalToConstant: 70),
            awayTeamImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            awayTeamImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tournamentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tournamentLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5)
        ])
        
    }
}
