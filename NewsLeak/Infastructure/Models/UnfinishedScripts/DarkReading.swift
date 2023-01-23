//
//  DarkReading.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import Foundation


//def topStories(siteInfo, contents):
//    empty = ''
//
//    topStories = contents.find('dl', class_ ='results')
//    stories = topStories.find_all('dt', limit = 10)
//
//    newsFeed = []
//    for story in stories:
//
//        title = story.find('a').string
//        link = story.find('a')['href']
//        date = story.find('span', class_ = 'date').text.strip()
//        desc = story.find_next_sibling("dd").string
//
//        if None in (title, desc, link):
//            continue
//
//        post = {
//            "website" : siteInfo.name,
//            "author" : empty,
//            "title" : title[0:100].strip(),
//            "desc" : desc[0:100].strip(),
//            "date" : empty if date is None else date,
//            "link" : link
//        }
//        newsFeed.append(post)
//
//    return newsFeed
