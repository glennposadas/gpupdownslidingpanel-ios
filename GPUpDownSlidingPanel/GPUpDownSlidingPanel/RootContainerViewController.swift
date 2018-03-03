//
//  RootContainerController.swift
//  KJVAudioBible
//
//  Created by Glenn Posadas on 22/02/2018.
//  Copyright © 2018 WatchDis App. All rights reserved.
//

import UIKit

class RootContainerController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Add the panel as child controller
        
        let panelVC = PanelViewController()
        self.addChildViewController(panelVC)
        self.view.addSubview(panelVC.view)
        
        panelVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        panelVC.view.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -110.0).isActive = true
        panelVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        panelVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        panelVC.view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1, constant: 100).isActive = true
        
        // Add the child controller
        
        let tabBarController = TabBarViewController()
        
        self.addChildViewController(tabBarController)
        self.view.addSubview(tabBarController.view)
        
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Make bottom anchor constant equals to -50 if you want to see tabbarcontroller go up.
        tabBarController.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tabBarController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tabBarController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tabBarController.view.bottomAnchor.constraint(equalTo: panelVC.view.topAnchor).isActive = true
        
        // Add the adcontainer

        let adContainer = UIView()
        adContainer.backgroundColor = .darkGray
        adContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(adContainer)
        
        //let bottomConstant: CGFloat = 0
        
        adContainer.heightAnchor.constraint(equalToConstant: 55.0).isActive = true
        
        if #available(iOS 11.0, *) {
            adContainer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            adContainer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            adContainer.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            adContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            adContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            adContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }

        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "AD BANNER HERE"
        adContainer.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: adContainer.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: adContainer.centerYAnchor).isActive = true
    }
    
}





