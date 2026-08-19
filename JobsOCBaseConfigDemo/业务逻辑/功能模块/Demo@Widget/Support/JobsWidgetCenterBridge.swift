//
//  JobsWidgetCenterBridge.swift
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation
import WidgetKit

@objc(JobsWidgetCenterBridge)
final class JobsWidgetCenterBridge: NSObject {
    private static let appGroupIdentifier = "group.com.JobsOCBaseConfigDemo"
    private static let widgetKind = "JobsOCHomeScreenWidget"
    private static let defaultCounter = 8
    private static let counterKey = "jobs.widget.counter"
    private static let updatedAtKey = "jobs.widget.updatedAt"

    private static var defaults: UserDefaults {
        UserDefaults(suiteName: appGroupIdentifier) ?? .standard
    }

    @objc(counter)
    class func counter() -> Int {
        let value = defaults.integer(forKey: counterKey)
        return value > 0 ? value : defaultCounter
    }

    @objc(jobsCounter)
    class func jobsCounter() -> @convention(block) () -> Int {
        { counter() }
    }

    @objc(saveCounter:)
    class func saveCounter(_ counter: Int) {
        defaults.set(counter, forKey: counterKey)
        reloadTimelines()
    }

    @objc(jobsSaveCounter)
    class func jobsSaveCounter() -> @convention(block) (Int) -> Void {
        { saveCounter($0) }
    }

    @objc(reloadTimelines)
    class func reloadTimelines() {
        defaults.set(Date(), forKey: updatedAtKey)
        WidgetCenter.shared.reloadTimelines(ofKind: widgetKind)
    }

    @objc(jobsReloadTimelines)
    class func jobsReloadTimelines() -> @convention(block) () -> Void {
        { reloadTimelines() }
    }
}
