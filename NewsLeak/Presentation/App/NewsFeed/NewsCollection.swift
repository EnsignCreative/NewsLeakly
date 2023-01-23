//
//  NewsFeedController.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.


import UIKit

class NewsFeedCollectionViewCell: BaseCollectionCell<NewsPost> {

    let myView = NewsFeedCellView()
    let formatter = DateFormatter()
            
    override var item: NewsPost? {
        didSet {
            guard let news = item else { return }
            guard news.desc.count > 0 && news.title.count > 0 else { return }
            myView.titleLabel.text = news.title
            myView.descLabel.text = news.desc
            
            formatter.dateStyle = .medium
            myView.dateLabel.text = formatter.string(from: news.date)
            
            let siteLogo = UIImage(imageLiteralResourceName: news.website) // Should unwrap for future uses
            myView.siteLogo.image = siteLogo
            
            contentView.addSubview(myView)
            myView.frame = contentView.bounds
        }
    }
}




class NewsFeedCollectionController: BaseCollectionController<NewsFeedCollectionViewCell, NewsPost> {

    var allNews = [NewsPost]()
//    var filteredNews = [NewsPost]()
    
    var postCount: Int? = 0
    var profileSelectedAction: ((NewsPost) -> Void)?
    let spinner = Spinner(color: .systemBlue, style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTableView { sender in
            guard sender != false else { return } // Send error or connection issue etc
        }
    }
    

    func updateTableView(completion: @escaping (Bool) -> Void) {
        NewsFeedSingleton.shared.updateNewsFeed { [weak self] newsFeed in
            self?.items = newsFeed
            self?.allNews = newsFeed
            self?.postCount = newsFeed.count
            self?.collectionView.reloadData()
            self?.collectionView.layoutIfNeeded()
            completion(true)
        }
    }
    
    func filterNewsFeed(withText text: String) {
        // Worst way possible first
        // Use a dict to avoid duplicates
        
//        guard let allNews = allNews else { return }
        
        var filteredNews = [NewsPost]()

        for news in allNews {

            if news.title.lowercased().contains(text) {  // || news.desc.contains(text) || news.website.contains(text)
                filteredNews.append(news)
            }
        }

        items = filteredNews
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        print("Showing filter count: ", filteredNews.count)
        if filteredNews.isEmpty { print("Showing nothing here") } // Show nothing matches search. Better way to do this. Temp
    }
    
    func cancelFilterResults() {
        items = allNews
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
     

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        return CGSize(width: width, height: 100)
    }
}


extension NewsFeedCollectionController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? NewsFeedCollectionViewCell else { return UICollectionViewCell() }
        
        cell.item = items?[indexPath.row]
        cell.backgroundColor = .mainColor
        cell.layer.cornerRadius = 7
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        guard let postCount = postCount else { return }
        if indexPath.row == postCount - 10 && postCount > 10 { loadMore() }
    }
    
    func loadMore() {
        spinner.showSpinner()
        print("Loading more")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let link = items?[indexPath.row].link else { return }
        
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}
    

