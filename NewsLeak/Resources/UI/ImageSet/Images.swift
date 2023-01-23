//
//  Images.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit

extension UIImage {
    public class var darkMode: UIImage {
        return UIImage(systemName: "moon.circle.fill") ?? UIImage()
    }
    
    public class var lightMode: UIImage {
        return UIImage(systemName: "moon.circle") ?? UIImage()
    }
    
    public class var search: UIImage {
        return UIImage(systemName: "magnifyingglass") ?? UIImage()
    }
    
    public class var menu: UIImage {
        return UIImage(systemName: "line.horizontal.3.decrease") ?? UIImage()
    }
}



enum ImageStyle {
    case border
    case borderless
}

class Image: UIImageView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(style: ImageStyle, radius: Int = 0) {
        super.init(frame: .zero)
        backgroundColor = .clear
        
        switch style {
        
        case .border:
            contentMode = .scaleAspectFill
            layer.borderWidth = 0.5
            layer.cornerRadius = CGFloat(radius)
            layer.borderColor = UIColor.borderColor.cgColor
            layer.masksToBounds = true
            isUserInteractionEnabled = true
            
        case .borderless:
            contentMode = .scaleAspectFill
            isUserInteractionEnabled = false
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

