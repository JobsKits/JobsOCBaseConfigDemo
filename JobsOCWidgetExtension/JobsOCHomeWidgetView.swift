//
//  JobsOCHomeWidgetView.swift
//  JobsOCWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation
import SwiftUI
import WidgetKit

struct JobsOCHomeWidgetView: View {
    @Environment(\.widgetFamily) private var widgetFamily

    let entry: JobsOCWidgetEntry

    var body: some View {
        if #available(iOS 17.0, *) {
            content
                .environment(\.locale, Locale(identifier: entry.languageCode))
                .containerBackground(for: .widget) {
                    background
                }
        } else {
            content
                .environment(\.locale, Locale(identifier: entry.languageCode))
                .padding(16)
                .background(background)
        }
    }

    private var content: some View {
        VStack(alignment: .leading, spacing: widgetFamily == .systemSmall ? 6 : 8) {
            Text("WIDGETKIT · LIVE")
                .font(.caption2.weight(.semibold))
                .foregroundStyle(.white.opacity(0.72))

            Text(entry.text("演武堂 · 小组件", fallback: "Demo Lab · Widget"))
                .font(widgetFamily == .systemSmall ? .headline : .title3.bold())
                .foregroundStyle(.white)
                .lineLimit(1)

            Text(entry.date, style: .time)
                .font((widgetFamily == .systemSmall ? Font.title2 : Font.title).monospacedDigit().bold())
                .foregroundStyle(.white)

            Text(String(format: entry.text("今日进度 %d / 12", fallback: "Today’s progress %d / 12"), entry.counter))
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.white.opacity(0.88))

            ProgressView(value: Double(entry.counter), total: 12)
                .tint(.white)

            if widgetFamily != .systemSmall {
                Text(entry.text("宿主 Demo 更新后，桌面时间线会同步刷新。", fallback: "The Home Screen timeline refreshes when the host demo updates."))
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.76))
                    .lineLimit(widgetFamily == .systemLarge ? 2 : 1)
            }

            if widgetFamily == .systemLarge {
                Spacer(minLength: 4)
                Divider()
                    .overlay(.white.opacity(0.28))
                Label(entry.text("长按桌面可编辑或移除小组件", fallback: "Hold the Home Screen to edit or remove the widget"), systemImage: "hand.tap.fill")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.78))
                Text(String(format: entry.text("最近同步 %@", fallback: "Last synced %@"),
                            entry.updatedAt.formatted(.dateTime.hour().minute().locale(Locale(identifier: entry.languageCode)))))
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.66))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private var background: some View {
        LinearGradient(
            colors: [Color.indigo, Color.purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
