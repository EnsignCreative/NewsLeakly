//
//  Colors.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    public class var mainColor: UIColor {
        return UIColor(named: "BaseColor") ?? .black
    }
    
    public class var secondaryColor: UIColor {
        return UIColor(named: "SecondaryBaseColor") ?? UIColor(r: 30, g: 30, b: 30)
    }
    
    public class var buttonColor: UIColor {
        return UIColor(named: "ButtonColor") ?? .systemBlue
    }
    
    public class var borderColor: UIColor {
        return UIColor(named: "BorderColor") ?? .black
    }
    
    public class var titleColor: UIColor {
        return UIColor(named: "TitleColor") ?? .white
    }
    
    public class var descColor: UIColor {
        return UIColor(named: "SecondaryTextColor") ?? .lightGray
    }
}
