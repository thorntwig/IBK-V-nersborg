//
//  DetaildPlaterVCExp.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-03.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class DetaildPlaterVCExp: UIViewController {
    
    var player: Player?
    let detailed = DetaildPlayerViewExp()
    
    override func loadView() {
        view = detailed
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setupLabels() {
        guard let jerseyNumber = player?.jerseyNumber,
              let lastName = player?.lastName,
              let firstName = player?.firstName
            
        else { return }
        guard let player = player else {
            return
        }
        detailed.nameLabel.text = "\(jerseyNumber). " + firstName + " " + lastName
        detailed.gamesLabel.setupButton(for: player, typeOfStat: .games)
        detailed.goalLabel.setupButton(for: player, typeOfStat: .goal)
        detailed.assistLabel.setupButton(for: player, typeOfStat: .assist)
    }
}
