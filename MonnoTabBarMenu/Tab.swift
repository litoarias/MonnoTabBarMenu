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
    var image: UIImage!
    
    override public var isSelected: Bool {
        willSet(newValue) {
            super.isSelected = newValue;
            self.transition()
        }
    }
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        configure()
    }
    
    convenience public init(image: UIImage) {
        self.init()
        self.image = image
    }
    
    convenience init() {
        self.init(frame:.zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
    }
    
    func configure() {
        setTitle("", for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        titleLabel?.font = UIFont.systemFont(ofSize: 8 * (UIScreen.main.bounds.size.width / 320), weight: UIFont.Weight(rawValue: 20))
        addTarget(self, action: #selector(action(_:)), for: .touchUpInside)
    }
    
    @objc func action(_ sender: UIButton) {
        action(sender)
    }
    
    private func transition() {
        self.alpha = 0.5
        UIView.animate(withDuration: 0.275, animations: {
            if self.isSelected {
                self.selectedStyle(image: self.image!)
            } else {
                self.unselectedStyle(image: self.image!)
            }
            self.alpha = 0.75
        }) { (completion) in
            UIView.animate(withDuration: 0.125) {
                if self.isSelected {
                    self.setTitle("Categorías", for: .selected)
                } else {
                    self.setTitle("", for: .selected)
                }
                self.alpha = 1.0
            }
        }
    }
}