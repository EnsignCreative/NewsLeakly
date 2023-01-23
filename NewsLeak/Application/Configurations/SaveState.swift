//
//  SaveState.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//


import UIKit

enum PresentedViewState: String {
    case commentViewController = "commentViewController"
    case supportersViewController = "supportersViewController"
    case friendsViewController = "friendsViewController"
    case directMessageForPost = "directMessageForPost"
}

extension UIViewController {
    func savePresentedView(with name: PresentedViewState, isDisplayed value: Bool) {
        UserDefaults.standard.set(value, forKey: name.rawValue)
    }
    
    func removePresentedView(with name: PresentedViewState) {
        UserDefaults.standard.removeObject(forKey: name.rawValue)
    }
    
    func retrievePresentedView(with name: PresentedViewState) -> Bool {
        return UserDefaults.standard.bool(forKey: name.rawValue)
    }
    
    func removeAllKeys() {
        guard let appDomain = Bundle.main.bundleIdentifier else { return }
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
}


