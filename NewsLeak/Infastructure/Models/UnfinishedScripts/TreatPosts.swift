//
//  TreatPosts.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import Foundation


//def topStories(siteInfo, contents):
//    empty = ''
//    website = 'Threat Post'
//    url = 'https://threatpost.com/feed/'
//
//    parse_xml_url = urlopen(url)
//    xml_page = parse_xml_url.read()
//    parse_xml_url.close()
//
//    soup_page = BeautifulSoup(xml_page, "xml")
//    stories = soup_page.findAll("item", limit=10)
//
//
//    newsFeed = []
//    for story in stories:
//
//        author = story.find('dc:creator').text
//        title = story.title.text
//        desc = story.description.text
//        date = story.pubDate.text[0:16]
//        link = story.link.text
//
//        if None in (title, desc, link):
//             continue
//
//        post = {
//            "website" : siteInfo.name,
//            "author" : empty if author is None else author,
//            "title" : title,
//            "desc" : desc,
//            "date" : empty if date is None else date,
//            "link" : link,
//        }
//
//        newsFeed.append(post)
//
//    return newsFeed
//

