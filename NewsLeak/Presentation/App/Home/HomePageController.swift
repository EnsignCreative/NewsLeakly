//
//  HomePageController.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit


class HomePageController: UIViewController {
    
    var topSites = [NewsPost]()

    let thisView = HomePageView()
    override func loadView() { view = thisView }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupNavigation()
        setupSearchBar()
    }

    private func setupUI() {
        thisView.segmentControl.addTarget(self, action: #selector(segmentChanged(_ :)), for: .primaryActionTriggered)
        thisView.refresh.addTarget(self, action: #selector(refreshControl(_ :)), for: .valueChanged)
        thisView.newsCollectionView.collectionView.refreshControl = thisView.refresh
    }
    
    
    private func setupNavigation() {
        setLogoForNavigationTitle()
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.titleColor]

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .menu, style: .done, target: self, action: #selector(menuButtonTap))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .search, style: .done, target: self, action: #selector(magnifyingGlassTapped))
    }
    
    private func setupSearchBar() {
        thisView.searchController.searchResultsUpdater = self
        thisView.searchController.searchBar.delegate = self
        thisView.searchController.delegate = self
        thisView.searchController.obscuresBackgroundDuringPresentation = false
        thisView.searchController.searchBar.placeholder = "Search News Feed"
        navigationItem.searchController = thisView.searchController
        navigationItem.searchController?.searchBar.isHidden = true
        definesPresentationContext = true
    }
}



extension HomePageController {
    @objc func menuButtonTap() {
        let navigation = SettingsController()
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @objc func magnifyingGlassTapped() {
        navigationItem.searchController?.searchBar.isHidden = false
        navigationItem.searchController?.searchBar.becomeFirstResponder()
    }
    

    @objc func refreshControl(_ control: UIRefreshControl) {
        thisView.refreshTableView()
    }

    @objc func segmentChanged(_ sender: UISegmentedControl) {
        guard let placeHolder = sender.titleForSegment(at: sender.selectedSegmentIndex) else { return }
        thisView.searchController.searchBar.placeholder = "Search \(placeHolder)"
        
        print(sender.selectedSegmentIndex)
        if sender.selectedSegmentIndex == 0 { thisView.showNewsFeed() } else { thisView.showTopSites() }
    }
}
