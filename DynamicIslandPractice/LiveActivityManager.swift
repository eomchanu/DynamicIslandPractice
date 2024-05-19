//
//  DynamicIslandManager.swift
//  DynamicIslandPractice
//
//  Created by Eom Chanwoo on 5/16/24.
//

import Foundation
import ActivityKit

class LiveActivityManager: ObservableObject {
    @Published var activity: Activity<DynamicIslandWidgetAttributes>?
    
    func requestActivity(stateValue: Int) {
        let dynamicIslandAttribute = DynamicIslandWidgetAttributes(name: "practice")
        let contentState = ActivityContent(state: DynamicIslandWidgetAttributes.ContentState(value: stateValue), staleDate: nil)
        do {
            let activity = try Activity<DynamicIslandWidgetAttributes>.request(attributes: dynamicIslandAttribute, content: contentState)
            self.activity = activity
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateActivity(stateValue: Int) {
        let contentState = ActivityContent(state: DynamicIslandWidgetAttributes.ContentState(value: stateValue), staleDate: nil)
        var alertConfig: AlertConfiguration? {
            if stateValue % 10 == 0 {
                return AlertConfiguration(
                    title: "사용 시간 임박",
                    body: "1분 뒤 미션 수행 화면으로 이동합니다!",
                    sound: .default
                )
            } else {
                return nil
            }
        }
        Task {
            await activity?.update(contentState, alertConfiguration: alertConfig)
        }
    }
}
