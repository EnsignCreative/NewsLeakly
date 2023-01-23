//
//  Advertising.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//

import UIKit
import AdSupport
//import GoogleMobileAds


protocol AdsProtocol {
    func adsIdentifier() -> String?
    func checkTrackingPrivileges()
}


extension AdsProtocol {
    func checkTrackingPrivileges() {
        
        let checkForTracking = adsIdentifier()
        guard checkForTracking != nil else { return }
        //GADMobileAds.sharedInstance().start(completionHandler: nil)
    }

    func adsIdentifier() -> String? {
       guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else { return nil }
       return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}

