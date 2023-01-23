//
//  AppDefualts.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//


import UIKit

// Check current state
//let traitCollection.userInterfaceStyle == .dark

final class AppDefaults {
    
    static let shared = AppDefaults()
    private var manager = AppDefaultsManager()

    func isDarkMode() -> Bool? { manager.isDarkMode() }
    
    func getSaveLogin() -> Bool { return manager.getSaveLogin() }

    func setDarkMode(to mode: Bool) { manager.setDarkMode(to: mode) }
    
    func setSaveLogin(_ value: Bool) { manager.setSaveLogin(to: value) }
}



final class AppDefaultsManager {
    
    private var darkMode: Bool?
    private var savesLogin: Bool = false
    
    
    init() {
        savesLogin = UserDefaults.standard.bool(forKey: "savesLogin")
        darkMode = UserDefaults.standard.bool(forKey: "enableDarkMode")
    }
    
    func isDarkMode() -> Bool? { return darkMode }
    
    func getSaveLogin() -> Bool { return savesLogin }
    
    
    func setDarkMode(to mode: Bool) {
        darkMode = mode
        UserDefaults.standard.setValue(mode, forKey: "enableDarkMode")
        UserDefaults.standard.synchronize()
    }
    
    func setSaveLogin(to value: Bool) {
        savesLogin = value
        UserDefaults.standard.setValue(value, forKey: "savesLogin")
        UserDefaults.standard.synchronize()
    }
}
