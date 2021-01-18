//
//  NewsFeedCell.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-08.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class LatestNewsCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseIdentifier: String = "LatestNewsCell"
    
    func configure(with report: Report) {
        self.imageView.image = #imageLiteral(resourceName: "alexlin730")
        self.titleLabel.text = report.title
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("no no no")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        setupCell()
        
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.shadowColor = .lightGray
        
        return titleLabel
    }()
    
    func setupCell() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor, constant: -20)
        ])
    }
    
}
