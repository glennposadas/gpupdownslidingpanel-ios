//
//  RootContainerController.swift
//  KJVAudioBible
//
//  Created by Glenn Posadas on 22/02/2018.
//  Copyright © 2018 WatchDis App. All rights reserved.
//

import UIKit

class RootContainerController: UIViewController {
    
    // MARK: - Properties
    
    var panelVC = PanelViewController()
    
    var isHidden: Bool = true
    var panelViewTopConstraint: NSLayoutConstraint!
    var tabBarBottomConstraint: NSLayoutConstraint!
    var originalPanelPosition: CGFloat = 0
    var lastPoint: CGPoint = .zero
    
    lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let gr = UIPanGestureRecognizer(target: self, action: #selector(self.panGesture(gestureRecognizer:)))
        self.panelVC.view.addGestureRecognizer(gr)
        return gr
    }()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Add the child controller
        
        let tabBarController = TabBarViewController()
        
        self.addChildViewController(tabBarController)
        self.view.addSubview(tabBarController.view)
        
        (tabBarController.viewControllers?.first! as! HomeViewController).rootContainer = self
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Make bottom anchor constant equals to -50 if you want to see tabbarcontroller go up.
        tabBarController.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tabBarController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tabBarController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tabBarBottomConstraint = tabBarController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        self.tabBarBottomConstraint.isActive = true
        
        // Add the panel as child controller
        
        self.panelVC.rootContainerReference = self
        self.addChildViewController(panelVC)
        self.view.addSubview(panelVC.view)
        
        panelVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.panelViewTopConstraint = panelVC.view.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        self.panelViewTopConstraint.isActive = true
        panelVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        panelVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        panelVC.view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1, constant: 100).isActive = true
        
        
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
        
        // --- More setup
        
        _ = panGestureRecognizer // lazily init.
        originalPanelPosition = panelViewTopConstraint.constant
    }
    
    @objc func panGesture(gestureRecognizer: UIPanGestureRecognizer) {
        let point = gestureRecognizer.location(in: self.view)
        let screenHeight = self.view.bounds.height
        let centerRatio = (-panelViewTopConstraint.constant + originalPanelPosition) / (screenHeight + originalPanelPosition)
        switch gestureRecognizer.state {
        case .changed:
            print("🌈CHANGED: yDelta: \(point.y - lastPoint.y)")
            let yDelta = point.y - lastPoint.y
            var newConstant = panelViewTopConstraint.constant + yDelta
            newConstant = newConstant > originalPanelPosition ? originalPanelPosition : newConstant
            newConstant = newConstant < -screenHeight ? -screenHeight : newConstant
            panelViewTopConstraint.constant = newConstant
        case .ended:
            let newPanelTopConstraint = (centerRatio < 0.5 ? self.originalPanelPosition : -screenHeight)
            print("✅ENDED.. Constraint constant:: \(newPanelTopConstraint == 0 ? -110 : newPanelTopConstraint)")
            self.panelViewTopConstraint.constant = newPanelTopConstraint == 0 ? -110 : newPanelTopConstraint
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [.curveEaseInOut], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        default:
            break
        }
        lastPoint = point
    }
}





