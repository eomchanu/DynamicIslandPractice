//
//  HomeView.swift
//  DynamicIslandPractice
//
//  Created by Eom Chanwoo on 5/17/24.
//

import SwiftUI
import ActivityKit

struct HomeView: View {
    @StateObject var activityManager = LiveActivityManager()
    var notificationManager = LocalNotificationManager()
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
            Button("Start") {
                activityManager.requestActivity(stateValue: count)
            }
        }
        .onAppear {
            // TODO: 푸시 알림 권한 설정 작업 다른 곳으로 이동
            notificationManager.requestPermission()
            // TODO: 라이브 액티비티 비활성 상태일 경우 활성화
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                count += 1
            }
        }
        .onChange(of: activityManager.activity?.activityState) { oldValue, newValue in
            if newValue == .dismissed {
                // TODO: 앱 실행 중 액티비티 비활성화하면 알림 안 뜸 ㅜ
                notificationManager.sendNotification(type: .dynamicIsland)
            }
        }
        .onChange(of: count) {
            activityManager.updateActivity(stateValue: count)
        }
    }
}

#Preview {
    HomeView()
}
