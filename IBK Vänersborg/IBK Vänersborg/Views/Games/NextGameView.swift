//
//  NextGameView.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-03-05.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

protocol NextGameDelegate:class {
    func pUpdated(withValut: Int)
}

class NextGameView: UIView {
    
    var p: Int {
        didSet{
            delegate?.pUpdated(withValut: p)
        }
    }
    
    weak var delegate: NextGameDelegate?
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override init(frame: CGRect) {
        self.p = 0
        super.init(frame: frame)
        addSubview(mainContentView)
        setupConstraints()
        
    }
    
    lazy var mainContentView: UIView = {
        let mainContentView = UIView()
        mainContentView.translatesAutoresizingMaskIntoConstraints = false
        mainContentView.backgroundColor = .lightGray
        mainContentView.layer.cornerRadius = 10
        mainContentView.clipsToBounds = true
        return mainContentView
    }()
    
    lazy var homeTeamImageView: UIImageView = {
        let homeTeamImageView = UIImageView()
        homeTeamImageView.image = UIImage(named: "IBKLOGGA")
        
        homeTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImageView.contentMode = .scaleAspectFit
        return homeTeamImageView
    }()
    
    lazy var awayTemaImageView: UIImageView = {
        let awayTeamImageView = UIImageView()
        awayTeamImageView.image = UIImage(named: "varaibk")
        
        awayTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImageView.contentMode = .scaleAspectFit
        return awayTeamImageView
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "4 Januari, 2020"
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return dateLabel
    }()
    
    lazy var timeView: UIView = {
        let timeView = UIView()
        timeView.translatesAutoresizingMaskIntoConstraints = false
        timeView.backgroundColor = .cyan
        return timeView
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        timeLabel.text = "20:00"
        return timeLabel
    }()
    
    lazy var placeLabel: UILabel = {
        let placeLabel = UILabel()
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.text = "A-hallen, Vänersborg"
        return placeLabel
    }()
    
    lazy var troopsSegmentetControl: UISegmentedControl = {
        let segmentItems = ["Hemmalag", "Bortalag"]
        let troopsSegmentetControl = UISegmentedControl(items: segmentItems)
        
        troopsSegmentetControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        troopsSegmentetControl.selectedSegmentIndex = 0
        troopsSegmentetControl.translatesAutoresizingMaskIntoConstraints = false
        return troopsSegmentetControl
    }()
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            p = 0
          case 1:
            p = 1
          default:
          break
       }
    }
    
//    lazy var placeStaticLabel: UILabel = {
//        let placeStaticLabel = UILabel()
//        placeStaticLabel.translatesAutoresizingMaskIntoConstraints = false
//        placeStaticLabel.text = "Plats"
//        return placeStaticLabel
//    }()
    
    lazy var troopsTableView: UITableView = {
        let troopsTV = UITableView()
        troopsTV.translatesAutoresizingMaskIntoConstraints = false
        return troopsTV
    }()
    

    func setupConstraints() {
        
        mainContentView.addSubview(homeTeamImageView)
        mainContentView.addSubview(awayTemaImageView)
        mainContentView.addSubview(dateLabel)
        mainContentView.addSubview(timeView)
        timeView.addSubview(timeLabel)
        mainContentView.addSubview(placeLabel)
        addSubview(troopsSegmentetControl)
        addSubview(troopsTableView)
        
//        mainContentView.addSubview(placeStaticLabel)
        
        
        NSLayoutConstraint.activate([
            mainContentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            mainContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            //mainContentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            homeTeamImageView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 10),
            homeTeamImageView.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 50),
            homeTeamImageView.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: -50),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 120),
            homeTeamImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            awayTemaImageView.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 50),
            awayTemaImageView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -10),
            awayTemaImageView.heightAnchor.constraint(equalToConstant: 120),
            awayTemaImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 25),
            placeLabel.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: -25),
            placeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            placeStaticLabel.bottomAnchor.constraint(equalTo: placeLabel.topAnchor),
//            placeStaticLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timeView.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            timeView.centerYAnchor.constraint(equalTo: homeTeamImageView.centerYAnchor),
            timeView.widthAnchor.constraint(equalToConstant: 80),
            timeView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.centerYAnchor.constraint(equalTo: timeView.centerYAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: timeView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            troopsSegmentetControl.topAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: 10),
            troopsSegmentetControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            troopsSegmentetControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            troopsTableView.topAnchor.constraint(equalTo: troopsSegmentetControl.bottomAnchor, constant: 10),
            troopsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            troopsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            troopsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
            
        ])
    }
}
