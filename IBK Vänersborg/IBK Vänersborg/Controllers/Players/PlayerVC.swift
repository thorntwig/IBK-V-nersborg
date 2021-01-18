//
//  PlayerVC.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-01-28.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class PlayerVC: UICollectionViewController {
    
    let players   = Bundle.main.decode([Player].self, from: "player.json")
    var keepers   = [Player]()
    var defenders = [Player]()
    var centers   = [Player]()
    var forwards  = [Player]()
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationItem.title = "Spelare"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "left")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "left")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white
        
        collectionView.backgroundColor = UIColor(red:0.87, green:0.88, blue:0.92, alpha:1.0)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PlayerCollectionCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        keepers = players.filter { $0.position == Player.Position.målvakt }
        defenders = players.filter { $0.position == Player.Position.back }
        centers = players.filter { $0.position == Player.Position.center }
        forwards = players.filter { $0.position == Player.Position.forward }

    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PlayerCollectionCell
        
        cell.playerImageView.image = #imageLiteral(resourceName: "Sandin")
        
        cell.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        
        let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .heavy)]
        let attrs2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        var firstName = "janne"
        var lastName = "löken"
        var jerseyNumber = 0
        switch indexPath.section {
        case 0:
            firstName    = keepers[indexPath.row].firstName
            lastName     = keepers[indexPath.row].lastName
            jerseyNumber = keepers[indexPath.row].jerseyNumber
        case 1:
            firstName    = defenders[indexPath.row].firstName
            lastName     = defenders[indexPath.row].lastName
            jerseyNumber = defenders[indexPath.row].jerseyNumber
        case 2:
            firstName    = centers[indexPath.row].firstName
            lastName     = centers[indexPath.row].lastName
            jerseyNumber = centers[indexPath.row].jerseyNumber
        case 3:
            firstName    = forwards[indexPath.row].firstName
            lastName     = forwards[indexPath.row].lastName
            jerseyNumber = forwards[indexPath.row].jerseyNumber
            
        default:
            firstName = "janne"
            lastName = "löken"
            jerseyNumber = 0
        }
        let attributedNameString     = NSMutableAttributedString(string: firstName + " ", attributes: attrs2)
        let attributedLastNameString = NSMutableAttributedString(string: lastName, attributes: attrs)
        attributedNameString.append(attributedLastNameString)
        cell.playerNameLabel.attributedText = attributedNameString
        
        let attrs3           = [NSAttributedString.Key.font: UIFont(name: "AvenirNextCondensed-Heavy", size: 75)]
        let attributedString = NSMutableAttributedString(string: "\(jerseyNumber)", attributes: attrs3 as [NSAttributedString.Key : Any])
        cell.playerNumberLabel.attributedText = attributedString
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedPlayerVC = DetaildPlaterVCExp()
        var player: Player
        switch indexPath.section {
        case 0:
            player = keepers[indexPath.row]
        case 1:
            player = defenders[indexPath.row]
        case 2:
            player = centers[indexPath.row]
        case 3:
            player = forwards[indexPath.row]
        default:
            player = players[Int.random(in: 0..<players.count)]
        }
        detailedPlayerVC.player = player
        detailedPlayerVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailedPlayerVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            switch indexPath.section {
            case 0:
                sectionHeader.label.text = "Målvakt"
            case 1:
                sectionHeader.label.text = "Backar"
            case 2:
                sectionHeader.label.text = "Centrar"
            case 3:
                sectionHeader.label.text = "Forwards"
            default:
                sectionHeader.label.text = "Backar \(indexPath.section)"
            }
            
            return sectionHeader
        
        } else {
             return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

extension PlayerVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 100)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return keepers.count
        } else if section == 1 {
            return defenders.count
        } else if section == 2 {
            return centers.count
        } else if section == 3 {
            return forwards.count
        }
        return 1
    }
}

class PlayerCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        layer.masksToBounds = false
        layer.cornerRadius = 5.0
    }
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let playerNumberLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textAlignment = .left
        //UIFont.systemFont(ofSize: 70, weight: .heavy)
        lable.textColor = UIColor(red:0.81, green:0.25, blue:0.20, alpha:1.0)
        return lable
    }()
    
    let playerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 2

        return label
    }()
    
    func setupViews() {
        addSubview(playerImageView)
        addSubview(playerNumberLabel)
        addSubview(playerNameLabel)
        // Setup ImageView Constraints
        NSLayoutConstraint.activate([
            playerImageView.widthAnchor.constraint(equalToConstant: self.layer.bounds.height * 1.4),
            playerImageView.heightAnchor.constraint(equalToConstant: self.layer.bounds.height),
            playerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            playerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        // Setup playerNumberLabel Constraints
        NSLayoutConstraint.activate([
            playerNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            playerNumberLabel.widthAnchor.constraint(equalToConstant: self.layer.bounds.width / 4),
            playerNumberLabel.heightAnchor.constraint(equalToConstant: self.layer.bounds.height - 20)
        ])
        
        // Setup playerNameLabel Constraints
        NSLayoutConstraint.activate([
            playerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            playerNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            playerNameLabel.trailingAnchor.constraint(equalTo: playerImageView.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SectionHeader: UICollectionReusableView {
     var label: UILabel = {
     let label: UILabel = UILabel()
     label.textColor = .black
     label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
     label.sizeToFit()
     return label
 }()

override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(label)

    label.translatesAutoresizingMaskIntoConstraints = false
    label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
