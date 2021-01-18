//
//  DetaildPlayerViewExp.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-03.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit
import SnapKit

class DetaildPlayerViewExp: UIView {

    required init?(coder: NSCoder) {
        fatalError("Nope")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    lazy var outerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
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
        imageView.image = #imageLiteral(resourceName: "Sandin")
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var infoStackView: UIStackView = {
        let infoStackView = UIStackView(arrangedSubviews: [ageStackView, firstSepartor, positionStackView, secondSepartor, fattningStackView])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.axis = .horizontal
        infoStackView.distribution = .fillProportionally
        infoStackView.alignment = .fill
        infoStackView.spacing = 35
        
        return infoStackView
    }()
    
    lazy var firstSepartor: UIView = {
        let separator = UIView()
        separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = .black
        return separator
    }()
    
    lazy var secondSepartor: UIView = {
        let separator = UIView()
        separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = .black
        return separator
    }()
    
    lazy var ageStackView: UIStackView = {
        let ageStackView = UIStackView(arrangedSubviews: [ageStaticLabel, ageDynamicLabel])
        ageStackView.axis = .vertical
        return ageStackView
    }()
    
    lazy var ageStaticLabel: UILabel = {
        let ageStaticLabel = UILabel()
        ageStaticLabel.text = "Ålder"
        ageStaticLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        ageStaticLabel.textColor = .secondaryLabel
        return ageStaticLabel
    }()
    
    lazy var ageDynamicLabel: UILabel = {
        let ageDynamicLabel = UILabel()
        ageDynamicLabel.text = "22 år"
        ageDynamicLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return ageDynamicLabel
    }()
    
    lazy var positionStackView: UIStackView = {
        let positionStackView = UIStackView(arrangedSubviews: [positionStaticLabel, positionDynamicLabel])
        positionStackView.axis = .vertical
        return positionStackView
    }()
    
    lazy var positionStaticLabel: UILabel = {
        let positionStaticLabel = UILabel()
        positionStaticLabel.text = "Position"
        positionStaticLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        positionStaticLabel.textColor = .secondaryLabel
        return positionStaticLabel
    }()
    
    lazy var positionDynamicLabel: UILabel = {
        let positionDynamicLabel = UILabel()
        positionDynamicLabel.text = "Back"
        positionDynamicLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return positionDynamicLabel
    }()
    
    lazy var fattningStackView: UIStackView = {
        let fattningStackView = UIStackView(arrangedSubviews: [fattningStaticLabel, fattningDynamicLabel])
        fattningStackView.axis = .vertical
        return fattningStackView
    }()
    
    lazy var fattningStaticLabel: UILabel = {
        let fattningStaticLabel = UILabel()
        fattningStaticLabel.text = "Klubbfattning"
        fattningStaticLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        fattningStaticLabel.textColor = .secondaryLabel
        return fattningStaticLabel
    }()
    
    lazy var fattningDynamicLabel: UILabel = {
        let fattningDynamicLabel = UILabel()
        fattningDynamicLabel.text = "Vänster"
        fattningDynamicLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return fattningDynamicLabel
    }()
    
    lazy var infoView: UIScrollView = {
        let infoView = UIScrollView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        //self.infoView.layoutMargins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        infoView.layer.cornerRadius = 20
        infoView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        infoView.backgroundColor = .white
        return infoView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    
    lazy var pageView: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    lazy var goalLabel: StatsButton = {
        let goalLabel = StatsButton()
        
        goalLabel.clipsToBounds = true
        goalLabel.layer.cornerRadius = 10
        return goalLabel
    }()
    
    
    lazy var assistLabel: StatsButton = {
        let assistLabel = StatsButton()
        
        assistLabel.clipsToBounds = true
        assistLabel.layer.cornerRadius = 10
        return assistLabel
    }()
    
    lazy var gamesLabel: StatsButton = {
        let gamesLabel = StatsButton()
        
        gamesLabel.clipsToBounds = true
        gamesLabel.layer.cornerRadius = 10
        return gamesLabel
    }()
    
    
    lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView(arrangedSubviews: [gamesLabel, goalLabel, assistLabel])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
//        buttonStackView.setCustomSpacing(10, after: gamesLabel)
//        buttonStackView.setCustomSpacing(10, after: goalLabel)
        return buttonStackView
    }()
   
    func setupView() {
        
        addSubview(outerScrollView)
        outerScrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(infoView)
        infoView.addSubview(nameLabel)
        infoView.addSubview(buttonStackView)
        infoView.addSubview(pageView)
        infoView.addSubview(infoStackView)
        
        NSLayoutConstraint.activate([
            outerScrollView.topAnchor.constraint(equalTo: topAnchor),
            outerScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            outerScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            outerScrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: outerScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: outerScrollView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.66)
        ])
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            infoView.heightAnchor.constraint(equalTo: outerScrollView.safeAreaLayoutGuide.heightAnchor)

        ])
        
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 10),
            pageView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: pageView.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: 20),
            infoStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            //firstSepartor.heightAnchor.constraint(equalTo: infoStackView.heightAnchor, multiplier: 0.4)
            
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: 10),
            buttonStackView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 80),
            buttonStackView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor)
        ])

    }
}
