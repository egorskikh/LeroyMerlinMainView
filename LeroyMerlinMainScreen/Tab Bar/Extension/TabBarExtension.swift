//
//  TabBarExtension.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

extension TabBarVC {
    
    static func generateNavigationController(rootVC: UIViewController,
                                             title: TitleTabBar,
                                             systemImage: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.tabBarItem.title = title.rawValue
        navigationVC.tabBarItem.image = UIImage(systemName: systemImage)
        return navigationVC
    }
}
