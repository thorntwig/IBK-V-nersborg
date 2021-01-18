//
//  MatchesVC.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-05.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

protocol MatchesVCDeleget: class {
    func updateTimeToEvent(timeString: String)
}

class MatchesVC: UIViewController {
    
    weak var timerDeleget: MatchesVCDeleget?
    
    var timer = Timer()
    var games: [Game]?
    var eventDate: Date?
    
    override func viewWillAppear(_ animated: Bool) {
//        if let upCommingDate = games?[0].date {
//            eventDate = upCommingDate
//        }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            let userCalander = Calendar.current
            let jDate = Date()
            let components = userCalander.dateComponents([.hour, .minute, .year, .day, .second], from: jDate)
            let currentDate = userCalander.date(from: components)!
            
            //guard let eventDate = self.eventDate else { return }
            let isoDate = "2020-03-26T19:00:00Z"
            let dateFormatter = ISO8601DateFormatter()
            self.eventDate = dateFormatter.date(from: isoDate)
            let eventDateComponents = userCalander.dateComponents([.hour, .minute, .year, .day, .second], from: self.eventDate!)
            let eventdate = userCalander.date(from: eventDateComponents)!
            
            let timeLeft = userCalander.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventdate)
            
            self.timerDeleget?.updateTimeToEvent(timeString: "\(timeLeft.day ?? 00)d \(timeLeft.hour ?? 00)h \(timeLeft.minute ?? 00)m \(timeLeft.second ?? 00)s")
            
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Matcher" 
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCV()
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(NextGameCell.self, forCellWithReuseIdentifier: "nextCell")
        cv.register(UpcomingGameCell.self, forCellWithReuseIdentifier: "upcommingCell")
        cv.register(PlayedGamesCell.self, forCellWithReuseIdentifier: "playedGamesCell")
        
        return cv
    }()
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    func setupCV() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension MatchesVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: self.view.frame.width, height: 200.0)
        case 1:
            return CGSize(width: self.view.frame.width - 10, height: 150.0)
        case 2:
            return CGSize(width: self.view.frame.width - 10, height: 100.0)
        default:
            return CGSize(width: self.view.frame.width, height: 200.0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets()
        default:
            return UIEdgeInsets(top: 10.0, left: 1.0, bottom: 1.0, right: 1.0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 1
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nextCell", for: indexPath) as! NextGameCell
            self.timerDeleget = cell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcommingCell", for: indexPath) as! UpcomingGameCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playedGamesCell", for: indexPath) as! PlayedGamesCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            let vc = NextGameVC()
            vc.modalPresentationStyle = .popover
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("ops")
        }
        
    }
}
