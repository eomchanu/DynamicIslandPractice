//
//  DynamicIslandWidgetLiveActivity.swift
//  DynamicIslandWidget
//
//  Created by Eom Chanwoo on 5/16/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DynamicIslandWidgetAttributes: ActivityAttributes {
    // 동적 데이터
    public struct ContentState: Codable, Hashable {
        var value: Int
    }

    // 정적 데이터
    var name: String
}

struct DynamicIslandWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DynamicIslandWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("CHAN \(context.state.value)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            .widgetURL(URL(string: "dynamicIslandPractice://deepLink"))
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.value)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("\(context.state.value)")
            } minimal: {
                Text("\(context.state.value)")
            }
            .widgetURL(URL(string: "dynamicIslandPractice://deepLink"))
            .keylineTint(Color.red)
        }
    }
}
//
//extension DynamicIslandWidgetAttributes {
//    fileprivate static var preview: DynamicIslandWidgetAttributes {
//        DynamicIslandWidgetAttributes(name: "World")
//    }
//}
//
//extension DynamicIslandWidgetAttributes.ContentState {
//    fileprivate static var smiley: DynamicIslandWidgetAttributes.ContentState {
//        DynamicIslandWidgetAttributes.ContentState(emoji: "😀")
//     }
//     
//     fileprivate static var starEyes: DynamicIslandWidgetAttributes.ContentState {
//         DynamicIslandWidgetAttributes.ContentState(emoji: "🤩")
//     }
//}
//
//#Preview("Notification", as: .content, using: DynamicIslandWidgetAttributes.preview) {
//   DynamicIslandWidgetLiveActivity()
//} contentStates: {
//    DynamicIslandWidgetAttributes.ContentState.smiley
//    DynamicIslandWidgetAttributes.ContentState.starEyes
//}
