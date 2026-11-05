//
//  JobsCrashCrawlerTests.swift
//  JobsCrashCrawler
//
//  Created by Jobs on 2026年11月3日，星期二.
//

import XCTest
import Foundation
import CoreGraphics
import Darwin

/// 独立 UI 测试：同包 command 按清单生成逐场景方法，另提供补充探索。
/// 场景必须取得就绪和完整步骤证据；遍历结束、相同种子或相同界面不构成覆盖证明。
final class JobsCrashCrawlerTests: XCTestCase {

    private struct Action: Codable {

        let kind: String
        let type: UInt
        let id: String
        let label: String
        let displayLabel: String
        let index: Int
        let occurrence: Int
        let targetLabel: String

        var dictionary: [String: Any] {
            return [
                "kind": kind,
                "type": type,
                "id": id,
                "label": label,
                "displayLabel": displayLabel,
                "index": index,
                "occurrence": occurrence,
                "targetLabel": targetLabel
            ]
        }

        var key: String {
            let identityLabel = usesDisplayIdentity ? displayLabel : label
            return "\(kind)|\(type)|\(id)|\(identityLabel)|\(occurrence)|\(targetLabel)"
        }

        var usesDisplayIdentity: Bool {
            return id.isEmpty && label.isEmpty
        }

        func matchesIdentity(identifier: String, label: String, displayLabel: String) -> Bool {
            return id == identifier && self.label == label && self.displayLabel == displayLabel
        }

        /// 仅认出根目录的分类计数、展开状态和同计数标题，不把普通 Demo 当成分类。
        var rootCategoryKey: String? {
            return rootCategory?.key
        }

        var rootCategoryExpanded: Bool? {
            return rootCategory?.expanded
        }

        var rootCategoryTitle: String? {
            return rootCategory?.title
        }

        /// 恢复只需要保证分类已展开，不对已经展开的持久化状态重复切换。
        func expansionRequired(current: Action?) -> Bool? {
            guard let key = rootCategoryKey, let current, current.rootCategoryKey == key,
                  let expanded = current.rootCategoryExpanded else {
                return nil
            }
            return !expanded
        }

