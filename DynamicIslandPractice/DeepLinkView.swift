//
//  DeepLinkView.swift
//  DynamicIslandPractice
//
//  Created by Eom Chanwoo on 5/17/24.
//

import SwiftUI

struct DeepLinkView: View {
    @Binding var isPresented: Bool
    @State private var count: Int = 0
    
    var body: some View {
        Text("Deep Link")
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    count += 1
                }
            }
            .onChange(of: count) {
                // TODO: 미션 화면 띄워놓을 시간 설정(현재는 30초)
                if count >= 30 {
                    isPresented = false
                }
            }
    }
}
