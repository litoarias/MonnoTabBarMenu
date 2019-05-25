//
//  UIButton+Icon.swift
//  MonnoTabBarMenu
//
//  Created by Lito Arias on 22/05/2019.
//  Copyright © 2019 MonnoApps. All rights reserved.
//

extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .selected)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: image.size.width / 2)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func centeredImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: image.size.width / 2.8, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func selectedStyle(image: UIImage) {
        self.backgroundColor = UIColor(red: 0.224, green: 0.549, blue: 0.984, alpha: 1.00)
        self.setTitleColor(.white, for: .normal)
        self.leftImage(image: image, renderMode: .alwaysTemplate)
        self.imageView?.tintColor = .white
    }
    
    func unselectedStyle(image: UIImage) {
        self.setTitleColor(UIColor(red: 0.224, green: 0.549, blue: 0.984, alpha: 1.00), for: .normal)
        self.backgroundColor = .white
        self.centeredImage(image: image, renderMode: .alwaysTemplate)
        self.imageView?.tintColor =  UIColor(red: 0.224, green: 0.549, blue: 0.984, alpha: 1.00)
    }
}
