//
//  AppDelegate.swift
//  DynamicIslandPractice
//
//  Created by Eom Chanwoo on 5/19/24.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var notificationManager = LocalNotificationManager()

    func applicationWillTerminate(_ application: UIApplication) {
        // 앱이 종료되기 전에 수행할 작업
        print("terminating")
        notificationManager.sendNotification(type: .app)
        sleep(1)
    }
}
