//
//  PanelViewController.swift
//  GPUpDownSlidingPanel
//
//  Created by Glenn Posadas on 04/03/2018.
//  Copyright © 2018 GPosadas. All rights reserved.
//

import UIKit

let MAXIMIZE_NOTIFY = "maximizeNotify"
let MINIMIZE_NOTIFY = "minimizeNotify"

class PanelViewController: UIViewController {

    // MARK: - Properties
    
    var isMaximized: Bool = false
    var rootContainerReference: RootContainerController?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        
        let button = UIButton(type: .custom)
        button.setTitle("Toggle Panel Minimized/Maximized", for: .normal)
        button.addTarget(self, action: #selector(self.toggleMinimizedMaximized(_:)), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .black
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    @objc private func toggleMinimizedMaximized(_ sender: UIButton) {
        if self.rootContainerReference!.isHidden { return }
        
        let notificationName = Notification.Name(rawValue: self.isMaximized ? MINIMIZE_NOTIFY : MAXIMIZE_NOTIFY)
        NotificationCenter.default.post(name: notificationName, object: nil)
        
        UIView.animate(withDuration: 0.3) {
            // OR try to adjust by calling the RootContainer.
            let height = self.isMaximized ? -110.0 : -(self.view.bounds.height - 100.0)
            self.rootContainerReference?.panelViewTopConstraint.constant = height
            self.isMaximized = !self.isMaximized
            self.rootContainerReference?.view.layoutIfNeeded()
        }
    }
}
