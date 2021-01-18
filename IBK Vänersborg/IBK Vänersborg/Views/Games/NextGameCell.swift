//
//  upcomingGameCVCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-05.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class NextGameCell: UICollectionViewCell, MatchesVCDeleget {

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(upCommingGameView)
        setupView()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var upCommingGameView: UIView = {
        let teamView = UIView()
        
        teamView.layer.cornerRadius = 5
        teamView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        teamView.translatesAutoresizingMaskIntoConstraints = false
        teamView.backgroundColor = UIColor(red:0.87, green:0.88, blue:0.92, alpha:1.0)
        return teamView
    }()
    
    lazy var nextGameLabel: UILabel = {
        let nextGameLabel = UILabel()
        nextGameLabel.translatesAutoresizingMaskIntoConstraints = false
        nextGameLabel.text = "Nästa match"
        nextGameLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return nextGameLabel
    }()

    lazy var teamName: UILabel = {
        let teamName = UILabel()
        teamName.translatesAutoresizingMaskIntoConstraints = false
        teamName.text = "IBK Vänersborg"
        return teamName
    }()

    lazy var awayTeamImage: UIImageView = {
        let awayTeamImage = UIImageView()
        awayTeamImage.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImage.image = #imageLiteral(resourceName: "varaibk")
        awayTeamImage.contentMode = .scaleAspectFit

        return awayTeamImage
    }()

    lazy var awayTeamName: UILabel = {
        let awayTeamName = UILabel()
        awayTeamName.translatesAutoresizingMaskIntoConstraints = false
        awayTeamName.text = "IBK Vänersborg"
        return awayTeamName
    }()

    lazy var kickOfLabelTime: UILabel = {
        let kickOfLabelTime = UILabel()
        kickOfLabelTime.translatesAutoresizingMaskIntoConstraints = false
        kickOfLabelTime.text = "20:00"
        kickOfLabelTime.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        return kickOfLabelTime
    }()

    lazy var teamImage: UIImageView = {
        let teamImage = UIImageView()
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        teamImage.image = #imageLiteral(resourceName: "IBKLOGGA")
        teamImage.contentMode = .scaleAspectFit
        return teamImage
    }()

    lazy var kickOfLabel: UILabel = {
        let kickOfLabel = UILabel()
        kickOfLabel.translatesAutoresizingMaskIntoConstraints = false
        kickOfLabel.text = "Teckning"
        kickOfLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return kickOfLabel
    }()
    
    lazy var countDownView: UIView = {
        let countDownView = UIView()
        
        countDownView.translatesAutoresizingMaskIntoConstraints = false
        countDownView.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        countDownView.layer.masksToBounds = false
        countDownView.layer.cornerRadius = 5.0
        
        return countDownView
    }()
    
    lazy var countDownLabel: UILabel = {
        let countDownLoad = UILabel()
        countDownLoad.text = "0d 0h 0m 0s"
        countDownLoad.translatesAutoresizingMaskIntoConstraints = false
        countDownLoad.font = UIFont.boldSystemFont(ofSize: 18)
        return countDownLoad
    }()
    
    func setupView() {

        upCommingGameView.addSubview(teamImage)
        upCommingGameView.addSubview(teamName)
        upCommingGameView.addSubview(awayTeamImage)
        upCommingGameView.addSubview(awayTeamName)
        upCommingGameView.addSubview(kickOfLabelTime)
        upCommingGameView.addSubview(kickOfLabel)
        upCommingGameView.addSubview(countDownView)
        upCommingGameView.addSubview(nextGameLabel)
        countDownView.addSubview(countDownLabel)

        NSLayoutConstraint.activate([
            upCommingGameView.leadingAnchor.constraint(equalTo: leadingAnchor),
            upCommingGameView.trailingAnchor.constraint(equalTo: trailingAnchor),
            upCommingGameView.topAnchor.constraint(equalTo: topAnchor),
            upCommingGameView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            teamImage.leadingAnchor.constraint(equalTo: upCommingGameView.leadingAnchor, constant: 35),
            teamImage.centerYAnchor.constraint(equalTo: upCommingGameView.centerYAnchor, constant: -25),
            teamImage.heightAnchor.constraint(equalToConstant: 100),
            teamImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            kickOfLabel.centerXAnchor.constraint(equalTo: upCommingGameView.centerXAnchor),
            kickOfLabel.centerYAnchor.constraint(equalTo: teamImage.centerYAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            kickOfLabelTime.centerXAnchor.constraint(equalTo: kickOfLabel.centerXAnchor),
            kickOfLabelTime.topAnchor.constraint(equalTo: kickOfLabel.bottomAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            teamName.topAnchor.constraint(equalTo: teamImage.bottomAnchor),
            teamName.centerXAnchor.constraint(equalTo: teamImage.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            awayTeamImage.trailingAnchor.constraint(equalTo: upCommingGameView.trailingAnchor, constant: -35),
            awayTeamImage.centerYAnchor.constraint(equalTo: upCommingGameView.centerYAnchor, constant: -25),
            awayTeamImage.heightAnchor.constraint(equalToConstant: 100),
            awayTeamImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            awayTeamName.topAnchor.constraint(equalTo: awayTeamImage.bottomAnchor),
            awayTeamName.centerXAnchor.constraint(equalTo: awayTeamImage.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            countDownView.heightAnchor.constraint(equalToConstant: 40),
            countDownView.leadingAnchor.constraint(equalTo: upCommingGameView.leadingAnchor, constant: 4),
            countDownView.trailingAnchor.constraint(equalTo: upCommingGameView.trailingAnchor, constant: -4),
            countDownView.bottomAnchor.constraint(equalTo: upCommingGameView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            countDownLabel.centerXAnchor.constraint(equalTo: countDownView.centerXAnchor),
            countDownLabel.centerYAnchor.constraint(equalTo: countDownView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nextGameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextGameLabel.topAnchor.constraint(equalTo: upCommingGameView.topAnchor, constant: 10)
        ])
    }
    
    func updateTimeToEvent(timeString: String) {
        countDownLabel.text = timeString
    }
}
