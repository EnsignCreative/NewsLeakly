//
//  NewsFeed.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//


import UIKit
import SwiftSoup

final class NewsFeedSingleton {
    
    static let shared = NewsFeedSingleton()
    private var manager = NewsFeedManager()
    
    func updateNewsFeed(completionHandler completion: @escaping ([NewsPost]) -> Void) {
        manager.updateNewsFeed { sender in
            completion(sender)
        }
    }
    
    func loadTopSitesJson() -> [Website]? {
        return manager.loadTopSitesJson()
    }
    
    func requestWebsiteHTML(fromSite site: DailyNewsFeed, completion: @escaping (([NewsPost]?) -> Void)) {
        return manager.requestWebsiteHTML(fromSite: site) { (response) in
            completion(response)
        }
    }
}






final class NewsFeedManager {
    
    private var newsFeed = [NewsPost]()
    private var request = ScriptRequests()
    
    init() {}

    func updateNewsFeed(completionHandler completion: @escaping ([NewsPost]) -> Void) {
        DailyNewsFeed.allCases.forEach({ site in
            requestWebsiteHTML(fromSite: site) { [weak self] (response) in
                guard let response = response else { return }
                self?.newsFeed.append(contentsOf: response)
            }
        })
        completion(newsFeed)
    }
    
    
    func requestWebsiteHTML(fromSite site: DailyNewsFeed, completion: @escaping (([NewsPost]?) -> Void)) {
        guard let url = site.url else { return }
        guard let html = try? String(contentsOf: url, encoding: .utf8) else { return }
        guard let document: Document = try? SwiftSoup.parse(html) else { return }

        request.collective(withDocument: document, withSite: site) { (response) in
            guard let response = response else { return }
            completion(response)
        }
    }
    
    
    func loadTopSitesJson() -> [Website]? {
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: "TopSitesData", withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let jsonData = try? decoder.decode(TopSites.self, from: data) else { return nil }
        return jsonData.sites
    }
}




