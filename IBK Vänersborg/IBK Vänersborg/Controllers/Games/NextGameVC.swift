//
//  NextGameVC.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-03-05.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class NextGameVC: UIViewController {
    let nextGameView = NextGameView()
    let players = Bundle.main.decode([Player].self, from: "player.json")
    let awayTeam = Bundle.main.decode([Player].self, from: "awayplayer.json")
    
    override func loadView() {
        view = nextGameView
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextGameView.troopsTableView.delegate = self
        nextGameView.troopsTableView.dataSource = self
        nextGameView.delegate = self
        
        nextGameView.troopsTableView.register(PlayerCell.self, forCellReuseIdentifier: "cell")
        
    }

    var selectedSegmentIndex = 0
    
    
}

extension NextGameVC: UITableViewDelegate, UITableViewDataSource, NextGameDelegate {
    
    
    
    func pUpdated(withValut: Int) {
        
        selectedSegmentIndex = withValut
        print(selectedSegmentIndex)
        nextGameView.troopsTableView.scroll(to: .top, animated: false)
        nextGameView.troopsTableView.reloadData()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedSegmentIndex {
        case 0:
            return players.count
        default:
            return awayTeam.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nextGameView.troopsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCell
       
        switch selectedSegmentIndex {
        case 0:
            cell.player = players[indexPath.row]
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        default:
            cell.player = awayTeam[indexPath.row]
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch selectedSegmentIndex {
        case 0:
            let detailedPlayerVC = DetaildPlaterVCExp()
            detailedPlayerVC.player = players[indexPath.row]
            navigationController?.pushViewController(detailedPlayerVC, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
