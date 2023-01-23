//
//  ViewController.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/17/22.
//

import UIKit

class HomePageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
        setConstraints()
        backgroundColor = .mainColor
    }

    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        return search
    }()
    

    let segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["News Feed", "Top Sites"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .secondaryColor
        control.selectedSegmentTintColor = .mainColor
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()


    lazy var refresh: UIRefreshControl = {
        let control = UIRefreshControl()
        let font = UIFont.systemFont(ofSize: 12)
        let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.systemBlue]
        control.attributedTitle = NSAttributedString(string: "Fetching News ...", attributes: attributes)
        control.tintColor = .systemBlue
        control.isHidden = true
        return control
    }()

    
    let newsCollectionView: NewsFeedCollectionController = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        let collection = NewsFeedCollectionController(collectionViewLayout: layout)

        collection.view.backgroundColor = .clear
        collection.collectionView.showsVerticalScrollIndicator = false
        collection.collectionView.alwaysBounceVertical = true
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let topSitesCollectionView: TopSitesCollectionController = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        let collection = TopSitesCollectionController(collectionViewLayout: layout)
        collection.collectionView.showsVerticalScrollIndicator = false
        collection.view.backgroundColor = .clear
        collection.view.isHidden = true
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    

    private func addSubViews() {
        addSubview(segmentControl)
        addSubview(newsCollectionView.view)
        addSubview(topSitesCollectionView.view)
    }
    
    private func setConstraints() {
        
        segmentControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segmentControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2/3).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 30).isActive = true

        newsCollectionView.view.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 12).isActive = true
        newsCollectionView.view.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        newsCollectionView.view.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        newsCollectionView.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        
        topSitesCollectionView.view.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 12).isActive = true
        topSitesCollectionView.view.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        topSitesCollectionView.view.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        topSitesCollectionView.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}



extension HomePageView {
    func showNewsFeed() {
        newsCollectionView.view.isHidden = false
        topSitesCollectionView.view.isHidden = true
    }

    func showTopSites() {
        if topSitesCollectionView.items == nil { topSitesCollectionView.loadTopSites() }
        newsCollectionView.view.isHidden = true
        topSitesCollectionView.view.isHidden = false
    }
    
    func refreshTableView() {
        newsCollectionView.collectionView.refreshControl?.beginRefreshing()

        newsCollectionView.updateTableView(completion: { [weak self] _ in
            self?.newsCollectionView.collectionView.refreshControl?.endRefreshing()
        })
    }
}


