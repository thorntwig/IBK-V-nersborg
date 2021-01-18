//
//  PlayerGamesCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-08.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class PlayedGamesCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("you wish")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red:0.87, green:0.88, blue:0.92, alpha:1.0)
        setupCell()
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
        awayTeamImage.image = #imageLiteral(resourceName: "IBKLOGGA")
        awayTeamImage.contentMode = .scaleAspectFit
        return awayTeamImage
    }()
    
    lazy var resultView: UIView = {
        let resultView = UIView()
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.backgroundColor = .systemGray6
        return resultView
    }()
    
    lazy var homeResultLabel: UILabel = {
        let homeResultLabel = UILabel()
        homeResultLabel.translatesAutoresizingMaskIntoConstraints = false
        homeResultLabel.text = "10"
        homeResultLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        return homeResultLabel
    }()
    
    lazy var awayResultLabel: UILabel = {
        let awayResultLabel = UILabel()
        awayResultLabel.translatesAutoresizingMaskIntoConstraints = false
        awayResultLabel.text = "10"
        awayResultLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        return awayResultLabel
    }()
    
    lazy var vsLabel: UILabel = {
        let vsLabel = UILabel()
        vsLabel.translatesAutoresizingMaskIntoConstraints = false
        vsLabel.text = "-"
        vsLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        return vsLabel
    }()
    
    lazy var tournamentLabel: UILabel = {
        let tournamentLabel = UILabel()
        tournamentLabel.translatesAutoresizingMaskIntoConstraints = false
        tournamentLabel.text = "Division 2"
        tournamentLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return tournamentLabel
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "22 Feb"
        dateLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return dateLabel
    }()
    
    func setupCell() {
        contentView.addSubview(homeTeamImage)
        contentView.addSubview(awayTeamImage)
        contentView.addSubview(resultView)
        contentView.addSubview(tournamentLabel)
        contentView.addSubview(dateLabel)
        resultView.addSubview(homeResultLabel)
        resultView.addSubview(awayResultLabel)
        resultView.addSubview(vsLabel)

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
            resultView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            resultView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            resultView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 6),
            resultView.heightAnchor.constraint(equalToConstant: contentView.frame.height / 3)
        ])
        
        NSLayoutConstraint.activate([
            homeResultLabel.centerYAnchor.constraint(equalTo: resultView.centerYAnchor),
            homeResultLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            awayResultLabel.centerYAnchor.constraint(equalTo: resultView.centerYAnchor),
            awayResultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -7)
        ])
        
        NSLayoutConstraint.activate([
            vsLabel.centerYAnchor.constraint(equalTo: resultView.centerYAnchor),
            vsLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tournamentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tournamentLabel.bottomAnchor.constraint(equalTo: resultView.topAnchor),
            tournamentLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: resultView.bottomAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
