//
//  SettingsView.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/17/22.
//

import UIKit

class SettingsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainColor
        addSubViews()
        setConstraints()
    }

    let settingsTableView: SettingsTableViewController = {
        let table = SettingsTableViewController()
        table.view.backgroundColor = .clear
        table.view.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private func addSubViews() {
        addSubview(settingsTableView.view)
    }
    
    
    private func setConstraints() {
        
        settingsTableView.view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        settingsTableView.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        settingsTableView.view.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        settingsTableView.view.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
