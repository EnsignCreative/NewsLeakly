//
//  ControllerEXT.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit

extension UIViewController {
    func setLogoForNavigationTitle() {
        guard let navWidth = navigationController?.navigationBar.frame.size.width else { return }
        
        let logoContainer = UIView(frame: CGRect(x: (navWidth / 2) - 75, y: 0, width: 100, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(imageLiteralResourceName: "AppName")
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationItem.hidesBackButton = true
    }
}

