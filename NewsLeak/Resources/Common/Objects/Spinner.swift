//
//  Spinner.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/20/22.
//

import UIKit

class Spinner: UIActivityIndicatorView {
    
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
    }
    
    init(color spinColor: UIColor = .titleColor, style spinnerStyle: UIActivityIndicatorView.Style) {
        super.init(style: spinnerStyle)
        setRequirements(with: spinColor)
    }
    

    private func setRequirements(with spinColor: UIColor) {
        isHidden = true
        color = spinColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showSpinner() {
        DispatchQueue.main.async { [weak self] in
            self?.startAnimating()
            self?.isHidden = false
        }
    }
    
    func hideSpinner() {
        DispatchQueue.main.async { [weak self] in
            self?.stopAnimating()
            self?.isHidden = true
        }
    }
    
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

