//
//  Tab.swift
//  MonnoTabBarMenu
//
//  Created by Lito Arias on 22/05/2019.
//  Copyright © 2019 MonnoApps. All rights reserved.
//

import UIKit

public class TabItem: UIButton {
    
    var action: (UIButton) -> Void = { _ in }
    private var image: UIImage!
    private var title: String!
    private var fontSize: CGFloat = 8

    
    override public var isSelected: Bool {
        willSet(newValue) {
            super.isSelected = newValue;
            self.transition()
        }
    }
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
//        configure()
    }
    
    convenience public init(image: UIImage, title: String, fontSize: CGFloat) {
        self.init()
        self.image = image
        self.title = title
        self.fontSize = fontSize
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        transition()
    }
    
    func configure() {
        setTitle("", for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize * (UIScreen.main.bounds.size.width / 320), weight: UIFont.Weight(rawValue: 20))
        addTarget(self, action: #selector(action(_:)), for: .touchUpInside)
        layer.cornerRadius = 20
    }
    
    @objc func action(_ sender: UIButton) {
        action(sender)
    }
    
    private func transition() {
        self.alpha = 0.25
        UIView.transition(with: self, duration: 0.25, options: .curveEaseInOut, animations: {
            if self.isSelected {
                self.selectedStyle(image: self.image!)
            } else {
                self.unselectedStyle(image: self.image!)
            }
            self.alpha = 0.75
        }) { (completion) in
            if completion {
                UIView.transition(with: self, duration: 0.25, options: .curveEaseInOut, animations: {
                    if self.isSelected {
                        self.setTitle(self.title, for: .selected)
                    } else {
                        self.setTitle("", for: .selected)
                    }
                    self.alpha = 1.0
                }, completion: nil)
            }
        }
    }
}
