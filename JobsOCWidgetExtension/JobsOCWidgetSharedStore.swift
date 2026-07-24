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

    static var counter: Int {
        let value = defaults.integer(forKey: counterKey)
        return value > 0 ? value : defaultCounter
    }

    static var updatedAt: Date {
        defaults.object(forKey: updatedAtKey) as? Date ?? Date()
    }
}
