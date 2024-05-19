//
//  LocalNotificationManager.swift
//  DynamicIslandPractice
//
//  Created by Eom Chanwoo on 5/19/24.
//

import Foundation
import UserNotifications

class LocalNotificationManager {
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    // 권한 설정 성공!
                }
            }
    }
    
    func sendNotification(type: NotificationType) -> Void {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestPermission()
            case .authorized, .provisional:
                switch type {
                case .app:
                    self.sendAppNotification()
                case .dynamicIsland:
                    self.sendDynamicIslandNotification()
                }
            default:
                break
            }
        }
    }
    
    func sendDynamicIslandNotification() -> Void {
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        content.subtitle = "다이나믹 아일랜드를 종료하셨네요!"
        content.body = "다시 활성화하기"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            guard error == nil else { return }
            print("scheduling notification with id:\(request.identifier)")
        }
    }
    
    func sendAppNotification() -> Void {
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        content.subtitle = "부기를 종료하셨네요!"
        content.body = "앱을 백그라운드에 유지해주세요!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            guard error == nil else { return }
            print("scheduling notification with id:\(request.identifier)")
        }
    }
    
//    func scheduleNotifications() -> Void {
//        for notification in notifications {
//            
//            let content = UNMutableNotificationContent()
//            content.title = notification.title
//            content.sound = UNNotificationSound.default
//            content.subtitle = "다이나믹 아일랜드를 종료하셨네요!"
//            content.body = "다시 활성화하기"
//            
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
//            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
//            
//            UNUserNotificationCenter.current().add(request) { error in
//                guard error == nil else { return }
//                print("scheduling notification with id:\(notification.id)")
//            }
//        }
//    }
}

struct Notification {
    var id: String
    var title: String
}

enum NotificationType {
    case dynamicIsland
    case app
}
