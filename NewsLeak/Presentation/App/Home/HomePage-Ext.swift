//
//  HomePageSearch.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit


extension HomePageController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, text != "" else { return }

        print(text)
        thisView.newsCollectionView.filterNewsFeed(withText: text)
    }


    func willDismissSearchController(_ searchController: UISearchController) {
        navigationItem.searchController?.searchBar.resignFirstResponder()
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.navigationItem.searchController?.searchBar.isHidden = true
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        thisView.newsCollectionView.cancelFilterResults()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search Tapped")
    }
}

