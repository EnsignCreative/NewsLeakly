//
//  NavController.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//


import UIKit

class NavigationController: UINavigationController {
    
    var darkMode: Bool?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()

        guard #available(iOS 13, *) else { return }
        darkMode = AppDefaults.shared.isDarkMode()
        setDarkMode()
    }

    private func setAppearance() {
        navigationBar.backgroundColor = .mainColor
        navigationBar.tintColor = .titleColor
    }
    
    private func setDarkMode() {
        if darkMode == nil {
            darkMode = true
            AppDefaults.shared.setDarkMode(to: true)
        }

        let interface: UIUserInterfaceStyle = darkMode == true ? .dark : .light
        let style: UIBarStyle = darkMode == true ? .black : .default
        
        DispatchQueue.main.async { [weak self] in
            self?.navigationBar.tintColor = .buttonColor
            self?.overrideUserInterfaceStyle = interface
            self?.navigationBar.barStyle = style
            self?.navigationBar.layoutIfNeeded()
        }
    }
    
    func updateDarkMode(to mode: Bool) {
        AppDefaults.shared.setDarkMode(to: mode)
        darkMode = mode
        setDarkMode()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}





