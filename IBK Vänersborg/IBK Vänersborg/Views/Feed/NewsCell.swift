//
//  NewsCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-12.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseIdentifier: String = "NewsCell"
    
    func configure(with report: Report) {
        titleLabel.text = report.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("nope")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(secondContentView)
        secondContentView.addSubview(cellTypeLabel)
        secondContentView.addSubview(titleLabel)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            secondContentView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            secondContentView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            secondContentView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            secondContentView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.33),
            
            cellTypeLabel.leadingAnchor.constraint(equalTo: secondContentView.leadingAnchor, constant: 10),
            cellTypeLabel.topAnchor.constraint(equalTo: secondContentView.topAnchor, constant: 10),
            
            titleLabel.leadingAnchor.constraint(equalTo: cellTypeLabel.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: secondContentView.bottomAnchor, constant: -10),
            titleLabel.widthAnchor.constraint(equalTo: secondContentView.widthAnchor, multiplier: 0.9)
        ])
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "joel")
        return imageView
    }()
    
    lazy var secondContentView: UIView = {
        let secondContentView = UIView()
        secondContentView.translatesAutoresizingMaskIntoConstraints = false
        secondContentView.backgroundColor = .secondarySystemBackground
        secondContentView.alpha = 0.95
        return secondContentView
    }()
    
    lazy var cellTypeLabel: UILabel = {
        let cellTypeLabel = UILabel()
        cellTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTypeLabel.text = "Nyhet"
        cellTypeLabel.textColor = .systemRed
        cellTypeLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return cellTypeLabel
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.numberOfLines = 3
        return titleLabel
    }()
    
}
