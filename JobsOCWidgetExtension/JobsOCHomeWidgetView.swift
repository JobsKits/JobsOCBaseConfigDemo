//
//  JobsOCHomeWidgetView.swift
//  JobsOCWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import SwiftUI
import WidgetKit

struct JobsOCHomeWidgetView: View {
    @Environment(\.widgetFamily) private var widgetFamily

    let entry: JobsOCWidgetEntry

    var body: some View {
        if #available(iOS 17.0, *) {
            content
                .containerBackground(for: .widget) {
                    background
                }
        } else {
            content
                .padding(16)
                .background(background)
        }
    }

    private var content: some View {
        VStack(alignment: .leading, spacing: widgetFamily == .systemSmall ? 6 : 8) {
            Text("WIDGETKIT · LIVE")
                .font(.caption2.weight(.semibold))
                .foregroundStyle(.white.opacity(0.72))

            Text("演武堂 · OC 小组件")
                .font(widgetFamily == .systemSmall ? .headline : .title3.bold())
                .foregroundStyle(.white)
                .lineLimit(1)

            Text(entry.date, style: .time)
                .font((widgetFamily == .systemSmall ? Font.title2 : Font.title).monospacedDigit().bold())
                .foregroundStyle(.white)

            Text("今日进度 \(entry.counter) / 12")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.white.opacity(0.88))

            ProgressView(value: Double(entry.counter), total: 12)
                .tint(.white)

            if widgetFamily != .systemSmall {
                Text("宿主 Demo 更新后，桌面时间线会同步刷新。")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.76))
                    .lineLimit(widgetFamily == .systemLarge ? 2 : 1)
            }

            if widgetFamily == .systemLarge {
                Spacer(minLength: 4)
                Divider()
                    .overlay(.white.opacity(0.28))
                Label("长按桌面可编辑或移除小组件", systemImage: "hand.tap.fill")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.78))
                Text("最近同步 \(entry.updatedAt, style: .time)")
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
