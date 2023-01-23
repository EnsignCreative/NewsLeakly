//
//  TopSitesCollection.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/24/22.
//



import UIKit

class TopSitesCellView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainColor
        addViews()
        constraints()
    }
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.textAlignment = .center
        view.textColor = .titleColor
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        view.font = UIFont.boldSystemFont(ofSize: 15)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logo: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        view.layer.borderColor = UIColor.titleColor.cgColor
        view.layer.borderWidth = 0.5
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func addViews() {
        addSubview(logo)
        addSubview(titleLabel)
    }
    
    private func constraints() {
        
        logo.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        logo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


