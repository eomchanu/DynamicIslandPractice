//
//  ContentView.swift
//  DynamicIslandPractice
//
//  Created by Eom Chanwoo on 5/16/24.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var showDeepLinkView: Bool = false
    
    var body: some View {
        HomeView()
            .onOpenURL { url in
                if url.scheme == "dynamicIslandPractice" && url.host == "deepLink" {
                    showDeepLinkView = true
                }
            }
            .fullScreenCover(isPresented: $showDeepLinkView) {
                DeepLinkView(isPresented: $showDeepLinkView)
            }
    }
}

#Preview {
    ContentView()
}
