//
//  PlayerCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-03-21.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    var player: Player? {
        didSet {
            if player?.isHomeTeamPlayer == true {
                playerImage.image = #imageLiteral(resourceName: "Sandin")
            } else {
                playerImage.image = #imageLiteral(resourceName: "noprofilepic")
            }
            playerNumberLabel.text = "\(player?.jerseyNumber ?? 0)"
            playerNameLabel.text = player!.firstName + " " + player!.lastName
            playerPositionLabel.text = "\(player!.position)".capitalizingFirstLetter()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Hell to the no")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    lazy var playerImage: UIImageView = {
        let playerImage = UIImageView()
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        playerImage.contentMode = .scaleAspectFit
        
        playerImage.layer.masksToBounds = true
        playerImage.layer.cornerRadius = playerImage.frame.height/2
        playerImage.clipsToBounds = true
        return playerImage
    }()
    
    lazy var playerNameLabel: UILabel = {
        let playerNameLabel = UILabel()
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        playerNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return playerNameLabel
    }()
    
    lazy var playerPositionLabel: UILabel = {
        let playerPositionLabel = UILabel()
        playerPositionLabel.translatesAutoresizingMaskIntoConstraints = false
        playerPositionLabel.font = UIFont.systemFont(ofSize: 14)
        return playerPositionLabel
    }()
    
    lazy var playerNumberLabel: UILabel = {
        let playerNumberLabel = UILabel()
        
        return playerNumberLabel
    }()
    
    
    func setup() {
        addSubview(playerImage)
        addSubview(playerNameLabel)
        addSubview(playerPositionLabel)
        
        NSLayoutConstraint.activate([
            playerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            playerImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            playerImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),

            playerImage.widthAnchor.constraint(equalToConstant: 50),
            playerImage.heightAnchor.constraint(equalToConstant: 50),
            
            playerNameLabel.leadingAnchor.constraint(equalTo: playerImage.trailingAnchor, constant: 10),
            playerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            
            playerPositionLabel.leadingAnchor.constraint(equalTo: playerNameLabel.leadingAnchor),
            playerPositionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
        
    }
}
