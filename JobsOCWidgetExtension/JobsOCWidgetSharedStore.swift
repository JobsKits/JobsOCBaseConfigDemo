//
//  JobsOCWidgetSharedStore.swift
//  JobsOCWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation

enum JobsOCWidgetSharedStore {
    static let appGroupIdentifier = "group.com.JobsOCBaseConfigDemo"
    static let widgetKind = "JobsOCHomeScreenWidget"
    static let defaultCounter = 8

    private static let counterKey = "jobs.widget.counter"
    private static let updatedAtKey = "jobs.widget.updatedAt"

    private static var defaults: UserDefaults {
        UserDefaults(suiteName: appGroupIdentifier) ?? .standard
    }

    static var languageCode: String {
        defaults.string(forKey: "jobs.widget.languageCode") ?? Locale.preferredLanguages.first ?? "en"
    }

    static var localizedStrings: [String: String] {
        defaults.dictionary(forKey: "jobs.widget.localizedStrings") as? [String: String] ?? [:]
    }

    static func text(_ key: String, fallback: String) -> String {
        localizedStrings[key] ?? fallback
    }

    static var counter: Int {
        let value = defaults.integer(forKey: counterKey)
        return value > 0 ? value : defaultCounter
    }

    static var updatedAt: Date {
        defaults.object(forKey: updatedAtKey) as? Date ?? Date()
    }
}
