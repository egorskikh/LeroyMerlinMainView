//
//  TabViewController.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        tabBar.backgroundColor = .white
        tabBar.tintColor = .green
    }

    func setupTabBar() {
        let mainScreen = LeroyMerlinVC()
        viewControllers = [ TabBarVC.generateNavigationController(rootVC: mainScreen,
                                                                  title: TitleTabBar.main,
                                                                  systemImage: "magnifyingglass")
                                                                  
        ]
    }

}


