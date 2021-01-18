//
//  DetailedReportView.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-11.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class DetailedReportView: UIView {

    required init?(coder: NSCoder) {
        fatalError("oh no")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        imageView.layer.masksToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        headerView.layer.cornerRadius = 25
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        headerView.layer.masksToBounds = true
        headerView.layoutMargins = UIEdgeInsets(top: 50, left: 5, bottom: 15, right: 20)
        return headerView
    }()
    
    lazy var homeTeamImage: UIImageView = {
        let homeTeamImage = UIImageView()
        homeTeamImage.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImage.contentMode = .scaleAspectFit
        return homeTeamImage
    }()
    
    lazy var reportLabel: UILabel = {
        let reportLabel = UILabel()
        reportLabel.translatesAutoresizingMaskIntoConstraints = false
        reportLabel.text = "Referat"
        reportLabel.textColor = .systemRed
        reportLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return reportLabel
    }()
    
    lazy var awayTeamImage: UIImageView = {
        let awayTeamImage = UIImageView()
        awayTeamImage.translatesAutoresizingMaskIntoConstraints = false
        
        awayTeamImage.contentMode = .scaleAspectFit
        return awayTeamImage
    }()
    
    lazy var homeTeamScore: UILabel = {
        let homeTemaScore = UILabel()
        
        homeTemaScore.textAlignment = .center
        homeTemaScore.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return homeTemaScore
    }()
    
    lazy var awayTeamScore: UILabel = {
        let awayTemaScore = UILabel()
        
        awayTemaScore.textAlignment = .center
        awayTemaScore.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return awayTemaScore
    }()
    
    lazy var scoreDivider: UILabel = {
        let scoreDivider = UILabel()
        scoreDivider.text = ":"
        scoreDivider.textAlignment = .center
        scoreDivider.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return scoreDivider
    }()
    
    lazy var scoreStackView: UIStackView = {
        let scoreStackView = UIStackView(arrangedSubviews: [homeTeamScore,scoreDivider,awayTeamScore])
        scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        scoreStackView.alignment = .center
        scoreStackView.axis = .horizontal
        scoreStackView.distribution = .fillEqually
        return scoreStackView
    }()
    
    lazy var placeLabel: UILabel = {
        let placeLabel = UILabel()
        placeLabel.textAlignment = .right
        placeLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return placeLabel
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.textAlignment = .right
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return dateLabel
    }()
    
    lazy var dateAndPlaceStackView: UIStackView = {
        let dateAndPlaceStackView = UIStackView(arrangedSubviews: [dateLabel, placeLabel])
        dateAndPlaceStackView.translatesAutoresizingMaskIntoConstraints = false
        dateAndPlaceStackView.axis = .vertical
        return dateAndPlaceStackView
    }()
    
    lazy var mainTextView: UIView = {
        let mainTextView = UIView()
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.backgroundColor = UIColor(red:0.87, green:0.88, blue:0.92, alpha:1.0)
        mainTextView.layoutMargins = UIEdgeInsets(top: 40, left: 15, bottom:0, right: 15)
        return mainTextView
    }()
    
    lazy var mainTextViewTopicLabel: UILabel = {
        let mainTextViewTopicLabel = UILabel()
        mainTextViewTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTextViewTopicLabel.numberOfLines = 0
        mainTextViewTopicLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return mainTextViewTopicLabel
    }()
    
    lazy var mainTextViewContentLabel: UILabel = {
        let mainTextViewContentLabel = UILabel()
        mainTextViewContentLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTextViewContentLabel.numberOfLines = 0
        mainTextViewContentLabel.font = UIFont.systemFont(ofSize: 14)
        return mainTextViewContentLabel
    }()
    
    func setupView() {
        addSubview(scrollView)
        contentView.addSubview(mainTextView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        contentView.addSubview(imageView)
        headerView.addSubview(homeTeamImage)
        headerView.addSubview(scoreStackView)
        headerView.addSubview(awayTeamImage)
        headerView.addSubview(reportLabel)
        headerView.addSubview(dateAndPlaceStackView)
        mainTextView.addSubview(mainTextViewTopicLabel)
        mainTextView.addSubview(mainTextViewContentLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.66)
            // heightAnchor.constraint(equalToConstant: 450)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -25),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            mainTextView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -25),
            mainTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            homeTeamImage.leadingAnchor.constraint(equalTo: headerView.layoutMarginsGuide.leadingAnchor),
            homeTeamImage.bottomAnchor.constraint(equalTo: headerView.layoutMarginsGuide.bottomAnchor),
            homeTeamImage.heightAnchor.constraint(equalToConstant: 50),
            homeTeamImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            scoreStackView.leadingAnchor.constraint(equalTo: homeTeamImage.trailingAnchor),
            scoreStackView.topAnchor.constraint(equalTo: homeTeamImage.topAnchor),
            scoreStackView.bottomAnchor.constraint(equalTo: homeTeamImage.bottomAnchor),
            scoreStackView.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            awayTeamImage.leadingAnchor.constraint(equalTo: scoreStackView.trailingAnchor),
            awayTeamImage.bottomAnchor.constraint(equalTo: homeTeamImage.bottomAnchor),
            awayTeamImage.widthAnchor.constraint(equalToConstant: 50),
            awayTeamImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            reportLabel.leadingAnchor.constraint(equalTo: headerView.layoutMarginsGuide.leadingAnchor, constant: 5),
            reportLabel.topAnchor.constraint(equalTo: headerView.layoutMarginsGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainTextViewTopicLabel.topAnchor.constraint(equalTo: mainTextView.layoutMarginsGuide.topAnchor),
            mainTextViewTopicLabel.leadingAnchor.constraint(equalTo: mainTextView.layoutMarginsGuide.leadingAnchor),
            mainTextViewTopicLabel.trailingAnchor.constraint(equalTo: mainTextView.layoutMarginsGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainTextViewContentLabel.topAnchor.constraint(equalTo: mainTextViewTopicLabel.bottomAnchor, constant: 15),
            mainTextViewContentLabel.leadingAnchor.constraint(equalTo: mainTextView.layoutMarginsGuide.leadingAnchor),
            mainTextViewContentLabel.trailingAnchor.constraint(equalTo: mainTextView.layoutMarginsGuide.trailingAnchor),
            mainTextViewContentLabel.bottomAnchor.constraint(equalTo: mainTextView.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            dateAndPlaceStackView.trailingAnchor.constraint(equalTo: headerView.layoutMarginsGuide.trailingAnchor),
            dateAndPlaceStackView.centerYAnchor.constraint(equalTo: scoreStackView.centerYAnchor)
        ])
    }
    
    func configureView(with report: Report) {
        self.awayTeamImage.image = #imageLiteral(resourceName: "varaibk")
        self.homeTeamImage.image = #imageLiteral(resourceName: "IBKLOGGA")
        self.imageView.image = #imageLiteral(resourceName: "alexlin730")
        self.homeTeamScore.text = "\(report.game!.score.homeGoals)"
        self.awayTeamScore.text = "\(report.game!.score.awayGoals)"
        self.mainTextViewTopicLabel.text = report.title
        self.mainTextViewContentLabel.text = report.content
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "E, MMM d, yyyy"
        let stringDate = dateFormater.string(from: report.game!.date)
        self.dateLabel.text = stringDate
        self.placeLabel.text = report.game!.location
        
    }
}
