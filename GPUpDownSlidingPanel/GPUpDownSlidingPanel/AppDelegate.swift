//
//  AppDelegate.swift
//  GPUpDownSlidingPanel
//
//  Created by Glenn Posadas on 03/03/2018.
//  Copyright © 2018 GPosadas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        let rootContainer = RootContainerController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootContainer
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

