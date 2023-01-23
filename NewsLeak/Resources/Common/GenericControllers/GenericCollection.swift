//
//  GenericCollection.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit

class BaseCollectionController<T: BaseCollectionCell<U>, U>: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = String(describing: T.self)
    var items: [U]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .mainColor//.black
        collectionView.register(T.self, forCellWithReuseIdentifier: cellId)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? BaseCollectionCell<U> else { return UICollectionViewCell() }
        
        cell.item = items?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height / 2
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: height)
    }
}


class BaseCollectionCell<U>: UICollectionViewCell {
    
    var item: U? {
        didSet {
            //backgroundColor = .white
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return layoutAttributes
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
