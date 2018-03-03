//
//  TabBarViewController.swift
//  GPUpDownSlidingPanel
//
//  Created by Glenn Posadas on 04/03/2018.
//  Copyright © 2018 GPosadas. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        self.viewControllers = [homeViewController]
    }
}
