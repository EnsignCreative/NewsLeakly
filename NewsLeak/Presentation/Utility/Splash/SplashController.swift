//
//  SplashController.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/17/22.
//

import UIKit

class SplashController: UIViewController {
    
    let thisView = SplashView()
    override func loadView() { view = thisView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tempDelayToHome()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func tempDelayToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.navigateToHomePage()
        }
    }
    
    private func navigateToHomePage() {
        let navigation = HomePageController()
        navigationController?.pushViewController(navigation, animated: true)
    }
}


