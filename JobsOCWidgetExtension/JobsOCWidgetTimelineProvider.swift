//
//  JobsOCWidgetTimelineProvider.swift
//  JobsOCWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import WidgetKit

struct JobsOCWidgetTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> JobsOCWidgetEntry {
        JobsOCWidgetEntry(
            date: Date(),
            counter: JobsOCWidgetSharedStore.defaultCounter,
            updatedAt: Date()
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (JobsOCWidgetEntry) -> Void) {
        completion(currentEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<JobsOCWidgetEntry>) -> Void) {
        let entry = currentEntry()
        let nextRefreshDate = Calendar.current.date(
            byAdding: .minute,
            value: 15,
            to: entry.date
        ) ?? entry.date.addingTimeInterval(15 * 60)
        completion(Timeline(entries: [entry], policy: .after(nextRefreshDate)))
    }

    private func currentEntry() -> JobsOCWidgetEntry {
        JobsOCWidgetEntry(
            date: Date(),
            counter: JobsOCWidgetSharedStore.counter,
            updatedAt: JobsOCWidgetSharedStore.updatedAt
        )
    }
}