        private var rootCategory: (key: String, title: String, expanded: Bool)? {
            guard kind == "tap" || kind == "tapHeader" else {
                return nil
            }
            let parts = displayLabel.components(separatedBy: "·").map {
                $0.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            guard let countIndex = parts.firstIndex(where: {
                $0.range(of: #"^[0-9]+\s*个\s*Demo$"#, options: .regularExpression) != nil
            }), parts.indices.contains(countIndex + 1),
                  ["点击展开", "已展开"].contains(parts[countIndex + 1]) else {
                return nil
            }
            let count = parts[countIndex].filter(\.isNumber)
            let suffix = "(\(count))"
            let titles = ([targetLabel] + parts).filter {
                $0.hasSuffix(suffix) && $0.count > suffix.count
            }
            guard let title = titles.first else {
                return nil
            }
            let stableTitle = title.replacingOccurrences(of: #"\s+"#, with: " ", options: .regularExpression)
            return ("category|\(stableTitle)", stableTitle, parts[countIndex + 1] == "已展开")
        }
    }

    private struct Page {

        let path: [Action]
        var signature: String
        var actions: [Action]
        var cursor: Int = 0
        var attemptedKeys: Set<String> = []
        var rootPreparation: [Action]

        init(path: [Action], signature: String, actions: [Action], rootPreparation: [Action]? = nil) {
            self.path = path
            self.signature = signature
            self.actions = actions
            self.rootPreparation = rootPreparation ?? []
            if path.isEmpty && rootPreparation == nil {
                replaceRootPreparation(actions)
            }
        }

        var rootPreparationKeys: Set<String> {
            return Set(rootPreparation.compactMap(\.rootCategoryKey))
        }

        mutating func nextAction() -> Action? {
            while cursor < actions.count {
                let action = actions[cursor]
                cursor += 1
                let key = path.isEmpty ? action.rootCategoryKey ?? action.key : action.key
                if attemptedKeys.insert(key).inserted {
                    return action
                }
            }
            return nil
        }

        /// 分类改变后只更新当前根页，已尝试的分类和控件不会因刷新重复入队。
        mutating func refreshRoot(after action: Action, actions: [Action], signature: String) -> Bool {
            guard path.isEmpty, action.rootCategoryKey != nil else {
                return false
            }
            self.actions = actions
            self.signature = signature
            replaceRootPreparation(actions)
            cursor = 0
            return true
        }

        /// 互斥分类关闭旧内容时，给消失的未测 Demo 留下自己的可恢复根上下文。
        func displacedRootPage(after actions: [Action]) -> Page? {
            guard path.isEmpty else {
                return nil
            }
            let visibleKeys = Set(actions.map(\.key))
            let pending = self.actions.dropFirst(cursor).filter {
                $0.rootCategoryKey == nil && !attemptedKeys.contains($0.key) && !visibleKeys.contains($0.key)
            }
            guard !pending.isEmpty else {
                return nil
            }
            return Page(path: [], signature: signature, actions: pending, rootPreparation: rootPreparation)
        }

        /// 前置展开步骤与导航路径分别保存；子页冷启动恢复时仍能找到分类内的 Demo。
        private mutating func replaceRootPreparation(_ actions: [Action]) {
            rootPreparation = []
            for action in actions where action.rootCategoryExpanded == true {
                guard let key = action.rootCategoryKey else {
                    continue
                }
                if let index = rootPreparation.firstIndex(where: { $0.rootCategoryKey == key }) {
                    rootPreparation[index] = action
                } else {
                    rootPreparation.append(action)
                }
            }
            attemptedKeys.formUnion(rootPreparationKeys)
        }
    }

    private struct SummaryState {

        var started = false
        var emitted = false

        mutating func consumeReason(_ reason: String, failures: Int, launchPending: Bool) -> String? {
            guard started, !emitted else {
                return nil
            }
            emitted = true
            let explicitFailures = ["suspected_exit", "application_unavailable", "launch_failed", "no_accessible_controls", "snapshot_failed"]
            if failures > 0 && !explicitFailures.contains(reason) {
                return launchPending ? "launch_failed" : "test_failure"
            }
            return reason
        }
    }

    private enum CategoryPreparationResult {

        case alreadyExpanded
        case expanded
        case unavailable

        var isReady: Bool {
            return self != .unavailable
        }
    }

    private struct UnidentifiedElement {

        let displayLabel: String
        let exists: Bool
        let isHittable: Bool

        /// 只对唯一的完整文字迁移位置；重复或空文字仍严格校验原索引。
        static func matchingIndex(_ expected: String, priorIndex: Int, candidates: [UnidentifiedElement]) -> Int? {
            let matches = candidates.indices.filter {
                candidates[$0].exists && candidates[$0].displayLabel == expected
            }
            if !expected.isEmpty && matches.count == 1 {
                let index = matches[0]
                return candidates[index].isHittable ? index : nil
            }
            guard candidates.indices.contains(priorIndex), candidates[priorIndex].exists,
                  candidates[priorIndex].isHittable, candidates[priorIndex].displayLabel == expected else {
                return nil
            }
            return priorIndex
        }
    }

    private enum SnapshotKind {

        case window, keyboard, cell, button, toggle, textField
        case table, collectionView, scrollView, staticText, other
    }

    private struct SnapshotNode {

        let kind: SnapshotKind
        let type: UInt
        let identifier: String
        let label: String
        let frame: CGRect
        let isEnabled: Bool
        let children: [SnapshotNode]
    }

    /// 仅处理公开快照的内存数据；遍历期间不向当前 UI 发起逐控件属性请求。
    private struct SnapshotTree {

        struct Entry {

            let node: SnapshotNode
            let bounds: CGRect
        }

        struct Candidates {

            var controls: [Action] = []
            var scrolls: [Action] = []
            var blocked = 0
        }

        let entries: [Entry]
        let keyboardFrames: [CGRect]
        let viewportValid: Bool

        init(root: SnapshotNode, canContinue: () -> Bool) {
            let windows = Self.descendants(root).filter { $0.kind == .window && Self.usable($0.frame) }
            let windowUnion = windows.reduce(CGRect.null) { $0.union($1.frame) }
            let viewport = Self.usable(root.frame) ? root.frame : windowUnion
            viewportValid = Self.usable(viewport)
            var captured: [Entry] = []
            func visit(_ node: SnapshotNode, bounds: CGRect) {
                guard canContinue() else {
                    return
                }
                let currentBounds = node.kind == .window ? (Self.usable(node.frame) ? bounds.intersection(node.frame) : .null) : bounds
                captured.append(Entry(node: node, bounds: currentBounds))
                for child in node.children {
                    visit(child, bounds: currentBounds)
                }
            }
            for child in root.children {
                visit(child, bounds: viewport)
            }
            entries = captured
            keyboardFrames = captured.filter { $0.node.kind == .keyboard }.map { $0.node.frame.intersection($0.bounds) }.filter(Self.usable)
        }

        static func usable(_ frame: CGRect) -> Bool {
            return !frame.isNull && !frame.isInfinite && frame.width > 0 && frame.height > 0 &&
                frame.origin.x.isFinite && frame.origin.y.isFinite && frame.width.isFinite && frame.height.isFinite
        }

        private static func descendants(_ node: SnapshotNode) -> [SnapshotNode] {
            return node.children.flatMap { [$0] + descendants($0) }
        }

        static func displayLabel(_ node: SnapshotNode) -> String {
            if !node.label.isEmpty {
                return node.label
            }
            return descendants(node).filter { $0.kind == .staticText }.prefix(6).map(\.label).joined(separator: " · ")
        }

        private static func headerTexts(_ node: SnapshotNode) -> [SnapshotNode] {
            return node.children.flatMap { child -> [SnapshotNode] in
                guard child.kind != .cell else {
                    return []
                }
                return (child.kind == .staticText ? [child] : []) + headerTexts(child)
            }
        }

        func visible(_ frame: CGRect, bounds: CGRect) -> Bool {
            guard Self.usable(frame), Self.usable(bounds), Self.usable(frame.intersection(bounds)) else {
                return false
            }
            let center = CGPoint(x: frame.midX, y: frame.midY)
            return !keyboardFrames.contains { $0.contains(center) }
        }

        func candidates(blockedWords: [String], canContinue: () -> Bool) -> Candidates {
            var result = Candidates()
            let groups: [(SnapshotKind, String)] = [(.cell, "tap"), (.button, "tap"), (.toggle, "tap"), (.textField, "type")]
            for (kind, actionKind) in groups {
                var occurrences: [String: Int] = [:]
                for (index, entry) in entries.filter({ $0.node.kind == kind }).enumerated() {
                    guard canContinue() else {
                        return result
                    }
                    let node = entry.node
                    let identity = node.identifier.isEmpty ? "label:\(node.label)" : "id:\(node.identifier)"
                    let occurrence = occurrences[identity, default: 0]
                    occurrences[identity] = occurrence + 1
                    guard node.isEnabled, Self.usable(node.frame), Self.usable(node.frame.intersection(entry.bounds)) else {
                        continue
                    }
                    let display = Self.displayLabel(node)
                    let nested = kind == .cell && Self.descendants(node).contains { $0.kind == .cell }
                    var action = Action(kind: nested ? "tapHeader" : actionKind, type: node.type, id: node.identifier, label: node.label, displayLabel: display, index: index, occurrence: occurrence, targetLabel: "")
                    var hitFrame = node.frame
                    if nested {
                        let title = action.rootCategoryTitle
                        let texts = Self.headerTexts(node).filter { !$0.label.isEmpty }
                        let possibleHeaders = texts.filter { text in
                            let normalized = text.label.replacingOccurrences(of: #"\s+"#, with: " ", options: .regularExpression)
                            return (title == nil || normalized == title) && visible(text.frame, bounds: entry.bounds)
                        }
                        guard let header = possibleHeaders.first,
                              possibleHeaders.filter({ $0.label == header.label }).count == 1 else {
                            continue
                        }
                        hitFrame = header.frame
                        action = Action(kind: "tapHeader", type: node.type, id: node.identifier, label: node.label, displayLabel: display, index: index, occurrence: occurrence, targetLabel: header.label)
                    }
                    guard visible(hitFrame, bounds: entry.bounds) else {
                        continue
                    }
                    let sensitiveText = "\(node.identifier) \(display) \(action.targetLabel)".lowercased()
                    guard !blockedWords.contains(where: { sensitiveText.contains($0) }) else {
                        result.blocked += 1
                        continue
                    }
                    result.controls.append(action)
                }
            }
            for kind in [SnapshotKind.table, .collectionView, .scrollView] {
                var occurrences: [String: Int] = [:]
                for (index, entry) in entries.filter({ $0.node.kind == kind }).enumerated() {
                    guard canContinue() else {
                        return result
                    }
                    let node = entry.node
                    let identity = node.identifier.isEmpty ? "label:\(node.label)" : "id:\(node.identifier)"
                    let occurrence = occurrences[identity, default: 0]
                    occurrences[identity] = occurrence + 1
                    guard node.isEnabled, visible(node.frame, bounds: entry.bounds) else {
                        continue
                    }
                    result.scrolls.append(Action(kind: "swipeUp", type: node.type, id: node.identifier, label: node.label, displayLabel: Self.displayLabel(node), index: index, occurrence: occurrence, targetLabel: ""))
                }
            }
            return result
        }

        func unidentifiedElements(type: UInt) -> [UnidentifiedElement] {
            return entries.filter { $0.node.type == type }.map { entry in
                UnidentifiedElement(displayLabel: Self.displayLabel(entry.node), exists: true, isHittable: visible(entry.node.frame, bounds: entry.bounds))
            }
        }

        func uniqueNamedIndex(for action: Action) -> Int? {
            let matches = entries.filter { $0.node.type == action.type }.enumerated().filter { _, entry in
                action.matchesIdentity(identifier: entry.node.identifier, label: entry.node.label, displayLabel: Self.displayLabel(entry.node))
            }
            return matches.count == 1 ? matches[0].offset : nil
        }

        static func description(_ node: SnapshotNode, depth: Int = 0) -> String {
            let line = String(repeating: "  ", count: depth) + "type=\(node.type) id=\(node.identifier) label=\(node.label) enabled=\(node.isEnabled) frame=\(node.frame)"
            return ([line] + node.children.map { description($0, depth: depth + 1) }).joined(separator: "\n")
        }
    }

    private var app: XCUIApplication!
    private var bundleID = ""
    private var seed: UInt64 = 1
    private var randomState: UInt64 = 1
    private var maxSteps = 100
    private var maxSeconds: TimeInterval = 180
    private var maxDepth = 8
    private var startedAt = Date()
    private var step = 0
    private var skipped = 0
    private var restarts = 0
    private var stopReason = "exhausted"
    private var history: [[String: Any]] = []
    private var lastTree = ""
    private var knownStates: Set<String> = []
    private var livePath: [String]? = []
    private var summaryState = SummaryState()
    private var launchPending = false
    private var preparedRootCategories: Set<String> = []
    private var coverageSceneID = ""
    private var coverageRoute = ""
    private var coverageManifestDigest = ""
    private var coverageExpectedSteps = 0
    private var coverageCompletedSteps: Set<Int> = []
    private var coverageReady = false
    private var coveragePassed = false
    private var coverageFinished = false
    private var coverageFailureReason = ""
    private var coverageObservations: [String: String] = [:]
    private let blockedWords = [
        "删除", "清空", "清除", "重置", "卸载", "格式化", "注销", "退出登录", "退出应用", "退出程序",
        "支付", "付款", "购买", "下单", "充值", "转账", "提现", "发送", "发布", "上传", "提交",
        "delete", "erase", "reset", "remove", "uninstall", "format", "logout", "log out", "sign out",
        "pay", "purchase", "checkout", "buy", "transfer", "send", "publish", "upload", "submit"
    ]

    /// 采用广度顺序逐项操作；重启并重放入口路径，避免一直滞留在某个深层页面。
    func testExplore() throws {
        continueAfterFailure = false
        let environment = ProcessInfo.processInfo.environment
        bundleID = environment["JOBS_CRAWL_BUNDLE_ID"] ?? ""
        guard !bundleID.isEmpty else {
            XCTFail("缺少 JOBS_CRAWL_BUNDLE_ID，请从配套自动巡检 command 启动。")
            return
        }
        maxSteps = boundedInteger(environment["JOBS_CRAWL_STEPS"], fallback: 100, range: 1...10000)
        maxSeconds = TimeInterval(boundedInteger(environment["JOBS_CRAWL_SECONDS"], fallback: 180, range: 1...14400))
        maxDepth = boundedInteger(environment["JOBS_CRAWL_DEPTH"], fallback: 8, range: 1...30)
        seed = UInt64(environment["JOBS_CRAWL_SEED"] ?? "1") ?? 1
        randomState = seed == 0 ? 1 : seed
        executionTimeAllowance = maxSeconds + 120
        startedAt = Date()
        app = XCUIApplication(bundleIdentifier: bundleID)
        summaryState.started = true
        emit("started", extra: ["maxSteps": maxSteps, "maxSeconds": maxSeconds, "maxDepth": maxDepth, "runnerPID": ProcessInfo.processInfo.processIdentifier])
        defer {
            finishSummaryIfNeeded()
            attachHistory(name: "操作路径与巡检参数")
        }
        guard launchRoot() else {
            return
        }
        let firstActions = discoverActions()
        guard hasBudget() else {
            return
        }
        guard !firstActions.isEmpty else {
            stopReason = "no_accessible_controls"
            captureState(name: "入口页面")
            XCTFail("入口页面没有可操作的语义控件，请先进入 Demo 列表，或补充目标 App 的可访问性标识。")
            return
        }
        let firstSignature = signature(for: firstActions)
        guard hasBudget() else {
            return
        }
        knownStates.insert(firstSignature)
        captureState(name: "入口页面")
        var pages = [Page(path: [], signature: firstSignature, actions: firstActions)]
        preparedRootCategories = pages[0].rootPreparationKeys
        var pageIndex = 0
        while pageIndex < pages.count && hasBudget() {
            let path = pages[pageIndex].path
            guard let action = pages[pageIndex].nextAction() else {
                pageIndex += 1
                continue
            }
            guard restore(path: path, rootPreparation: pages[pageIndex].rootPreparation, expectedSignature: pages[pageIndex].signature) else {
                if stopReason == "suspected_exit" || !hasBudget() {
                    break
                }
                skipped += pages[pageIndex].actions.count - pages[pageIndex].cursor + 1
                pageIndex += 1
                continue
            }
            guard hasBudget() else {
                break
            }
            if path.isEmpty && action.rootCategoryKey != nil {
                let preparation = prepareRootCategory(action, replay: false)
                guard preparation.isReady else {
                    if !hasBudget() {
                        break
                    }
                    skipped += 1
                    continue
                }
                guard hasBudget() else {
                    break
                }
                let nextActions = discoverActions()
                guard hasBudget() else {
                    break
                }
                let nextSignature = signature(for: nextActions)
                guard hasBudget() else {
                    break
                }
                if preparation == .expanded, let displaced = pages[pageIndex].displacedRootPage(after: nextActions) {
                    pages.append(displaced)
                }
                _ = pages[pageIndex].refreshRoot(after: action, actions: nextActions, signature: nextSignature)
                preparedRootCategories = pages[pageIndex].rootPreparationKeys
                livePath = []
                if knownStates.insert(nextSignature).inserted {
                    captureState(name: "分类状态-\(knownStates.count)-步骤\(step)")
                }
                continue
            }
            guard perform(action, replay: false) else {
                if stopReason == "suspected_exit" {
                    break
                }
                skipped += 1
                continue
            }
            guard hasBudget() else {
                break
            }
            let nextActions = discoverActions()
            guard hasBudget() else {
                break
            }
            let nextSignature = signature(for: nextActions)
            guard hasBudget() else {
                break
            }
            if nextSignature == pages[pageIndex].signature {
                livePath = path.map(\.key)
                continue
            }
            let nextPath = path + [action]
            livePath = nextPath.map(\.key)
            let navigationDepth = nextPath.filter { $0.kind != "swipeUp" && $0.kind != "tapHeader" }.count
            if navigationDepth <= maxDepth && knownStates.insert(nextSignature).inserted {
                pages.append(Page(path: nextPath, signature: nextSignature, actions: nextActions, rootPreparation: pages[pageIndex].rootPreparation))
                captureState(name: "界面状态-\(knownStates.count)-步骤\(step)")
            }
        }
        if stopReason == "suspected_exit" {
            XCTFail("目标 App 疑似异常退出；请结合最后操作、截图和系统崩溃日志确认。")
        } else if stopReason == "application_unavailable" {
            XCTFail("目标 App 无法恢复前台或状态不可观测，本次巡检未完成；请查看最后操作和测试日志。")
        }
    }

    /// XCTest 的意外失败也保留操作前已刷出的路径，避免只剩一条模糊的超时错误。
    override func tearDown() {
        finishCoverageSceneIfNeeded()
        finishSummaryIfNeeded()
        if (testRun?.totalFailureCount ?? 0) > 0 && app != nil {
            attachHistory(name: "失败时操作路径")
            attachScreenshot(name: "失败时屏幕")
        }
        super.tearDown()
    }

    /// XCTest 中止用例时可能跳过 Swift defer；先写纯数据，附件故障不影响已写摘要。
    private func finishSummaryIfNeeded() {
        let failures = testRun?.totalFailureCount ?? 0
        guard let reason = summaryState.consumeReason(stopReason, failures: failures, launchPending: launchPending) else {
            return
        }
        stopReason = reason
        emit("summary", extra: [
            "actions": step,
            "uniqueStates": knownStates.count,
            "skipped": skipped,
            "restarts": restarts,
            "stopReason": stopReason,
            "testFailureCount": failures
        ])
    }

    /// 对输入做上限约束，避免配置错误造成无期限测试。
    private func boundedInteger(_ value: String?, fallback: Int, range: ClosedRange<Int>) -> Int {
        guard let value, let number = Int(value), range.contains(number) else {
            return fallback
        }
        return number
    }

    /// 操作和路径重放共用预算；系统等待可能延迟检查，另由 XCTest 外层超时兜底。
    private func hasBudget() -> Bool {
        guard !["suspected_exit", "application_unavailable", "launch_failed", "snapshot_failed"].contains(stopReason) else {
            return false
        }
        guard step < maxSteps else {
            stopReason = "budget"
            return false
        }
        guard Date().timeIntervalSince(startedAt) < maxSeconds else {
            stopReason = "time"
            return false
        }
        return true
    }

    /// 只重启目标进程；launch 内部等待由 XCTest 控制，12 秒仅限制返回后的前台等待。
    private func launchRoot() -> Bool {
        launchPending = true
        emit("action", extra: ["phase": "planned", "action": ["kind": "launch"], "restart": restarts])
        if app.state != .notRunning {
            app.terminate()
        }
        app.launch()
        restarts += 1
        livePath = []
        preparedRootCategories = []
        guard app.wait(for: .runningForeground, timeout: 12) else {
            inspectApplicationState(context: "启动后没有进入前台")
            if stopReason != "suspected_exit" {
                stopReason = "launch_failed"
                XCTFail("目标 App 启动调用返回后，未在 12 秒内进入前台，请检查启动流程或系统权限弹窗。")
            } else {
                XCTFail("目标 App 启动后疑似异常退出，请检查启动日志。")
            }
            return false
        }
        launchPending = false
        emit("action", extra: ["phase": "completed", "action": ["kind": "launch"], "restart": restarts])
        return true
    }

    /// 重放精确入口；界面与记录不符时跳过该分支，不将错误入口算作已测页面。
    private func restore(path: [Action], rootPreparation: [Action], expectedSignature: String) -> Bool {
        if livePath == path.map(\.key) {
            if path.isEmpty && !prepareRoot(rootPreparation) {
                return false
            }
            return inspectApplicationState(context: "继续当前页面")
        }
        guard hasBudget(), launchRoot() else {
            return false
        }
        guard prepareRoot(rootPreparation) else {
            return false
        }
        for action in path {
            guard hasBudget(), perform(action, replay: true) else {
                return false
            }
        }
        let actions = discoverActions()
        guard hasBudget() else {
            return false
        }
        let actual = signature(for: actions)
        guard hasBudget() else {
            return false
        }
        guard actual == expectedSignature else {
            emit("replay_mismatch", extra: ["expectedState": expectedSignature, "actualState": actual, "path": path.map(\.dictionary)])
            // 偏好与根列表展开状态可能跨启动保留；根入口仍可按已记录标识继续尝试。
            if path.isEmpty {
                livePath = []
                return true
            }
            livePath = nil
            return false
        }
        livePath = path.map(\.key)
        return true
    }

    private func prepareRoot(_ actions: [Action]) -> Bool {
        for action in actions {
            guard hasBudget(), prepareRootCategory(action, replay: true).isReady else {
                return false
            }
        }
        guard hasBudget() else {
            return false
        }
        let required = Set(actions.compactMap(\.rootCategoryKey))
        guard required.isSubset(of: preparedRootCategories) else {
            emit("skipped", extra: ["reason": "root_preparation_mismatch", "replay": true])
            return false
        }
        return true
    }

    /// 按当前可观察状态恢复分类；无法确认时跳过分支，不盲点已展开的标题。
    private func prepareRootCategory(_ expected: Action, replay: Bool) -> CategoryPreparationResult {
        guard let key = expected.rootCategoryKey else {
            return .unavailable
        }
        if preparedRootCategories.contains(key) {
            return .alreadyExpanded
        }
        var observedActions = discoverActions()
        guard hasBudget() else {
            return .unavailable
        }
        let current = observedActions.first(where: { $0.rootCategoryKey == key })
        guard let expand = expected.expansionRequired(current: current), let current else {
            emit("skipped", extra: ["reason": "root_category_unavailable", "category": key, "replay": replay])
            return .unavailable
        }
        if expand {
            guard perform(current, replay: replay) else {
                return .unavailable
            }
            observedActions = discoverActions()
            guard hasBudget() else {
                return .unavailable
            }
            let observed = observedActions.first(where: { $0.rootCategoryKey == key })
            guard expected.expansionRequired(current: observed) == false else {
                emit("skipped", extra: ["reason": "root_category_not_expanded", "category": key, "replay": replay])
                return .unavailable
            }
        }
        preparedRootCategories = Set(observedActions.filter { $0.rootCategoryExpanded == true }.compactMap(\.rootCategoryKey))
        emit("root_prepared", extra: ["category": key, "alreadyExpanded": !expand, "replay": replay])
        return expand ? .expanded : .alreadyExpanded
    }

    /// 一次采集公开快照，候选发现与敏感词筛选只遍历快照内存数据。
    private func discoverActions() -> [Action] {
        guard let tree = captureSnapshot(context: "发现可操作控件") else {
            return []
        }
        let plan = tree.candidates(blockedWords: blockedWords, canContinue: hasBudget)
        skipped += plan.blocked
        var actions = plan.controls
        if actions.count > 1 {
            for index in stride(from: actions.count - 1, through: 1, by: -1) {
                guard hasBudget() else {
                    return actions + plan.scrolls
                }
                actions.swapAt(index, Int(nextRandom() % UInt64(index + 1)))
            }
        }
        return actions + plan.scrolls
    }

    private func captureSnapshot(context: String) -> SnapshotTree? {
        guard hasBudget() else {
            return nil
        }
        emit("snapshot", extra: ["phase": "planned", "context": context])
        do {
            let captured = try app.snapshot()
            guard hasBudget() else {
                return nil
            }
            let root = snapshotNode(captured)
            let tree = SnapshotTree(root: root, canContinue: hasBudget)
            guard hasBudget() else {
                return nil
            }
            guard tree.viewportValid else {
                recordSnapshotFailure("公开快照缺少有效应用或窗口范围。")
                return nil
            }
            lastTree = SnapshotTree.description(root)
            emit("snapshot", extra: ["phase": "completed", "context": context, "nodes": tree.entries.count])
            return tree
        } catch {
            recordSnapshotFailure(error.localizedDescription)
            return nil
        }
    }

    /// Snapshot 属性来自同一次不可变采集，不读取实时 XCUIElement 属性。
    private func snapshotNode(_ snapshot: XCUIElementSnapshot) -> SnapshotNode {
        let kind: SnapshotKind
        switch snapshot.elementType {
        case .window:
            kind = .window
        case .keyboard:
            kind = .keyboard
        case .cell:
            kind = .cell
        case .button:
            kind = .button
        case .switch:
            kind = .toggle
        case .textField:
            kind = .textField
        case .table:
            kind = .table
        case .collectionView:
            kind = .collectionView
        case .scrollView:
            kind = .scrollView
        case .staticText:
            kind = .staticText
        default:
            kind = .other
        }
        var children: [SnapshotNode] = []
        for child in snapshot.children {
            guard hasBudget() else {
                break
            }
            children.append(snapshotNode(child))
        }
        return SnapshotNode(kind: kind, type: snapshot.elementType.rawValue, identifier: snapshot.identifier, label: snapshot.label, frame: snapshot.frame, isEnabled: snapshot.isEnabled, children: children)
    }

    private func recordSnapshotFailure(_ reason: String) {
        stopReason = "snapshot_failed"
        emit("snapshot_failed", extra: ["reason": reason])
        XCTFail("读取界面公开快照失败：\(reason)")
    }

    /// 无标签的自定义 Cell 用子文字补充日志描述，仍保留原始定位字段。
    private func displayLabel(for element: XCUIElement) -> String {
        if !element.label.isEmpty {
            return element.label
        }
        return element.staticTexts.allElementsBoundByAccessibilityElement.prefix(6).filter(\.exists).map(\.label).joined(separator: " · ")
    }

    /// 跳过可识别的敏感动作；无语义图标不能据此保证没有副作用。
    private func isBlocked(_ text: String) -> Bool {
        let lowercased = text.lowercased()
        return blockedWords.contains { lowercased.contains($0) }
    }

    /// 标签、标识和同名序号优先于索引；不在定位失败时改用任意坐标。
    private func resolve(_ action: Action) -> XCUIElement? {
        guard let type = XCUIElement.ElementType(rawValue: action.type) else {
            return nil
        }
        let query = app.descendants(matching: type)
        if action.usesDisplayIdentity {
            if action.index >= 0 {
                let prior = query.element(boundBy: action.index)
                if prior.exists, prior.isHittable, displayLabel(for: prior) == action.displayLabel {
                    return prior
                }
            }
            guard let tree = captureSnapshot(context: "重新定位匿名控件") else {
                return nil
            }
            let identities = tree.unidentifiedElements(type: action.type)
            guard let index = UnidentifiedElement.matchingIndex(action.displayLabel, priorIndex: action.index, candidates: identities) else {
                return nil
            }
            let candidate = query.element(boundBy: index)
            guard candidate.exists, candidate.isHittable, displayLabel(for: candidate) == action.displayLabel else {
                return nil
            }
            return candidate
        }
        let candidates = query.matching(NSPredicate(format: "identifier == %@ AND label == %@", action.id, action.label))
        let count = candidates.count
        let candidate: XCUIElement
        if count == 1 {
            candidate = candidates.element(boundBy: 0)
        } else if count > 1 {
            guard let tree = captureSnapshot(context: "确认重复标识控件的唯一内容"),
                  let index = tree.uniqueNamedIndex(for: action) else {
                return nil
            }
            candidate = query.element(boundBy: index)
        } else {
            return nil
        }
        guard candidate.exists, candidate.isHittable,
              action.matchesIdentity(identifier: candidate.identifier, label: candidate.label, displayLabel: displayLabel(for: candidate)) else {
            return nil
        }
        return candidate
    }

    /// 动作前先落日志；框架在 tap / typeText 内失败时仍能找到最后一步。
    private func perform(_ action: Action, replay: Bool) -> Bool {
        guard hasBudget(), inspectApplicationState(context: "动作前") else {
            return false
        }
        guard let element = resolve(action), element.isEnabled, element.isHittable else {
            emit("skipped", extra: ["reason": "element_unavailable", "action": action.dictionary, "replay": replay])
            return false
        }
        if action.kind != "swipeUp" && isBlocked("\(element.identifier) \(displayLabel(for: element))") {
            emit("skipped", extra: ["reason": "blocked_current_control", "action": action.dictionary, "replay": replay])
            return false
        }
        if action.kind == "tap" && action.type == XCUIElement.ElementType.cell.rawValue && element.descendants(matching: .cell).count > 0 {
            emit("skipped", extra: ["reason": "container_layout_changed", "action": action.dictionary, "replay": replay])
            return false
        }
        var tapTarget = element
        if action.kind == "tapHeader" {
            let titles = element.staticTexts.matching(NSPredicate(format: "label == %@", action.targetLabel))
            guard titles.count == 1 else {
                emit("skipped", extra: ["reason": "header_unavailable_or_ambiguous", "action": action.dictionary, "replay": replay])
                return false
            }
            tapTarget = titles.element(boundBy: 0)
            guard tapTarget.exists, tapTarget.isHittable else {
                emit("skipped", extra: ["reason": "header_unavailable", "action": action.dictionary, "replay": replay])
                return false
            }
            if isBlocked("\(tapTarget.identifier) \(displayLabel(for: tapTarget))") {
                emit("skipped", extra: ["reason": "blocked_current_header", "action": action.dictionary, "replay": replay])
                return false
            }
        }
        step += 1
        let planned: [String: Any] = ["phase": "planned", "action": action.dictionary, "replay": replay]
        history.append(["step": step, "elapsedSeconds": elapsedSeconds, "action": action.dictionary, "replay": replay])
        emit("action", extra: planned)
        XCTContext.runActivity(named: "\(step) \(replay ? "重放" : "探索") \(action.kind) \(action.displayLabel.prefix(100))") { _ in
            switch action.kind {
            /// 测试文本不包含换行，避免触发键盘上的发送或提交。
            case "type":
                element.tap()
                element.typeText("JobsTest\(seed % 1000)")
            /// 浏览列表下方尚未进入视野的控件。
            case "swipeUp":
                element.swipeUp()
            /// 内嵌列表的外层 Cell 中心属于子项，只点分类标题避免落到子 Demo。
            case "tapHeader":
                tapTarget.tap()
            /// 点击已有语义控件，包括页签、折叠按钮和普通 Cell。
            default:
                element.tap()
            }
        }
        guard inspectApplicationState(context: "动作后") else {
            return false
        }
        emit("action", extra: ["phase": "completed", "action": action.dictionary, "replay": replay])
        return true
    }

    /// 系统切后台先尝试回到 App；仅 notRunning 标记疑似退出，交由系统日志确认原因。
    @discardableResult
    private func inspectApplicationState(context: String, allowBackgroundRecovery: Bool = true) -> Bool {
        switch app.state {
        /// 不在运行不能单独证明是代码崩溃，也可能是系统终止或显式退出。
        case .notRunning:
            stopReason = "suspected_exit"
            emit("suspected_exit", extra: ["context": context, "applicationState": "notRunning"])
            attachScreenshot(name: "疑似退出时屏幕")
            attachHistory(name: "疑似退出前操作路径")
            return false
        /// 外部页面或系统界面可能临时将目标置于后台。
        case .runningBackground, .runningBackgroundSuspended:
            emit("background", extra: ["context": context])
            guard allowBackgroundRecovery else {
                stopReason = "application_unavailable"
                emit("application_unavailable", extra: ["reason": "unexpected_background", "context": context])
                return false
            }
            app.activate()
            guard app.wait(for: .runningForeground, timeout: 8) else {
                stopReason = "application_unavailable"
                emit("application_unavailable", extra: ["reason": "foreground_restore_failed", "context": context])
                return false
            }
            return true
        /// 前台继续由可访问性树验证本次界面。
        case .runningForeground:
            return true
        /// 未知状态交给 XCTest 报告，不伪造正常探索结果。
        default:
            stopReason = "application_unavailable"
            emit("application_unavailable", extra: ["reason": "unknown_application_state", "context": context])
            return false
        }
    }

    /// 忽略时钟文本并稳定排序；状态数代表控件签名数，不是页面总数。
    private func signature(for actions: [Action]) -> String {
        let controls = actions.map { action in
            let text = "\(action.kind)|\(action.type)|\(action.id)|\(action.displayLabel)"
            return text.replacingOccurrences(of: #"\b\d{1,2}:\d{2}(?::\d{2})?\b"#, with: "<clock>", options: .regularExpression)
        }.sorted().joined(separator: "\n")
        let navigation = app.navigationBars.allElementsBoundByAccessibilityElement.filter(\.exists).map(\.identifier).sorted().joined(separator: "|")
        var hash: UInt64 = 14695981039346656037
        for byte in (navigation + "\n" + controls).utf8 {
            hash = (hash ^ UInt64(byte)) &* 1099511628211
        }
        return String(hash, radix: 16)
    }

    /// 稳定伪随机只控制当前控件顺序，不承诺应用外部状态可复现。
    private func nextRandom() -> UInt64 {
        randomState ^= randomState << 13
        randomState ^= randomState >> 7
        randomState ^= randomState << 17
        return randomState
    }

    private var elapsedSeconds: Double {
        return (Date().timeIntervalSince(startedAt) * 100).rounded() / 100
    }

    /// 控制台事件可被 command 提取成逐行 JSON；刷出后再进入可能失败的系统调用。
    private func emit(_ event: String, extra: [String: Any] = [:]) {
        var payload: [String: Any] = ["event": event, "bundleID": bundleID, "seed": String(seed), "step": step, "elapsedSeconds": elapsedSeconds]
        payload.merge(extra) { _, new in new }
        guard let data = try? JSONSerialization.data(withJSONObject: payload, options: [.sortedKeys]),
              let json = String(data: data, encoding: .utf8) else {
            return
        }
        print("JOBS_CRAWL_EVENT \(json)")
        fflush(stdout)
    }

    /// 截取整个模拟器屏幕，目标已退出时仍可保留系统现场。
    private func attachScreenshot(name: String) {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    /// 在界面仍可响应时保留树，故障后直接使用最后快照，避免再次请求已挂起的 App。
    private func captureState(name: String) {
        attachScreenshot(name: name)
    }

    /// 路径保存为附件，Xcode 的测试结果可直接查看或导出。
    private func attachHistory(name: String) {
        let payload: [String: Any] = [
            "bundleID": bundleID,
            "seed": String(seed),
            "actions": history,
            "stopReason": stopReason,
            "uniqueStates": knownStates.count,
            "maxSteps": maxSteps,
            "maxSeconds": maxSeconds,
            "maxDepth": maxDepth
        ]
        guard let data = try? JSONSerialization.data(withJSONObject: payload, options: [.prettyPrinted, .sortedKeys]) else {
            return
        }
        let attachment = XCTAttachment(data: data, uniformTypeIdentifier: "public.json")
        attachment.name = name + ".json"
        attachment.lifetime = .keepAlways
        add(attachment)
        if !lastTree.isEmpty {
            let tree = XCTAttachment(string: lastTree)
            tree.name = "最后已见界面树.txt"
            tree.lifetime = .keepAlways
            add(tree)
        }
    }
}

// 确定性场景与补充探索共用独立 Runner；每个生成方法由 XCTest 单独记账。
extension JobsCrashCrawlerTests {

    private struct CoverageScene: Decodable {

        let id: String
        let title: String
        let kind: String
        let route: String
        let steps: [CoverageStep]
    }

    private struct CoverageStep: Decodable {

        let kind: String
        let target: String?
        let toTarget: String?
        let attribute: String?
        let container: String?
        let value: String?
        let from: [Double]?
        let to: [Double]?
        let seconds: Double?
        let scale: Double?
        let velocity: Double?
        let angle: Double?
    }

    private struct CoverageIssue: LocalizedError {

        let message: String

        var errorDescription: String? {
            return message
        }
    }

    /// 测试入口只接受编译时生成的结构化场景，无法执行配置里的任意代码。
    func runCoverageCase(base64JSON: String) throws {
        continueAfterFailure = false
        let environment = ProcessInfo.processInfo.environment
        bundleID = environment["JOBS_CRAWL_BUNDLE_ID"] ?? ""
        seed = UInt64(environment["JOBS_CRAWL_SEED"] ?? "1") ?? 1
        guard !bundleID.isEmpty,
              let data = Data(base64Encoded: base64JSON),
              let scene = try? JSONDecoder().decode(CoverageScene.self, from: data),
              !scene.id.isEmpty, !scene.route.isEmpty else {
            XCTFail("缺少当前 App 身份或确定性场景，请从配套脚本启动。")
            return
        }
        maxSeconds = TimeInterval(boundedInteger(environment["JOBS_CRAWL_SECONDS"], fallback: 180, range: 30...7200))
        executionTimeAllowance = maxSeconds + 120
        startedAt = Date()
        coverageSceneID = scene.id
        coverageRoute = scene.route
        coverageManifestDigest = environment["JOBS_COVERAGE_MANIFEST_DIGEST"] ?? ""
        coverageExpectedSteps = scene.steps.count
        coverageCompletedSteps = []
        coverageReady = false
        coverageFinished = false
        coverageFailureReason = ""
        coveragePassed = false
        coverageObservations = [:]
        summaryState.started = true
        app = XCUIApplication(bundleIdentifier: bundleID)
        app.launchArguments = ["--jobs-coverage-route", scene.route]
        emit("started", extra: ["mode": "coverage", "sceneID": scene.id, "runnerPID": ProcessInfo.processInfo.processIdentifier])
        coverageEvent("scene_started", extra: ["title": scene.title, "kind": scene.kind, "route": scene.route, "expectedSteps": scene.steps.count])
        defer {
            finishCoverageSceneIfNeeded()
            attachHistory(name: "确定性场景操作记录")
        }
        do {
            guard launchRoot() else {
                throw CoverageIssue(message: "目标 App 未正常进入前台。")
            }
            coverageEvent("step_started", extra: ["stepIndex": -1, "kind": "ready"])
            _ = try coverageElement("id:jobs.coverage.ready.\(scene.route)", timeout: 15)
            coverageReady = true
            coverageEvent("step_completed", extra: ["stepIndex": -1, "kind": "ready"])
            guard captureSnapshot(context: "确定性场景入口") != nil else {
                throw CoverageIssue(message: "目标页面快照未取得。")
            }
            captureState(name: "场景-\(scene.id)-入口")
            for (index, operation) in scene.steps.enumerated() {
                guard Date().timeIntervalSince(startedAt) < maxSeconds else {
                    throw CoverageIssue(message: "本场景用时到限，剩余步骤未执行。")
                }
                coverageEvent("step_started", extra: ["stepIndex": index, "kind": operation.kind, "target": operation.target ?? ""])
                history.append(["sceneID": scene.id, "stepIndex": index, "kind": operation.kind, "target": operation.target ?? ""])
                try executeCoverageStep(operation)
                guard inspectApplicationState(context: "确定性场景步骤后", allowBackgroundRecovery: false) else {
                    throw CoverageIssue(message: "操作后目标 App 已退出或无法恢复。")
                }
                coverageCompletedSteps.insert(index)
                coverageEvent("step_completed", extra: ["stepIndex": index, "kind": operation.kind])
            }
            guard (testRun?.totalFailureCount ?? 0) == 0 else {
                throw CoverageIssue(message: "本场景已有 XCTest 失败，不能记为通过。")
            }
            captureState(name: "场景-\(scene.id)-结束")
            guard inspectApplicationState(context: "确定性场景结束", allowBackgroundRecovery: false) else {
                throw CoverageIssue(message: "场景结束时目标 App 已退出或离开前台，不能记为通过。")
            }
            guard Date().timeIntervalSince(startedAt) < maxSeconds else {
                throw CoverageIssue(message: "本场景用时到限，不能按预算内完成记账。")
            }
            coveragePassed = true
            finishCoverageSceneIfNeeded()
        } catch {
            coverageFailureReason = error.localizedDescription
            if !inspectApplicationState(context: "确定性场景失败时", allowBackgroundRecovery: false) {
                coverageFailureReason = "失败时目标 App 已退出或离开前台；原始失败：\(coverageFailureReason)"
            }
            coverageEvent("scene_issue", extra: ["message": coverageFailureReason])
            XCTFail(coverageFailureReason)
        }
    }

    private func coverageEvent(_ event: String, extra: [String: Any] = [:]) {
        var fields = extra
        fields["sceneID"] = coverageSceneID
        fields["manifestDigest"] = coverageManifestDigest
        emit(event, extra: fields)
    }

    /// 只有 ready 与全部步骤完成才允许成功；系统杀进程时缺失的结尾由主机记为未完成。
    private func finishCoverageSceneIfNeeded() {
        guard !coverageSceneID.isEmpty, !coverageFinished else {
            return
        }
        coverageFinished = true
        let passed = coveragePassed && coverageReady && coverageCompletedSteps.count == coverageExpectedSteps && (testRun?.totalFailureCount ?? 0) == 0
        coverageEvent("scene_finished", extra: [
            "status": passed ? "passed" : "failed",
            "completedSteps": coverageCompletedSteps.sorted(),
            "ready": coverageReady,
            "reason": coverageFailureReason,
            "testFailureCount": testRun?.totalFailureCount ?? 0
        ])
    }

    /// 标识和文字都采用精确且唯一匹配，不能把相似按钮或另一个页面当作命中。
    private func coverageElement(_ target: String, timeout: TimeInterval = 8) throws -> XCUIElement {
        let target = target == "ready" ? "id:jobs.coverage.ready.\(coverageRoute)" : target
        let field: String
        let name: String
        if target.hasPrefix("id:") {
            field = "identifier"
            name = String(target.dropFirst(3))
        } else if target.hasPrefix("label:") {
            field = "label"
            name = String(target.dropFirst(6))
        } else {
            throw CoverageIssue(message: "目标必须使用 id: 或 label: 精确定位。")
        }
        guard !name.isEmpty else {
            throw CoverageIssue(message: "场景目标不能为空。")
        }
        let query = app.descendants(matching: .any).matching(NSPredicate(format: "%K == %@", field, name))
        guard query.firstMatch.waitForExistence(timeout: timeout), query.count == 1 else {
            throw CoverageIssue(message: "目标不存在或不唯一：\(target)。若 ready 缺失，请在 Xcode 重新运行更新后的主工程。")
        }
        return query.element(boundBy: 0)
    }

    private func executeCoverageStep(_ operation: CoverageStep) throws {
        if operation.kind == "wait" {
            let seconds = try coverageNumber(operation.seconds, fallback: 0.5, range: 0.01...5)
            RunLoop.current.run(until: Date().addingTimeInterval(seconds))
            return
        }
        guard let configuredTarget = operation.target else {
            throw CoverageIssue(message: "场景步骤缺少精确目标。")
        }
        let target = configuredTarget == "ready" ? "id:jobs.coverage.ready.\(coverageRoute)" : configuredTarget
        if operation.kind == "scrollTo" {
            guard let containerTarget = operation.container else {
                throw CoverageIssue(message: "滚动定位缺少精确容器。")
            }
            let container = try coverageElement(containerTarget)
            for direction in ["up", "down"] {
                for _ in 0..<6 {
                    if let candidate = try? coverageElement(target, timeout: 0.1), candidate.isHittable {
                        return
                    }
                    guard container.isHittable else {
                        throw CoverageIssue(message: "滚动容器不可交互。")
                    }
                    if direction == "up" {
                        container.swipeUp()
                    } else {
                        container.swipeDown()
                    }
                }
            }
            guard let candidate = try? coverageElement(target, timeout: 0.1), candidate.isHittable else {
                throw CoverageIssue(message: "限定滚动次数内目标仍不可交互：\(target)。")
            }
            return
        }
        if operation.kind == "expectGone" {
            let parts = target.split(separator: ":", maxSplits: 1).map(String.init)
            guard parts.count == 2, ["id", "label"].contains(parts[0]), !parts[1].isEmpty else {
                throw CoverageIssue(message: "消失断言缺少精确目标。")
            }
            let field = parts[0] == "id" ? "identifier" : "label"
            let query = app.descendants(matching: .any).matching(NSPredicate(format: "%K == %@", field, parts[1]))
            let deadline = Date().addingTimeInterval(8)
            while query.count > 0 && Date() < deadline {
                RunLoop.current.run(until: Date().addingTimeInterval(0.1))
            }
            guard query.count == 0 else {
                throw CoverageIssue(message: "目标仍然存在，返回或关闭尚未完成：\(target)。")
            }
            return
        }
        let needsInteraction = !["expect", "remember", "expectChanged"].contains(operation.kind)
        let element: XCUIElement
        if needsInteraction {
            element = try coverageInteractiveElement(target)
        } else {
            element = try coverageElement(target)
        }
        if operation.kind == "remember" {
            let observed = try coverageObservedValue(element, attribute: operation.attribute)
            coverageObservations[target + "|" + (operation.attribute ?? "default")] = observed
            coverageEvent("observation", extra: ["target": target, "attribute": operation.attribute ?? "default", "actual": String(observed.prefix(2000))])
            return
        }
        if operation.kind == "expectChanged" {
            guard let previous = coverageObservations[target + "|" + (operation.attribute ?? "default")] else {
                throw CoverageIssue(message: "变化断言之前没有登记原始状态：\(target)。")
            }
            let deadline = Date().addingTimeInterval(8)
            var current = previous
            while Date() < deadline {
                current = try coverageObservedValue(element, attribute: operation.attribute)
                if current != previous {
                    coverageEvent("observation", extra: ["target": target, "attribute": operation.attribute ?? "default", "before": String(previous.prefix(2000)), "actual": String(current.prefix(2000))])
                    return
                }
                RunLoop.current.run(until: Date().addingTimeInterval(0.1))
            }
            coverageEvent("observation", extra: ["target": target, "attribute": operation.attribute ?? "default", "before": String(previous.prefix(2000)), "actual": String(current.prefix(2000))])
            throw CoverageIssue(message: "操作后目标状态没有改变：\(target)，当前值=\(String(current.prefix(200)))。")
        }
        if operation.kind == "expect" {
            if let expected = operation.value {
                let observed = try coverageObservedValue(element, attribute: operation.attribute)
                coverageEvent("observation", extra: ["target": target, "attribute": operation.attribute ?? "default", "expected": String(expected.prefix(2000)), "actual": String(observed.prefix(2000))])
                guard observed == expected || (operation.attribute == nil && element.label == expected) else {
                    throw CoverageIssue(message: "目标文字或状态没有达到场景预期：\(target)，当前值=\(String(observed.prefix(200)))。")
                }
            }
            return
        }
        guard element.isEnabled, element.isHittable else {
            throw CoverageIssue(message: "已找到目标，但当前不可交互：\(target)。")
        }
        coverageEvent("step_target", extra: ["target": target, "frame": String(describing: element.frame)])
        step += 1
        switch operation.kind {
        /// 声明在场景清单中的普通点击，包括实际表单分支。
        case "tap", "back":
            if operation.kind == "tap", operation.from != nil {
                try coverageCoordinate(operation.from, in: element).tap()
            } else {
                element.tap()
            }
        /// 双击使用系统 UI 自动化手势。
        case "doubleTap":
            element.doubleTap()
        /// 长按时长在主机和 Runner 两侧约束。
        case "longPress":
            element.press(forDuration: try coverageNumber(operation.seconds, fallback: 1, range: 0.1...5))
        /// 测试文本不包含换行，防止隐式发送。
        case "type":
            guard let text = operation.value, !text.isEmpty, text.count <= 256,
                  !text.contains("\n"), !text.contains("\r") else {
                throw CoverageIssue(message: "测试输入为空、过长或包含换行。")
            }
            element.tap()
            element.typeText(text)
        /// 回车作为清单中的独立动作，不混入普通输入。
        case "pressReturn":
            element.typeText("\n")
        /// 四个方向分别执行，不能用一次上滑代表所有手势。
        case "swipe":
            switch operation.value {
            /// 向上浏览或触发上滑手势。
            case "up":
                element.swipeUp()
            /// 向下浏览或触发下拉手势。
            case "down":
                element.swipeDown()
            /// 向左切换或触发左滑手势。
            case "left":
                element.swipeLeft()
            /// 向右切换或触发右滑手势。
            case "right":
                element.swipeRight()
            /// 未登记方向不能猜测执行。
            default:
                throw CoverageIssue(message: "滑动方向必须明确登记。")
            }
        /// 拖拽坐标相对声明的锚点，跨屏幕尺寸复用且不落到其它 App。
        case "drag":
            let destination: XCUIElement
            if let destinationTarget = operation.toTarget {
                destination = try coverageInteractiveElement(destinationTarget)
            } else {
                destination = element
            }
            guard element.isHittable, destination.isHittable else {
                throw CoverageIssue(message: "拖动起点与终点必须同时可交互。")
            }
            let start = try coverageCoordinate(operation.from, in: element)
            let end = try coverageCoordinate(operation.to, in: destination)
            guard start.screenPoint != end.screenPoint else {
                throw CoverageIssue(message: "拖动起终点解析为相同屏幕坐标。")
            }
            coverageEvent("gesture_coordinates", extra: ["from": [Double(start.screenPoint.x), Double(start.screenPoint.y)], "to": [Double(end.screenPoint.x), Double(end.screenPoint.y)], "toTarget": operation.toTarget ?? target])
            let duration = try coverageNumber(operation.seconds, fallback: 0.5, range: 0.1...5)
            if let configuredVelocity = operation.velocity {
                let velocity = try coverageNumber(configuredVelocity, fallback: 80, range: 1...10000)
                start.press(forDuration: duration,
                            thenDragTo: end,
                            withVelocity: XCUIGestureVelocity(rawValue: CGFloat(velocity)),
                            thenHoldForDuration: 0)
            } else {
                start.press(forDuration: duration, thenDragTo: end)
            }
        /// 缩放调用公开 XCTest API。
        case "pinch":
            let scale = try coverageNumber(operation.scale, fallback: 1.5, range: 0.2...5)
            let velocity = try coverageNumber(operation.velocity, fallback: 1, range: -5...5)
            guard scale != 1, velocity != 0 else {
                throw CoverageIssue(message: "缩放比例或速度不能退化为无动作。")
            }
            element.pinch(withScale: CGFloat(scale), velocity: CGFloat(velocity))
        /// 旋转的角度与速度由具体页面场景声明。
        case "rotate":
            let angle = try coverageNumber(operation.angle, fallback: 0.5, range: -6.28...6.28)
            let velocity = try coverageNumber(operation.velocity, fallback: 1, range: -5...5)
            guard angle != 0, velocity != 0 else {
                throw CoverageIssue(message: "旋转角度或速度不能为零。")
            }
            element.rotate(CGFloat(angle), withVelocity: CGFloat(velocity))
        /// 未知动作直接失败，不能静默跳过算覆盖。
        default:
            throw CoverageIssue(message: "未实现的确定性动作：\(operation.kind)。")
        }
    }

    /// 长列表只在存在唯一可交互滚动容器时顺序寻找精确目标，不猜测坐标或其它入口。
    private func coverageInteractiveElement(_ target: String) throws -> XCUIElement {
        if let element = try? coverageElement(target, timeout: 0.5), element.isHittable {
            return element
        }
        let candidates = (app.tables.allElementsBoundByIndex + app.collectionViews.allElementsBoundByIndex + app.scrollViews.allElementsBoundByIndex).filter {
            $0.isHittable && $0.frame.width > 0 && $0.frame.height > 0
        }
        guard candidates.count == 1 else {
            throw CoverageIssue(message: "精确目标暂不可操作，且没有唯一滚动容器：\(target)。")
        }
        let container = candidates[0]
        var lastSignature = ""
        for _ in 0..<40 {
            guard Date().timeIntervalSince(startedAt) < maxSeconds else {
                throw CoverageIssue(message: "寻找入口时已到单场景时间限制。")
            }
            if let element = try? coverageElement(target, timeout: 0.1), element.isHittable {
                return element
            }
            let snapshot = try container.snapshot()
            let signature = snapshot.children.map {
                "\($0.identifier)|\($0.label)|\($0.frame)"
            }.joined(separator: ";")
            guard signature != lastSignature else {
                throw CoverageIssue(message: "列表不再前进，仍未找到唯一可交互目标：\(target)。")
            }
            lastSignature = signature
            coverageEvent("locator_scroll", extra: ["target": target, "direction": "up"])
            container.swipeUp()
        }
        throw CoverageIssue(message: "超过有界列表查找次数：\(target)。")
    }

    private func coverageObservedValue(_ element: XCUIElement, attribute: String?) throws -> String {
        switch attribute {
        /// 默认读取可访问性值，无值时读取文字。
        case nil:
            return element.value.map { String(describing: $0) } ?? element.label
        /// 精确读取文字，适合回调状态提示。
        case "label":
            return element.label
        /// 明确要求值时，不把同名文字当作值存在。
        case "value":
            guard let value = element.value else {
                throw CoverageIssue(message: "目标没有可读取的可访问性值。")
            }
            return String(describing: value)
        /// 拖拽布局使用同一公开几何信息。
        case "frame":
            return String(describing: element.frame)
        /// 预加载内容必须真实可见，不能仅凭身份探针存在判通过。
        case "hittable":
            return element.isHittable ? "true" : "false"
        /// 表单校验明确核对可用态。
        case "enabled":
            return element.isEnabled ? "true" : "false"
        /// 点赞、开关等明确核对选中态。
        case "selected":
            return element.isSelected ? "true" : "false"
        /// 不使用任意 KVC 扩大测试接口。
        default:
            throw CoverageIssue(message: "未支持的断言属性。")
        }
    }

    private func coverageNumber(_ value: Double?, fallback: Double, range: ClosedRange<Double>) throws -> Double {
        let number = value ?? fallback
        guard number.isFinite, range.contains(number) else {
            throw CoverageIssue(message: "手势数值越界。")
        }
        return number
    }

    private func coverageCoordinate(_ values: [Double]?, in element: XCUIElement) throws -> XCUICoordinate {
        guard let values, values.count == 2,
              values.allSatisfy({ $0.isFinite && (0...1).contains($0) }),
              element.frame.width > 0, element.frame.height > 0 else {
            throw CoverageIssue(message: "拖拽需要有效锚点及 0～1 范围内的二维坐标。")
        }
        return element.coordinate(withNormalizedOffset: CGVector(dx: values[0], dy: values[1]))
    }

    // JOBS_COVERAGE_GENERATED_TESTS_BEGIN
    // JOBS_COVERAGE_GENERATED_TESTS_END
}
