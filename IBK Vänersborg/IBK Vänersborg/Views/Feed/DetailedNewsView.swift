//
//  DetailedNewsView.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-09.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class DetailedNewsView: UIView {

    required init?(coder: NSCoder) {
        fatalError("oh no")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    lazy var scrollView: UIScrollView = {
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
        imageView.image = #imageLiteral(resourceName: "alexlin730")
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
        
        return headerView
    }()
    
    lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        headerLabel.numberOfLines = 0
        return headerLabel
    }()
    
    lazy var reportLabel: UILabel = {
        let reportLabel = UILabel()
        reportLabel.translatesAutoresizingMaskIntoConstraints = false
        reportLabel.textColor = .systemRed
        reportLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return reportLabel
    }()
    
    lazy var mainTextView: UIView = {
        let mainTextView = UIView()
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.backgroundColor = UIColor(red:0.87, green:0.88, blue:0.92, alpha:1.0)
        return mainTextView
    }()
    
    lazy var mainTextLabel: UILabel = {
        let mainTextLabel = UILabel()
        mainTextLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTextLabel.numberOfLines = 0
        return mainTextLabel
    }()
    
    func setupView() {
        addSubview(scrollView)
        contentView.addSubview(mainTextView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        contentView.addSubview(imageView)
        headerView.addSubview(headerLabel)
        headerView.addSubview(reportLabel)
        mainTextView.addSubview(mainTextLabel)
        
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
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -25),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
          //  headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            mainTextView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -25),
            mainTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            reportLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            reportLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            reportLabel.bottomAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            mainTextLabel.topAnchor.constraint(equalTo: mainTextView.topAnchor, constant: 50),
            mainTextLabel.leadingAnchor.constraint(equalTo: mainTextView.leadingAnchor, constant: 5),
            mainTextLabel.trailingAnchor.constraint(equalTo: mainTextView.trailingAnchor, constant: 5),
            mainTextLabel.bottomAnchor.constraint(equalTo: mainTextView.bottomAnchor, constant: -100)
        ])
    }
    
    func configureView(with report: Report) {
        imageView.image = #imageLiteral(resourceName: "alexlin730")
        headerLabel.text = report.title
        reportLabel.text = "Nyhet"
        mainTextLabel.text = report.content
    }
}
