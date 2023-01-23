//
//  SettingsTableView.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/17/22.
//

import UIKit

struct SettingsTableCellData {
    let title: String
    var image: UIImage
    var isOn: Bool
    
    init(title: String, isOn: Bool) {
        self.title = title
        self.isOn = isOn
        
        let imageMode: UIImage = isOn == true ? .darkMode : .lightMode
        self.image = imageMode
    }
}


class SettingsTableViewCell: BaseTableViewCell<SettingsTableCellData> {

    var toggleAction: ((Bool) -> Void)?
    
    override var item: SettingsTableCellData? {
        didSet {
            guard let settings = item else { return }
            textLabel?.text = settings.title
            imageView?.image = settings.image
            
            toggleSwitch.isOn = settings.isOn
            toggleSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
            accessoryView = toggleSwitch
        }
    }
    
    let toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.sizeToFit()
        toggle.isOn = true
        toggle.tintColor = .white
        toggle.onTintColor = .green
        return toggle
    }()
    

    @objc func switchToggled(_ sender: UISwitch) {
        toggleAction?(sender.isOn)

        let image: UIImage = sender.isOn == true ? .darkMode : .lightMode
        imageView?.image = image
        layoutIfNeeded()
    }
}


class SettingsTableViewController: BaseTableViewController<SettingsTableViewCell, SettingsTableCellData> {

    var toggleAction: ((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard #available(iOS 13, *) else { return }

        let mode = AppDefaults.shared.isDarkMode() ?? true
        items = [SettingsTableCellData(title: "Dark Appearance", isOn: mode)]
    }
            
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        
        cell.item = items[indexPath.row]
        cell.backgroundColor = .secondaryColor
        cell.layer.cornerRadius = 7
        cell.clipsToBounds = true
        
        cell.toggleAction = { [weak self] sender in
            self?.toggleAction?(sender)
        }
        return cell
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

