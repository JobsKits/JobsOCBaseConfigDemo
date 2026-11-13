//
//  JobsOCHomeWidget.swift
//  JobsOCWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import SwiftUI
import WidgetKit

struct JobsOCHomeWidget: Widget {
    let kind = JobsOCWidgetSharedStore.widgetKind

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: JobsOCWidgetTimelineProvider()) { entry in
            JobsOCHomeWidgetView(entry: entry)
        }
        .configurationDisplayName("演武堂 OC 小组件")
        .description(JobsOCWidgetSharedStore.text("在手机桌面查看当前时间和 Demo 进度。", fallback: "View the time and demo progress on your Home Screen."))
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge
        ])
    }
}
