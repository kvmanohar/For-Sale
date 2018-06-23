//
//  UNService.swift
//  For Sale
//
//  Created by Manohar Kurapati on 23/06/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import UIKit
import UserNotifications

class UNService: NSObject {
    
    private override init() { }
    static let shared = UNService()
    
    let unCenter = UNUserNotificationCenter.current()
    
    func authorize(){
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        unCenter.requestAuthorization(options: options) { (granted, error) in
            print(error ?? "No Un authorisation error")
            guard granted else { return }
            DispatchQueue.main.async {
                self.configure()
            }
        }
    }
    
    
    func configure() {
        unCenter.delegate = self
        
        //register the application for remote notifications
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
        
    }
    
}

extension UNService: UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Un did receive")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Un will Present")
        
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        
        completionHandler(options)
    }
    
}
