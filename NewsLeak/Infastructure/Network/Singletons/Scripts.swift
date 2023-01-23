//
//  Scripts.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit

enum DailyNewsFeed: String, CaseIterable {
    case cso
    case hackerNews
    case threatPost
    case darkReading
    case bleepingComputer
}

extension DailyNewsFeed {

    var url: URL? {
        switch self {
        case .darkReading:
            return URL(string: "https://www.darkreading.com/search.asp?q=top+stories")
        case .bleepingComputer:
            return URL(string: "https://www.bleepingcomputer.com/")
        case .hackerNews:
            return URL(string: "https://thehackernews.com/")
        case .cso:
            return URL(string: "https://www.csoonline.com/")
        case .threatPost:
            return URL(string: "https://threatpost.com/feed/")
        
        }
    }
}


struct NewsPost: Decodable, Comparable {
    let website: String
    let title: String
    let desc: String
    let date: Date
    let link: String
    
    init(website: String, title: String, desc: String, date: Date, link: String) {
        self.website = website
        self.title = title
        self.desc = desc
        self.date = date
        self.link = link
    }
}

extension NewsPost {
    static func <(lhs: NewsPost, rhs: NewsPost) -> Bool {
        return lhs.date < rhs.date
    }
    
    func compare(to value: NewsPost) -> Bool {
        return self.date < value.date
    }
    
    enum CodingKeys: String, CodingKey {
        case website, title, desc, date, link
    }
}




struct Website: Decodable {
    let name: String
    let logo: String
    let link: String
}

extension Website {
    enum CodingKeys: String, CodingKey {
        case name, logo, link
    }
}


struct TopSites: Decodable {
    let sites: [Website]

    init(sites: [Website]) {
        self.sites = sites
    }
}
extension TopSites {
    enum CodingKeys: String, CodingKey {
        case sites
    }
}


