//
//  ScriptRequest.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//


import UIKit
import SwiftSoup

class ScriptRequests: NSObject {
    var articleDictionary = [String: String]()
    let formatter = DateFormatter()

    func collective(withDocument document: Document?, withSite name: DailyNewsFeed, completion: @escaping (([NewsPost]?) -> Void)) {

        switch name {
        case .cso:
            csoData(withDocument: document) { (response) in completion(response) }
        case .threatPost:
            threatPostData(withDocument: document) { (response) in completion(response) }
        case .hackerNews:
            hackerNewsData(withDocument: document) { (response) in completion(response) }
        case .darkReading:
            darkReadingData(withDocument: document) { (response) in completion(response) }
        case .bleepingComputer:
            bleepingComputerData(withDocument: document) { (response) in completion(response) }
        }
    }

    func csoData(withDocument document: Document?, completion: @escaping (([NewsPost]?) -> Void)) {
        guard let article = try? document?.select("div").attr("class", "post-cont") else { return }
        var newsFeed = [NewsPost]()

        for post in article.array() {
            guard let title = try? post.select("h3").select("a").first()?.text() else { continue }
            guard articleDictionary[title] == nil else { continue }
            
            guard let link = try? post.select("h3").select("a").first()?.attr("href") else { continue }
            guard let desc = try? post.select("h4").first()?.text() else { continue }
            
            let feed = NewsPost(website: "CSO", title: title, desc: desc, date: Date(), link: "https://www.csoonline.com\(link)")
            articleDictionary[title] = desc
            newsFeed.append(feed)
        }
        completion(newsFeed)
    }
    
    
    func hackerNewsData(withDocument document: Document?, completion: @escaping (([NewsPost]?) -> Void)) {

        guard let element = try? document?.getElementById("Blog1") else { return }
        guard let section = try? element.select("div").attr("class", "body-post clear") else { return }
        var newsFeed = [NewsPost]()

        for post in section.array() {
            guard let title = try? post.select("h2").attr("class", "home-title").first()?.text() else { continue }
            guard articleDictionary[title] == nil else { continue }

            guard let desc = try? post.select("div").attr("class", "home-desc").first()?.text() else { continue }
            //guard let section = try? post.select("div").attr("class", "clear home-right").first() else { continue }
            guard let link = try? post.select("a").attr("href") else { continue }
            //guard let date = try? section.select("div").attr("class", "item-label").text() else { continue }

            
            let feed = NewsPost(website: "HackerNews", title: title, desc: desc, date: Date(), link: link)
            articleDictionary[title] = desc
            newsFeed.append(feed)
        }
        completion(newsFeed)
    }

    func bleepingComputerData(withDocument document: Document?, completion: @escaping (([NewsPost]?) -> Void)) {

        guard let element = try? document?.getElementById("bc-home-news-main-wrap") else { return }
        guard let articles = try? element.select("div").attr("class", "bc_latest_news_text") else { return }
        var newsFeed = [NewsPost]()

        for post in articles.array() {
            guard let category = try? post.select("span").select("a").text() else { continue }
            guard category.localizedStandardContains("Security") == true else { continue }
            
            guard let title = try? post.select("h4").select("a").text() else { continue }
            guard articleDictionary[title] == nil else { continue }

            guard let link = try? post.select("h4").select("a").attr("href") else { continue }
            guard let desc = try? post.select("p").text() else { continue }
            
            let feed = NewsPost(website: "BleepingComputer", title: title, desc: desc, date: Date(), link: link)
            articleDictionary[title] = desc
            newsFeed.append(feed)
        }
        completion(newsFeed)
    }
    
    
    
    func threatPostData(withDocument document: Document?, completion: @escaping (([NewsPost]?) -> Void)) {
 
    }
    

    func darkReadingData(withDocument document: Document?, completion: @escaping (([NewsPost]?) -> Void)) {
//
//        guard let element = try? document?.getElementById("left-column-inner") else { return }
//        guard let articles = try? element.select("div").attr("class", "bc_latest_news_text") else { return }
//
//
//        for post in articles.array() {
//            print(post)
//        }
//
//        completion(newsFeed)
    }
}

