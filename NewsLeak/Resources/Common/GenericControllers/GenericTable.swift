//
//  GenericTableView.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit

class BaseTableViewController<T: BaseTableViewCell<U>, U>: UITableViewController {

    let cellId = String(describing: T.self)
    var items = [U]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .mainColor
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? BaseTableViewCell<U> else { return UITableViewCell() }
        
        cell.item = items[indexPath.row]
        cell.backgroundColor = .secondaryColor
        cell.layer.cornerRadius = 7
        cell.clipsToBounds = true
        return cell
    }
}


class BaseTableViewCell<U>: UITableViewCell {
    
    var item: U? {
        didSet {
            textLabel?.backgroundColor = .clear
            textLabel?.textColor = .titleColor
    
            imageView?.backgroundColor = .clear
            imageView?.contentMode = .scaleAspectFit
            imageView?.tintColor = .buttonColor
            imageView?.clipsToBounds = true
            
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondaryColor
        selectionStyle = .none
    }

    func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
         return layoutAttributes
     }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
