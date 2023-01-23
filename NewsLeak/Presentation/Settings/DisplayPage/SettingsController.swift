//
//  SettingsController.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/17/22.
//

import UIKit

class SettingsController: UIViewController {
    
    let thisView = SettingsView()
    override func loadView() { view = thisView }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        thisView.settingsTableView.toggleAction = { [weak self] sender in
            let navigation = self?.navigationController as? NavigationController
            navigation?.updateDarkMode(to: sender)
        }
    }
}


