//
//  TabBar.swift
//  MonnoTabBarMenu
//
//  Created by Lito Arias on 22/05/2019.
//  Copyright © 2019 MonnoApps. All rights reserved.
//

import UIKit

public class TabBar: UIView {
    
    private var stackView: UIStackView!
    private var tabs: [TabItem] = [TabItem]()
    private var defaultSelection: Int = 1
    public var selectedItem: (Int) -> Void = { _ in }
    
    convenience public init(tabs: [TabItem], defaultSelection: Int) {
        self.init()
        self.tabs = tabs
        self.defaultSelection = defaultSelection
        self.configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        stackView = UIStackView(arrangedSubviews: self.tabs)
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        self.tabs.forEach{ $0.isSelected = false }
        self.tabs[defaultSelection].isSelected = true
        _ = self.tabs.enumerated().map { (tag, item) in
            return item.tag = tag
        }
        _ = self.tabs.map {
            $0.action = {
                self.selectedItem($0.tag)
                self.newSelection(tagSelected: $0.tag)
            }
        }
        
        
    }
    
    func newSelection(tagSelected: Int) {
        _ = self.tabs.map { item in
            if item.tag == tagSelected {
                item.isSelected = true
            } else {
                item.isSelected = false
            }
        }
    }
}
