//
//  NewsFeedCollection.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit

class TopSitesCollectionViewCell: BaseCollectionCell<Website> {

    let myView = TopSitesCellView()
    
    override var item: Website? {
        didSet {
            guard let site = item else { return }
            let siteLogo = UIImage(imageLiteralResourceName: site.logo)

            myView.logo.image = siteLogo
            myView.titleLabel.text = site.name
            
            contentView.addSubview(myView)
            myView.frame = contentView.bounds
        }
    }
}



class TopSitesCollectionController: BaseCollectionController<TopSitesCollectionViewCell, Website> {

    var profileSelectedAction: ((Website) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadTopSites() {
        items = NewsFeedSingleton.shared.loadTopSitesJson()
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let multiple: CGFloat = 3.4
        let width = collectionView.bounds.size.width
        return CGSize(width: width / multiple, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let link = items?[indexPath.row].link else { return }
        
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}

    
