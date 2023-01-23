//
//  PushNotifications.swift
//  NewsLeak
//
//  Created by Bradley Ensign on 10/19/22.
//


import UIKit
import UserNotifications


protocol PushNotifications {
    func getNotificationSetting()
    func registerForPushNotifications()
}


extension PushNotifications {
    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                guard granted else { return }
                getNotificationSetting()
            }
    }
    
    
    func getNotificationSetting() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
}
