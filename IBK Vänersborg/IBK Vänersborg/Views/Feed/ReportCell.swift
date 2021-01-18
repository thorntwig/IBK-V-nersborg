//
//  ReportCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-10.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class ReportCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "ReportCell"
    
    
    let typeLabel     = UILabel()
    let homeTeamLabel = UILabel()
    let awayTeamLabel = UILabel()
    let reportImage = UIImageView()
    let homeTeamScore = UILabel()
    let awayTemaScore = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageViews()
        
        typeLabel.textColor = .systemRed
        typeLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        homeTeamLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        awayTeamLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        homeTeamScore.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        awayTemaScore.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        

        let innerNamesStackView = UIStackView(arrangedSubviews: [homeTeamLabel, awayTeamLabel])
        innerNamesStackView.axis = .vertical
        let innerScoreStackView = UIStackView(arrangedSubviews: [homeTeamScore, awayTemaScore])
        innerScoreStackView.axis = .vertical
        
        let innerComboStackView = UIStackView(arrangedSubviews: [innerNamesStackView, innerScoreStackView])
        innerComboStackView.distribution = .equalSpacing
        
        reportImage.clipsToBounds = true
        reportImage.layer.cornerRadius = 10
        reportImage.contentMode = .scaleAspectFill
        contentView.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        let outerStackView = UIStackView(arrangedSubviews: [teamsImageView, reportImage, typeLabel ,innerComboStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.axis = .vertical
        outerStackView.distribution = .equalCentering
        outerStackView.spacing = UIStackView.spacingUseSystem
        outerStackView.isLayoutMarginsRelativeArrangement = true
        outerStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 10, bottom: 10, trailing: 10)
        contentView.addSubview(outerStackView)
        
        NSLayoutConstraint.activate([
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
    }
    
    lazy var teamsImageView: UIView = {
        let teamsImageView = UIView()
        teamsImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return teamsImageView
    }()
    
    lazy var homeTeamImage: UIImageView = {
        let homeTeamImage = UIImageView()
        homeTeamImage.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImage.contentMode = .scaleAspectFit
        
        return homeTeamImage
    }()
    
    lazy var awayTeamImage: UIImageView = {
        let awayTeamImage = UIImageView()
        awayTeamImage.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImage.contentMode = .scaleAspectFit
        
        return awayTeamImage
    }()
    
    lazy var placeLabel: UILabel = {
        let placeLabel = UILabel()
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        placeLabel.textColor = .darkGray
        return placeLabel
    }()
    
    lazy var dateLabel:UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        dateLabel.textColor = .darkGray
        return dateLabel
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with newsItem: Report) {
        
        self.homeTeamImage.image = #imageLiteral(resourceName: "IBKLOGGA")
        self.awayTeamImage.image = #imageLiteral(resourceName: "varaibk")
        
        self.typeLabel.text = "Referat"
        
        self.homeTeamLabel.text = newsItem.game!.homeTeam
        self.awayTeamLabel.text = newsItem.game!.awayTeam
        
        self.placeLabel.text = newsItem.game!.location
        
        self.homeTeamScore.text = "\(newsItem.game!.score.homeGoals)"
        self.awayTemaScore.text = "\(newsItem.game!.score.awayGoals)"
        
        self.reportImage.image = #imageLiteral(resourceName: "alexlin730")
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "E, d MMM yyyy"
        let stringDate = dateFormater.string(from: newsItem.game!.date)
        self.dateLabel.text = stringDate
        
    }
    
    func setupImageViews() {
        teamsImageView.addSubview(homeTeamImage)
        teamsImageView.addSubview(awayTeamImage)
        teamsImageView.addSubview(dateLabel)
        teamsImageView.addSubview(placeLabel)
        
        NSLayoutConstraint.activate([
            awayTeamImage.widthAnchor.constraint(equalToConstant: 40),
            awayTeamImage.heightAnchor.constraint(equalToConstant: 40),
            homeTeamImage.widthAnchor.constraint(equalToConstant: 40),
            homeTeamImage.heightAnchor.constraint(equalToConstant: 40),
            homeTeamImage.leadingAnchor.constraint(equalTo: teamsImageView.leadingAnchor),
            homeTeamImage.trailingAnchor.constraint(equalTo: awayTeamImage.leadingAnchor),
            placeLabel.trailingAnchor.constraint(equalTo: teamsImageView.trailingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: teamsImageView.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: placeLabel.topAnchor),
            placeLabel.centerYAnchor.constraint(equalTo: teamsImageView.centerYAnchor, constant: 5)
            //  awayTeamImage.leadingAnchor.constraint(equalTo: homeTeamImage.trailingAnchor)
        ])
        
    }
}
