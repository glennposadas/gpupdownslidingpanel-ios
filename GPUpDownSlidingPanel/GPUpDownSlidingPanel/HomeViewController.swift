//
//  HomeViewController.swift
//  GPUpDownSlidingPanel
//
//  Created by Glenn Posadas on 03/03/2018.
//  Copyright © 2018 GPosadas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var switch_PanelToggle: UISwitch = {
        let toggler = UISwitch()
        toggler.isOn = false
        toggler.addTarget(self, action: #selector(self.togglePanel(_:)), for: .valueChanged)
        return toggler
    }()
    
    // MARK: - Functions
    
    @objc func togglePanel(_ sender: UISwitch) {
        print("toggle panel")
    }
    
    // MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.switch_PanelToggle)
        self.switch_PanelToggle.translatesAutoresizingMaskIntoConstraints = false
        
        self.switch_PanelToggle.heightAnchor.constraint(equalToConstant: 100.0)
        self.switch_PanelToggle.widthAnchor.constraint(equalToConstant: 100.0)
        self.switch_PanelToggle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.switch_PanelToggle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

