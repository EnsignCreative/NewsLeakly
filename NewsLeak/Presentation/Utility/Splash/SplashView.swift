//
//  SplashView.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/17/22.
//

import UIKit
//import AVKit

class SplashView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubViews()
        setConstraints()
    }

    let logoImage: Image = {
        let image = Image(style: .borderless)
        image.image = UIImage(imageLiteralResourceName: "AppName")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    private func addSubViews() {
//        addSubview(logoImage)
    }
    
    private func setConstraints() {
//        logoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        logoImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        logoImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
//        logoImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
//
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

