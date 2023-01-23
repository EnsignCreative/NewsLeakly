//
//  HackerBNews.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import Foundation


//def topStories(siteInfo, contents):
//    empty = ''
//    # url = 'https://thehackernews.com/'
//
//    # page = requests.get(url)
//    # soup = BeautifulSoup(page.content, 'html.parser')
//
//    results = contents.find(id = 'Blog1')
//    stories = results.find_all('div', class_ = 'body-post')
//
//    newsFeed = []
//    for story in stories:
//
//        title = story.find('h2', class_ = 'home-title')
//        desc = story.find('div', class_ = 'home-desc')
//        dateInfo = story.find('div', class_ = 'item-label')
//        date = dateInfo.contents[1].strip()
//        author = dateInfo.span.text.strip()
//        link = story.find('a', class_ = 'story-link')['href']
//
//        if None in (title, desc, link):
//            continue
//
//        encoded_author = author.encode("ascii", "ignore")
//        encoded_desc = desc.text[0:100].encode("ascii", "ignore")
//
//        post = {
//            "website" : siteInfo.name,
//            "author" : empty if author is None else encoded_author.decode(),
//            "title" : title.text[0:100].strip(),
//            "desc" : encoded_desc.decode(),
//            "date" : empty if date is None else date,
//            "link" : link.strip()
//        }
//        newsFeed.append(post)
//
//    return newsFeed
