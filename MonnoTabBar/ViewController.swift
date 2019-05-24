//
//  ViewController.swift
//  MonnoTabBar
//
//  Created by Lito Arias on 22/05/2019.
//  Copyright © 2019 MonnoApps. All rights reserved.
//

import UIKit
import MonnoTabBarMenu

class ViewController: UIViewController {
    
    var tabbar: TabBar!
    var favorites = TabItem(image: UIImage(named: "home")!)
    var home = TabItem(image: UIImage(named: "home")!)
    var categories = TabItem(image: UIImage(named: "home")!)
    
    var selectedIndex: Int = 1
    lazy var previousIndex = self.selectedIndex
    
    var container: UIView!
    var viewControllers: [UIViewController]!
    
    var homeViewController = UIViewController()
    var searchViewController = UIViewController()
    var accountViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        homeViewController.view.backgroundColor = .red
//        searchViewController.view.backgroundColor = .brown
//        accountViewController.view.backgroundColor = .purple
        
        self.viewControllers = [homeViewController, searchViewController, accountViewController]
        
        tabbar = TabBar(tabs: [favorites, home, categories], defaultSelection: selectedIndex)
        tabbar.backgroundColor = .white
        tabbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabbar)
        tabbar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabbar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tabbar.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .green
        view.addSubview(container)
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        container.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: tabbar.topAnchor, constant: 0).isActive = true
        
        view.sendSubviewToBack(container)
        
        
        tabbar.selectedItem = { item in
            self.previousIndex = self.selectedIndex
            self.selectedIndex = item
            
            let previousVC = self.viewControllers[self.previousIndex]
            previousVC.willMove(toParent: nil)
            previousVC.view.removeFromSuperview()
            previousVC.removeFromParent()
            let child = self.viewControllers[self.selectedIndex]
            self.addChild(child)
            child.view.frame = self.container.frame
            self.view.addSubview(child.view)
            child.didMove(toParent: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let child = viewControllers[selectedIndex]
        addChild(child)
        child.view.frame = container.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tabbar.dropShadow(color: .lightGray, opacity: 0.4, offSet: CGSize(width: -1, height: -5), radius: 3, scale: true)
    }
    
}

