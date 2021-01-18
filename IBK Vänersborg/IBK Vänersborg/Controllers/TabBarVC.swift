//
//  TabBarVC.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-01-30.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        let playerVC = PlayerVC(collectionViewLayout: layout)
        let matchesVC = MatchesVC()
        let newsVC = NewsVC()
        //let feedVC = FeedVC()
        //feedVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        newsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        matchesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        playerVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        let tabBarList = [newsVC, playerVC, matchesVC]
        viewControllers = tabBarList.map {
        UINavigationController(rootViewController: $0)
        }
    }

}
