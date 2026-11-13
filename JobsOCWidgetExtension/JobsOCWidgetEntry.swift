//
//  JobsOCWidgetEntry.swift
//  JobsOCWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import WidgetKit

struct JobsOCWidgetEntry: TimelineEntry {
    let date: Date
    let counter: Int
    let updatedAt: Date
    let languageCode = JobsOCWidgetSharedStore.languageCode
    let localizedStrings = JobsOCWidgetSharedStore.localizedStrings

    func text(_ key: String, fallback: String) -> String {
        localizedStrings[key] ?? fallback
    }
}
