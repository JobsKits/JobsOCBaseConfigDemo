//
//  CoverageTool.swift
//  JobsCrashCrawler
//
//  Created by Jobs on 2026年11月4日，星期三.
//

import CryptoKit
import Foundation

/// 场景合同工具：只验证 JSON、生成 XCTest 入口和核对事件；不操作设备或执行场景配置中的代码。
private enum CoverageError: Error, CustomStringConvertible {
    case invalid(String)

    var description: String {
        switch self {
        /// 保留原始配置错误说明。
        case .invalid(let message):
            return message
        }
    }
}

private func require(_ condition: Bool,
                     _ message: String) throws {
    if !condition {
        throw CoverageError.invalid(message)
    }
}

private func forbiddenTextControl(_ scalar: Unicode.Scalar) -> Bool {
    // Emoji 文件夹名可能含 ZWJ；它连接字形，不是输入动作或路径分隔符。
    return scalar.value != 0x200d && CharacterSet.controlCharacters.contains(scalar)
}

private func object(_ value: Any,
                    at path: String,
                    allowed: Set<String>,
                    required: Set<String>) throws -> [String: Any] {
    guard let result = value as? [String: Any] else {
        throw CoverageError.invalid("\(path) 必须是对象")
    }
    try require(Set(result.keys).isSubset(of: allowed), "\(path) 含未知字段")
    try require(required.isSubset(of: Set(result.keys)), "\(path) 缺少必需字段")
    return result
}

private func string(_ value: Any?,
                    at path: String,
                    maximum: Int = 512) throws -> String {
    guard let result = value as? String else {
        throw CoverageError.invalid("\(path) 必须是字符串")
    }
    try require(!result.isEmpty && result.utf8.count <= maximum, "\(path) 为空或过长")
    try require(!result.unicodeScalars.contains(where: forbiddenTextControl), "\(path) 含控制字符")
    return result
}

private func integer(_ value: Any?,
                     at path: String) throws -> Int {
    guard let number = value as? NSNumber, String(cString: number.objCType) != "c" else {
        throw CoverageError.invalid("\(path) 必须是整数")
    }
    let result = number.doubleValue
    try require(
        result.isFinite && result.rounded() == result && result >= Double(Int32.min)
            && result <= Double(Int32.max),
        "\(path) 必须是有限整数"
    )
    return number.intValue
}

private func number(_ value: Any?,
                    at path: String,
                    lower: Double,
                    upper: Double) throws -> Double {
    guard let number = value as? NSNumber, String(cString: number.objCType) != "c" else {
        throw CoverageError.invalid("\(path) 必须是数值")
    }
    let result = number.doubleValue
    try require(result.isFinite && lower...upper ~= result, "\(path) 数值越界")
    return result
}

private func stableID(_ value: Any?,
                      at path: String) throws -> String {
    let result = try string(value, at: path, maximum: 256)
    try require(
        result.range(of: #"^[\p{L}\p{N}][\p{L}\p{N}\p{M}._-]*$"#, options: .regularExpression) != nil,
        "\(path) 不是稳定标识"
    )
    return result
}

private func relativeSource(_ value: Any?,
                            at path: String) throws -> String {
    let result = try string(value, at: path, maximum: 2048)
    let components = result.components(separatedBy: "/")
    try require(
        !result.hasPrefix("/") && !result.contains("\\")
            && !components.contains(where: {
                return $0.isEmpty || $0 == "." || $0 == ".."
            }),
        "\(path) 必须是工程内规范相对路径"
    )
    return result
}

private func canonicalJSON(_ value: Any) throws -> Data {
    return try JSONSerialization.data(
        withJSONObject: value,
        options: [.sortedKeys, .withoutEscapingSlashes]
    )
}

/// 使用 Apple 系统 SHA-256 绑定计划与日志；Base64 只负责传递结构化数据。
private func sha256(_ data: Data) -> String {
    return SHA256.hash(data: data).map {
        return String(format: "%02x", $0)
    }.joined()
}

private struct Scene {
    let raw: [String: Any]
    let id: String
    let title: String
    let kind: String
    let route: String
    let source: String
    let steps: [[String: Any]]
}

private struct InventoryEntry {
    let id: String
    let source: String
    let kind: String
    let route: String
    let scenarioIDs: [String]
}

private struct ResolvedRoute {
    let rootID: String
    let steps: [[String: Any]]
    let navigationIssue: String?
    let unavailableReason: String?
}

private struct Manifest {
    let projectID: String
    let scenes: [Scene]
    let inventory: [InventoryEntry]
    let digest: String
    let sourceDigestsVerified: Bool
    let catalogVerified: Bool
    let pending: [[String: String]]
    let notApplicable: [[String: String]]
    let platform: String?

    var metadata: [String: Any] {
        var result: [String: Any] = [
            "projectID": projectID, "manifestDigest": digest, "scenarioCount": scenes.count,
            "routeCount": inventory.filter {
                return $0.kind == "route"
            }.count,
            "capabilityCount": inventory.filter {
                return $0.kind == "capability"
            }.count,
            "pageCount": scenes.filter {
                return $0.kind == "page"
            }.count,
            "flowCount": scenes.filter {
                return $0.kind == "flow"
            }.count,
            "gestureCount": scenes.filter {
                return $0.kind == "gesture"
            }.count,
            "componentCount": scenes.filter {
                return $0.kind == "component"
            }.count,
            "sourceDigestsVerified": sourceDigestsVerified, "catalogVerified": catalogVerified,
        ]
        if let platform {
            result["platform"] = platform
        }
        return result
    }
}

private func validateStep(_ value: Any,
                          at path: String) throws -> [String: Any] {
    let step = try object(
        value,
        at: path,
        allowed: [
            "kind", "target", "toTarget", "value", "from", "to", "seconds", "scale", "velocity", "angle", "attribute",
            "container",
        ],
        required: ["kind"]
    )
    let kind = try string(step["kind"], at: path + ".kind")
    let fields: [String: Set<String>] = [
        "expect": ["kind", "target", "value", "attribute"],
        "remember": ["kind", "target", "attribute"], "expectChanged": ["kind", "target", "attribute"],
        "expectGone": ["kind", "target"], "tap": ["kind", "target", "from"], "doubleTap": ["kind", "target"],
        "longPress": ["kind", "target", "seconds"], "type": ["kind", "target", "value"],
        "swipe": ["kind", "target", "value"],
        "pressReturn": ["kind", "target"], "scrollTo": ["kind", "target", "container"],
        "drag": ["kind", "target", "toTarget", "from", "to", "seconds", "velocity"],
        "pinch": ["kind", "target", "scale", "velocity"],
        "rotate": ["kind", "target", "angle", "velocity"], "back": ["kind", "target"],
        "wait": ["kind", "seconds"],
    ]
    guard let allowed = fields[kind] else {
        throw CoverageError.invalid("\(path).kind 不受支持")
    }
    try require(Set(step.keys).isSubset(of: allowed), "\(path) 含该动作不支持的字段")
    if let value = step["attribute"] {
        let attribute = try string(value, at: path + ".attribute")
        try require(
            ["value", "label", "frame", "selected", "enabled", "hittable"].contains(attribute),
            "\(path).attribute不受支持"
        )
    }
    if kind != "wait" {
        let target = try string(step["target"], at: path + ".target")
        try require(
            target == "ready" || target.hasPrefix("id:") && target.count > 3
                || target.hasPrefix("label:") && target.count > 6,
            "\(path).target 必须是ready、id:或label:精确目标"
        )
    }
    if let value = step["value"] {
        let allowedTextControls: Set<Unicode.Scalar> = kind == "expect" ? ["\n", "\r", "\t"] : []
        guard let text = value as? String, text.utf8.count <= 4096,
            !text.unicodeScalars.contains(where: {
                forbiddenTextControl($0) && !allowedTextControls.contains($0)
            })
        else {
            throw CoverageError.invalid("\(path).value必须是无异常控制字符的短字符串；仅expect可包含换行和制表符")
        }
    }
    if kind == "type" {
        let text = try string(step["value"], at: path + ".value", maximum: 4096)
        try require(text.count <= 256, "type文本超过256个字符")
    }
    if kind == "scrollTo" {
        let container = try string(step["container"], at: path + ".container")
        try require(container.hasPrefix("id:") && container.count > 3, "scrollTo.container必须是id:精确滚动容器")
    }
    if kind == "swipe" {
        let direction = try string(step["value"], at: path + ".value")
        try require(["up", "down", "left", "right"].contains(direction), "\(path).value 不是受支持的滑动方向")
    }
    if kind == "longPress" || kind == "wait" || kind == "drag" {
        _ = try number(
            step["seconds"],
            at: path + ".seconds",
            lower: kind == "wait" ? 0.01 : 0.1,
            upper: 5
        )
    }
    if kind == "tap", let value = step["from"] {
        guard let point = value as? [Any], point.count == 2 else {
            throw CoverageError.invalid("\(path).from 必须为两个归一化坐标")
        }
        _ = try number(point[0], at: path + ".from[0]", lower: 0, upper: 1)
        _ = try number(point[1], at: path + ".from[1]", lower: 0, upper: 1)
    }
    if kind == "drag" {
        if let value = step["velocity"] {
            _ = try number(value, at: path + ".velocity", lower: 1, upper: 10000)
        }
        if let value = step["toTarget"] {
            let destination = try string(value, at: path + ".toTarget")
            try require(
                destination == "ready" || destination.hasPrefix("id:") && destination.count > 3
                    || destination.hasPrefix("label:") && destination.count > 6,
                "\(path).toTarget 必须是ready、id:或label:精确目标"
            )
        }
        for key in ["from", "to"] {
            guard let point = step[key] as? [Any], point.count == 2 else {
                throw CoverageError.invalid("\(path).\(key) 必须为两个归一化坐标")
            }
            _ = try number(point[0], at: path + "." + key + "[0]", lower: 0, upper: 1)
            _ = try number(point[1], at: path + "." + key + "[1]", lower: 0, upper: 1)
        }
        let from = step["from"] as! [Any]
        let to = step["to"] as! [Any]
        let dx =
            try number(from[0], at: path, lower: 0, upper: 1)
            - number(to[0], at: path, lower: 0, upper: 1)
        let dy =
            try number(from[1], at: path, lower: 0, upper: 1)
            - number(to[1], at: path, lower: 0, upper: 1)
        let sameAnchor = step["toTarget"] == nil || step["toTarget"] as? String == step["target"] as? String
        try require(!sameAnchor || dx != 0 || dy != 0, "drag同一锚点起终点相同，不形成有效拖动")
    }
    if kind == "pinch" {
        let scale = try number(step["scale"], at: path + ".scale", lower: 0.2, upper: 5)
        try require(scale != 1, "\(path).scale=1 不形成有效缩放")
    }
    if kind == "rotate" {
        let rotation = try number(step["angle"], at: path + ".angle", lower: -6.28, upper: 6.28)
        try require(rotation != 0, "\(path).angle 不能为0")
    }
    if kind == "pinch" || kind == "rotate" {
        let velocity = try number(step["velocity"], at: path + ".velocity", lower: -5, upper: 5)
        try require(velocity != 0, "\(path).velocity 不能为0")
    }
    return step
}

private func loadManifest(path: String,
                          project: String,
                          sourceRoot: String?) throws -> Manifest {
    let data = try Data(contentsOf: URL(fileURLWithPath: path))
    return try decodeManifest(data: data, project: project, sourceRoot: sourceRoot)
}

private func decodeManifest(data: Data,
                            project: String,
                            sourceRoot: String?) throws -> Manifest {
    try require(data.count <= 8 * 1024 * 1024, "Manifest 超过8MiB")
    let raw = try object(
        JSONSerialization.jsonObject(with: data),
        at: "manifest",
        allowed: [
            "version", "projectID", "inventory", "sourceDigests", "catalogDigests", "scenarios",
            "pending", "notApplicable", "platform",
        ],
        required: ["version", "projectID", "inventory", "scenarios"]
    )
    try require(try integer(raw["version"], at: "version") == 1, "Manifest 版本必须为1")
    let projectID = try stableID(raw["projectID"], at: "projectID")
    try require(projectID == project, "Manifest 与当前工程不匹配")
    guard let sceneValues = raw["scenarios"] as? [Any], !sceneValues.isEmpty,
        sceneValues.count <= 4096
    else {
        throw CoverageError.invalid("scenarios 必须含1...4096个场景")
    }
    var scenes: [Scene] = []
    var seenScenes = Set<String>()
    for (index, value) in sceneValues.enumerated() {
        let path = "scenarios[\(index)]"
        let scene = try object(
            value,
            at: path,
            allowed: ["id", "title", "kind", "route", "source", "steps"],
            required: ["id", "title", "kind", "route", "source", "steps"]
        )
        let id = try stableID(scene["id"], at: path + ".id")
        try require(seenScenes.insert(id).inserted, "场景ID重复")
        let title = try string(scene["title"], at: path + ".title")
        let kind = try string(scene["kind"], at: path + ".kind")
        try require(["page", "flow", "gesture", "component"].contains(kind), "场景kind不受支持")
        let route = try stableID(scene["route"], at: path + ".route")
        let source = try relativeSource(scene["source"], at: path + ".source")
        guard let stepValues = scene["steps"] as? [Any], stepValues.count <= 128 else {
            throw CoverageError.invalid("\(path).steps 必须是最多128项的数组")
        }
        let steps = try stepValues.enumerated().map {
            try validateStep($0.element, at: path + ".steps[\($0.offset)]")
        }
        var remembered = Set<String>()
        for step in steps {
            let memoryKey =
                (step["target"] as? String ?? "") + "\u{1f}" + (step["attribute"] as? String ?? "default")
            if step["kind"] as? String == "remember" {
                remembered.insert(memoryKey)
            }
            if step["kind"] as? String == "expectChanged" {
                try require(remembered.contains(memoryKey), "expectChanged的目标与attribute必须先remember")
            }
        }
        if kind != "page" {
            let assertions: Set<String> = ["expect", "expectChanged", "expectGone"]
            let actions: Set<String> = [
                "tap", "doubleTap", "longPress", "type", "pressReturn", "swipe", "drag", "pinch", "rotate",
                "back",
            ]
            try require(
                assertions.contains(steps.last?["kind"] as? String ?? ""),
                "场景\(id)的flow/gesture/component必须以expect/expectChanged/expectGone结束"
            )
            try require(
                steps.contains {
                    return actions.contains($0["kind"] as? String ?? "")
                },
                "场景\(id)的flow/gesture/component必须包含实际执行动作"
            )
        }
        scenes.append(
            Scene(
                raw: scene,
                id: id,
                title: title,
                kind: kind,
                route: route,
                source: source,
                steps: steps
            )
        )
    }
    guard let inventoryValues = raw["inventory"] as? [Any], !inventoryValues.isEmpty,
        inventoryValues.count <= 4096
    else {
        throw CoverageError.invalid("inventory必须是非空路由清单")
    }
    var inventory: [InventoryEntry] = []
    var seenRoutes = Set<String>()
    var linkedScenes = Set<String>()
    let byID = Dictionary(
        uniqueKeysWithValues: scenes.map {
            return ($0.id, $0)
        }
    )
    for (index, value) in inventoryValues.enumerated() {
        let path = "inventory[\(index)]"
        let entry = try object(
            value,
            at: path,
            allowed: ["id", "source", "scenarioIDs", "kind", "route"],
            required: ["id", "source", "scenarioIDs"]
        )
        let id = try stableID(entry["id"], at: path + ".id")
        try require(seenRoutes.insert(id).inserted, "inventory路由ID重复")
        let source = try relativeSource(entry["source"], at: path + ".source")
        let kind = try string(entry["kind"] ?? "route", at: path + ".kind")
        try require(["route", "capability"].contains(kind), "inventory.kind必须是route或capability")
        let route = try stableID(entry["route"] ?? id, at: path + ".route")
        guard let references = entry["scenarioIDs"] as? [String], !references.isEmpty,
            Set(references).count == references.count
        else {
            throw CoverageError.invalid("\(path).scenarioIDs必须是非空且唯一的场景ID数组")
        }
        for reference in references {
            guard let scene = byID[reference] else {
                throw CoverageError.invalid("inventory引用了不存在的场景")
            }
            try require(scene.route == route && scene.source == source, "场景与inventory路由或source不一致")
            try require(linkedScenes.insert(reference).inserted, "场景被inventory重复登记")
        }
        if kind == "route" {
            try require(
                references.contains {
                    return byID[$0]?.kind == "page"
                },
                "每个inventory路由至少需要一个page场景"
            )
        }
        inventory.append(
            InventoryEntry(id: id, source: source, kind: kind, route: route, scenarioIDs: references)
        )
    }
    try require(linkedScenes == seenScenes, "存在未登记到inventory的场景")
    func gaps(_ name: String) throws -> [[String: String]] {
        guard let value = raw[name] else {
            return []
        }
        guard let values = value as? [Any], values.count <= 4096 else {
            throw CoverageError.invalid("\(name)必须是数组")
        }
        var seen = Set<String>()
        return try values.enumerated().map { index, value in
            let path = "\(name)[\(index)]"
            let entry = try object(
                value,
                at: path,
                allowed: ["id", "source", "reason"],
                required: ["id", "source", "reason"]
            )
            let id = try stableID(entry["id"], at: path + ".id")
            try require(seen.insert(id).inserted && !seenScenes.contains(id), "\(name)标识重复或与实跑场景冲突：\(id)")
            return [
                "id": id, "source": try relativeSource(entry["source"], at: path + ".source"),
                "reason": try string(entry["reason"], at: path + ".reason", maximum: 2048),
            ]
        }
    }
    let pending = try gaps("pending")
    let notApplicable = try gaps("notApplicable")
    try require(
        Set(
            pending.compactMap {
                return $0["id"]
            }
        ).isDisjoint(
            with: Set(
                notApplicable.compactMap {
                    return $0["id"]
                }
            )
        ),
        "pending与notApplicable标识冲突"
    )
    let platform = raw["platform"] as? String
    if raw["platform"] != nil {
        try require(platform == "device" || platform == "simulator", "platform必须是device或simulator")
    }
    var sourceHashes: [String: String] = [:]
    var catalogHashes: [String: String] = [:]
    if let value = raw["catalogDigests"] {
        guard let values = value as? [String: String], !values.isEmpty else {
            throw CoverageError.invalid("catalogDigests必须是非空冻结哈希字典")
        }
        for (source, digest) in values {
            _ = try relativeSource(source, at: "catalogDigests.key")
            try require(
                digest.range(of: #"^[a-f0-9]{64}$"#, options: .regularExpression) != nil,
                "catalogDigests必须使用小写SHA-256"
            )
            catalogHashes[source] = digest
        }
        let requiredSources = Set(
            inventory.map(\.source)
                + pending.compactMap {
                    return $0["source"]
                }
                + notApplicable.compactMap {
                    return $0["source"]
                }
        )
        try require(requiredSources.isSubset(of: Set(catalogHashes.keys)), "冻结catalog没有覆盖全部登记源码")
        try require(sourceRoot != nil, "核验catalogDigests需要--source-root")
    }
    if let value = raw["sourceDigests"] {
        guard let values = value as? [String: String], !values.isEmpty else {
            throw CoverageError.invalid("sourceDigests必须是非空哈希字典")
        }
        for (source, digest) in values {
            _ = try relativeSource(source, at: "sourceDigests.key")
            try require(
                digest.range(of: #"^[a-f0-9]{64}$"#, options: .regularExpression) != nil,
                "sourceDigests必须使用小写SHA-256"
            )
            sourceHashes[source] = digest
        }
        try require(
            Set(inventory.map(\.source)).isSubset(of: Set(sourceHashes.keys)),
            "sourceDigests没有覆盖全部inventory源文件"
        )
        try require(sourceRoot != nil, "核验sourceDigests需要--source-root")
    }
    if let sourceRoot {
        let root = URL(fileURLWithPath: sourceRoot, isDirectory: true).standardizedFileURL
            .resolvingSymlinksInPath()
        for source in Set(
            inventory.map(\.source)
                + pending.compactMap {
                    return $0["source"]
                }
                + notApplicable.compactMap {
                    return $0["source"]
                }
        ).union(sourceHashes.keys).union(catalogHashes.keys) {
            let url = root.appendingPathComponent(source).standardizedFileURL.resolvingSymlinksInPath()
            try require(url.path.hasPrefix(root.path + "/"), "source解析后越出当前工程")
            var directory: ObjCBool = false
            try require(
                FileManager.default.fileExists(atPath: url.path, isDirectory: &directory)
                    && !directory.boolValue,
                "inventory源文件不存在"
            )
            if let digest = sourceHashes[source] {
                try require(sha256(try Data(contentsOf: url)) == digest, "源文件内容已变化，需重新生成清单")
            }
            if let digest = catalogHashes[source] {
                try require(
                    sha256(try Data(contentsOf: url)) == digest,
                    "冻结catalog源码已变化，必须同步盘点清单；不能自动刷新哈希后通过"
                )
            }
        }
    }
    return Manifest(
        projectID: projectID,
        scenes: scenes,
        inventory: inventory,
        digest: sha256(try canonicalJSON(raw)),
        sourceDigestsVerified: !sourceHashes.isEmpty && sourceRoot != nil,
        catalogVerified: !catalogHashes.isEmpty && sourceRoot != nil,
        pending: pending,
        notApplicable: notApplicable,
        platform: platform
    )
}

private func writeJSON(_ value: Any,
                       path: String) throws {
    let url = URL(fileURLWithPath: path)
    try FileManager.default.createDirectory(
        at: url.deletingLastPathComponent(),
        withIntermediateDirectories: true
    )
    var data = try JSONSerialization.data(
        withJSONObject: value,
        options: [.sortedKeys, .prettyPrinted, .withoutEscapingSlashes]
    )
    data.append(0x0a)
    try data.write(to: url, options: .atomic)
}

private func printJSON(_ value: Any) throws {
    let data = try canonicalJSON(value)
    FileHandle.standardOutput.write(data)
    FileHandle.standardOutput.write(Data([0x0a]))
}

private func generate(_ manifest: Manifest,
                      template: String,
                      output: String,
                      mapPath: String) throws {
    let text = try String(contentsOfFile: template, encoding: .utf8)
    let begin = "// JOBS_COVERAGE_GENERATED_TESTS_BEGIN"
    let end = "// JOBS_COVERAGE_GENERATED_TESTS_END"
    try require(
        text.components(separatedBy: begin).count == 2 && text.components(separatedBy: end).count == 2,
        "源码生成marker必须各出现一次"
    )
    guard let first = text.range(of: begin), let last = text.range(of: end),
        first.upperBound < last.lowerBound
    else {
        throw CoverageError.invalid("源码生成marker顺序错误")
    }
    try require(
        URL(fileURLWithPath: template).standardizedFileURL
            != URL(fileURLWithPath: output).standardizedFileURL,
        "生成输出不能覆盖模板源码"
    )
    let templateURL = URL(fileURLWithPath: template).standardizedFileURL.resolvingSymlinksInPath()
    let outputURL = URL(fileURLWithPath: output).standardizedFileURL.resolvingSymlinksInPath()
    let mapURL = URL(fileURLWithPath: mapPath).standardizedFileURL.resolvingSymlinksInPath()
    try require(
        templateURL != outputURL && mapURL != templateURL && mapURL != outputURL,
        "生成源码、模板及map不能指向同一文件"
    )
    var methods: [String] = []
    var mapping: [[String: Any]] = []
    for (index, scene) in manifest.scenes.enumerated() {
        let method = String(format: "testCoverage_%04d", index + 1)
        let encoded = try canonicalJSON(scene.raw).base64EncodedString()
        methods.append(
            "    @objc func \(method)() throws {\n        try runCoverageCase(base64JSON: \"\(encoded)\")\n    }"
        )
        mapping.append([
            "sceneID": scene.id, "kind": scene.kind, "route": scene.route, "testMethod": method,
            "testIdentifier": "JobsCrashCrawler/JobsCrashCrawlerTests/\(method)",
        ])
    }
    let rendered =
        String(text[..<first.upperBound]) + "\n\n" + methods.joined(separator: "\n\n") + "\n\n    "
        + String(text[last.lowerBound...])
    let url = URL(fileURLWithPath: output)
    try FileManager.default.createDirectory(
        at: url.deletingLastPathComponent(),
        withIntermediateDirectories: true
    )
    try Data(rendered.utf8).write(to: url, options: .atomic)
    var result = manifest.metadata
    result["cases"] = mapping
    try writeJSON(result, path: mapPath)
    try printJSON(result)
}

private struct Observation {
    var started = false
    var finished = false
    var finishStatus = ""
    var finishReason = ""
    var inFlight: Int?
    var nextStep = -1
    var completed = Set<Int>()
    var issues: [String] = []
}

private func makeReport(_ manifest: Manifest,
                        eventsPath: String,
                        xcodeExit: Int) throws -> [String: Any] {
    let data = try Data(contentsOf: URL(fileURLWithPath: eventsPath))
    try require(data.count <= 64 * 1024 * 1024, "事件文件超过64MiB")
    guard let text = String(data: data, encoding: .utf8) else {
        throw CoverageError.invalid("事件文件不是UTF-8")
    }
    let scenes = Dictionary(
        uniqueKeysWithValues: manifest.scenes.map {
            return ($0.id, $0)
        }
    )
    var observed = Dictionary(
        uniqueKeysWithValues: manifest.scenes.map {
            return ($0.id, Observation())
        }
    )
    var globalIssues: [String] = []
    let relevant: Set<String> = ["scene_started", "step_started", "step_completed", "scene_finished"]
    for (lineIndex, rawLine) in text.components(separatedBy: .newlines).enumerated() {
        let trimmed = rawLine.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            continue
        }
        var payload = trimmed
        if let range = rawLine.range(of: "JOBS_CRAWL_EVENT ")
            ?? rawLine.range(of: "JOBS_COVERAGE_EVENT ")
        {
            payload = String(rawLine[range.upperBound...])
        } else if !trimmed.hasPrefix("{") {
            continue
        }
        guard let bytes = payload.data(using: .utf8),
            let event = (try? JSONSerialization.jsonObject(with: bytes)) as? [String: Any]
        else {
            globalIssues.append("第\(lineIndex + 1)行事件JSON无效")
            continue
        }
        guard let name = event["event"] as? String, relevant.contains(name) else {
            continue
        }
        guard let id = event["sceneID"] as? String, let scene = scenes[id], var state = observed[id]
        else {
            globalIssues.append("第\(lineIndex + 1)行属于未知场景")
            continue
        }
        if name == "scene_started" || name == "scene_finished" || event["manifestDigest"] != nil {
            if event["manifestDigest"] as? String != manifest.digest {
                state.issues.append("事件Manifest摘要不匹配")
            }
        }
        switch name {
        /// 每个场景只开始一次，不能用重试覆盖前一次失败。
        case "scene_started":
            if state.started || state.finished {
                state.issues.append("场景重复开始")
            }
            state.started = true
        /// 开始和完成必须按声明步骤顺序配对。
        case "step_started", "step_completed":
            guard let index = try? integer(event["stepIndex"], at: "stepIndex"), index >= -1,
                index < scene.steps.count
            else {
                state.issues.append("步骤索引无效")
                observed[id] = state
                continue
            }
            if !state.started || state.finished {
                state.issues.append("步骤出现场景执行范围外")
            }
            if name == "step_started" {
                if state.inFlight != nil || index != state.nextStep {
                    state.issues.append("步骤开始顺序不符")
                }
                state.inFlight = index
            } else {
                if state.inFlight != index || index != state.nextStep || state.completed.contains(index) {
                    state.issues.append("步骤完成缺少对应开始或重复")
                }
                state.completed.insert(index)
                state.inFlight = nil
                state.nextStep = index + 1
            }
        /// 结束状态还需与全部必需步骤交叉核对。
        case "scene_finished":
            if !state.started || state.finished {
                state.issues.append("场景结束缺少开始或重复")
            }
            state.finished = true
            state.finishStatus = event["status"] as? String ?? ""
            state.finishReason = String((event["reason"] as? String ?? "").prefix(2048))
            if !["passed", "failed"].contains(state.finishStatus) {
                state.issues.append("场景结束状态无效")
            }
        /// 辅助事件不能改变场景通过状态。
        default:
            break
        }
        observed[id] = state
    }
    var results: [[String: Any]] = []
    var passed = 0
    var failed = 0
    var pending = 0
    for scene in manifest.scenes {
        var state = observed[scene.id] ?? Observation()
        let required = Set(-1..<scene.steps.count)
        if state.started && !state.finished {
            state.issues.append("场景开始后缺少scene_finished，可能崩溃或中断")
        }
        if state.finishStatus == "passed" && state.completed != required {
            state.issues.append("场景声称通过但必需步骤未完成")
        }
        let status: String
        if state.started && state.finished && state.finishStatus == "passed"
            && state.completed == required && state.inFlight == nil && state.issues.isEmpty
        {
            status = "passed"
            passed += 1
        } else if state.started || state.finished || !state.issues.isEmpty {
            status = "failed"
            failed += 1
        } else {
            status = "pending"
            pending += 1
        }
        results.append([
            "sceneID": scene.id, "title": scene.title, "kind": scene.kind, "route": scene.route,
            "started": state.started,
            "observedStatus": status, "readyCompleted": state.completed.contains(-1),
            "requiredStepCount": scene.steps.count,
            "completedStepIndices": state.completed.filter {
                return $0 >= 0
            }.sorted(),
            "reason": state.finishReason, "issues": state.issues,
        ])
    }
    var report = manifest.metadata
    report["version"] = 1
    report["xcodeExit"] = xcodeExit
    report["gatePassed"] =
        xcodeExit == 0 && globalIssues.isEmpty && passed == manifest.scenes.count
        && manifest.pending.isEmpty && manifest.catalogVerified
    report["counts"] = [
        "expected": manifest.scenes.count, "observedPassed": passed, "failed": failed,
        "pending": pending, "pendingCapabilities": manifest.pending.count,
        "notApplicable": manifest.notApplicable.count,
    ]
    report["issues"] = globalIssues
    report["scenes"] = results
    report["inventory"] = manifest.inventory.map {
        [
            "id": $0.id, "source": $0.source, "scenarioIDs": $0.scenarioIDs, "kind": $0.kind,
            "route": $0.route,
        ] as [String: Any]
    }
    report["pending"] = manifest.pending
    report["notApplicable"] = manifest.notApplicable
    return report
}

private func writeReport(_ report: [String: Any],
                         path: String) throws {
    let jsonURL = URL(fileURLWithPath: path).standardizedFileURL
    try require(jsonURL.pathExtension.lowercased() == "json", "报告输出需使用.json后缀")
    let textURL = jsonURL.deletingPathExtension().appendingPathExtension("txt")
    let counts = report["counts"] as? [String: Int] ?? [:]
    let passed = report["gatePassed"] as? Bool == true
    func line(_ value: String) -> String {
        return value.components(separatedBy: .newlines).joined(separator: " ")
    }
    var lines = [
        "iOS 场景巡检结果", "当前工程：\(report["projectID"] as? String ?? "")", "完整性判定：\(passed ? "通过" : "未通过")",
        "本次盘点场景总数：\(counts["expected"] ?? 0)", "已观测通过：\(counts["observedPassed"] ?? 0)",
        "失败／中断：\(counts["failed"] ?? 0)", "尚未开始：\(counts["pending"] ?? 0)",
        "待适配能力：\(counts["pendingCapabilities"] ?? 0)", "本平台不适用：\(counts["notApplicable"] ?? 0)",
        "批次汇总状态：\(report["xcodeExit"] as? Int ?? -1)",
        "冻结盘点依据：\(report["catalogVerified"] as? Bool == true ? "已核验" : "未核验，不能完整通过")", "", "逐场景结果：",
    ]
    let names = ["passed": "已观测通过", "failed": "失败／中断", "pending": "尚未开始"]
    let kinds = ["page": "页面进入", "flow": "业务流程", "gesture": "真实手势", "component": "组件逻辑"]
    for scene in report["scenes"] as? [[String: Any]] ?? [] {
        let status = scene["observedStatus"] as? String ?? "unknown"
        let kind = scene["kind"] as? String ?? ""
        lines.append(
            "• [\(names[status] ?? status)／\(kinds[kind] ?? kind)] \(line(scene["title"] as? String ?? ""))（\(scene["sceneID"] as? String ?? "")）"
        )
        let issues = scene["issues"] as? [String] ?? []
        let reason = scene["reason"] as? String ?? ""
        for issue in issues {
            lines.append("  • " + line(issue))
        }
        if !reason.isEmpty {
            lines.append("  • " + line(reason))
        }
        if status == "failed" && issues.isEmpty && reason.isEmpty {
            lines.append("  • 场景声明失败，请结合事件及测试结果包定位。")
        }
    }
    for (key, title) in [("pending", "尚待适配"), ("notApplicable", "本平台不适用")] {
        if let entries = report[key] as? [[String: String]], !entries.isEmpty {
            lines += ["", title + "："]
            for entry in entries {
                lines.append("• \(entry["id"] ?? "")：\(line(entry["reason"] ?? ""))")
            }
        }
    }
    let issues = report["issues"] as? [String] ?? []
    if !issues.isEmpty {
        lines +=
            ["", "证据异常："]
            + issues.map {
                return "• " + line($0)
            }
    }
    lines += [
        "",
        "page 场景只证明对应页面进入与 ready 检查；flow／gesture 结果按其声明步骤和断言判断；component 只验证组件状态机，不能当作真实触摸通过。完整性仅针对当前冻结盘点清单，不代表所有输入组合或代码分支均已覆盖。",
    ]
    try writeJSON(report, path: path)
    try Data((lines.joined(separator: "\n") + "\n").utf8).write(to: textURL, options: .atomic)
}

private func sourceURL(_ relative: String,
                       root: URL) throws -> URL {
    _ = try relativeSource(relative, at: "source")
    let url = root.appendingPathComponent(relative).standardizedFileURL.resolvingSymlinksInPath()
    try require(url.path.hasPrefix(root.path + "/"), "source解析后越出当前工程")
    var directory: ObjCBool = false
    try require(
        FileManager.default.fileExists(atPath: url.path, isDirectory: &directory)
            && !directory.boolValue,
        "计划引用的源文件不存在"
    )
    return url
}

private func plan(routesPath: String,
                  flowsPath: String,
                  platform: String,
                  sourceRoot: String,
                  project: String,
                  output: String) throws {
    try require(["simulator", "device"].contains(platform), "platform必须为simulator或device")
    let root = URL(fileURLWithPath: sourceRoot, isDirectory: true).standardizedFileURL
        .resolvingSymlinksInPath()
    func input(_ path: String) throws -> (Data, String) {
        let url = URL(fileURLWithPath: path).standardizedFileURL.resolvingSymlinksInPath()
        try require(url.path.hasPrefix(root.path + "/"), "计划配置必须位于当前source-root内")
        let data = try Data(contentsOf: url)
        try require(data.count <= 8 * 1024 * 1024, "计划输入超过8MiB")
        return (data, String(url.path.dropFirst(root.path.count + 1)))
    }
    let (routeData, routeInputSource) = try input(routesPath)
    let (flowData, flowInputSource) = try input(flowsPath)
    let routeDocument = try object(
        JSONSerialization.jsonObject(with: routeData),
        at: "routes",
        allowed: ["version", "projectID", "routes", "catalogDigests"],
        required: ["version", "projectID", "routes"]
    )
    try require(try integer(routeDocument["version"], at: "routes.version") == 1, "routes版本必须为1")
    try require(routeDocument["projectID"] as? String == project, "routes与当前工程不匹配")
    guard let routeValues = routeDocument["routes"] as? [Any], !routeValues.isEmpty,
        routeValues.count <= 4096
    else {
        throw CoverageError.invalid("routes必须是非空路由数组")
    }
    var routes: [[String: Any]] = []
    var byRoute: [String: [String: Any]] = [:]
    var hashes: [String: String] = [
        routeInputSource: sha256(routeData), flowInputSource: sha256(flowData),
    ]
    var metadataSources = Set<String>()
    for (index, value) in routeValues.enumerated() {
        let path = "routes[\(index)]"
        let route = try object(
            value,
            at: path,
            allowed: [
                "id", "title", "source", "parentRoute", "navigationSteps", "availability", "className",
                "kind", "documentPath", "documentID", "implementationSource",
            ],
            required: ["id", "title", "source"]
        )
        let id = try stableID(route["id"], at: path + ".id")
        try require(byRoute[id] == nil, "routes存在重复路由ID")
        _ = try string(route["title"], at: path + ".title")
        if let className = route["className"] {
            _ = try string(className, at: path + ".className")
        }
        if let kind = route["kind"] {
            try require(
                try string(kind, at: path + ".kind") == "page",
                "routes.kind只能为page；真实流程与手势必须登记到Flows"
            )
        }
        let source = try relativeSource(route["source"], at: path + ".source")
        hashes[source] = sha256(try Data(contentsOf: sourceURL(source, root: root)))
        for key in ["documentPath", "implementationSource"] {
            if let value = route[key] {
                let relative = try relativeSource(value, at: path + "." + key)
                hashes[relative] = sha256(try Data(contentsOf: sourceURL(relative, root: root)))
                metadataSources.insert(relative)
            }
        }
        if let value = route["documentID"] {
            let id = try string(value, at: path + ".documentID")
            try require(
                id.range(of: #"^[a-f0-9]{64}$"#, options: .regularExpression) != nil,
                "documentID必须为64位小写hex"
            )
        }
        if let parent = route["parentRoute"] {
            _ = try stableID(parent, at: path + ".parentRoute")
        }
        if let steps = route["navigationSteps"] {
            guard let values = steps as? [Any], values.count <= 128 else {
                throw CoverageError.invalid("navigationSteps必须为最多128项数组")
            }
            for (offset, step) in values.enumerated() {
                _ = try validateStep(step, at: path + ".navigationSteps[\(offset)]")
            }
        }
        routes.append(route)
        byRoute[id] = route
    }
    var exclusions: [String: String] = [:]
    for route in routes {
        let id = route["id"] as! String
        if let value = route["availability"] {
            let availability = try object(
                value,
                at: "availability",
                allowed: ["devices", "requiredModule"],
                required: []
            )
            if let values = availability["devices"] {
                guard let devices = values as? [String], !devices.isEmpty,
                    Set(devices).count == devices.count, Set(devices).isSubset(of: ["simulator", "device"])
                else {
                    throw CoverageError.invalid("availability.devices无效")
                }
                if !devices.contains(platform) {
                    exclusions[id] = "当前平台不适用，场景要求：" + devices.joined(separator: ",")
                }
            }
            if let required = availability["requiredModule"] {
                let module = try string(required, at: "availability.requiredModule")
                let names: Set<String>
                switch module {
                /// Swift 和 OC 的 WCDB 模块使用各自实际 Pod 名。
                case "WCDB":
                    names = ["WCDB", "WCDBSwift"]
                /// FMDB 仅认锁文件中的精确模块登记。
                case "FMDB":
                    names = ["FMDB"]
                /// 播放器子页面同样需要可核验的编译依据。
                case "BMPlayer":
                    names = ["BMPlayer"]
                /// 未实现证据规则时直接停止，不能猜测模块可用。
                default:
                    throw CoverageError.invalid("requiredModule没有受支持的Podfile.lock核验规则")
                }
                let lockURL = try sourceURL("Podfile.lock", root: root)
                let lockData = try Data(contentsOf: lockURL)
                guard let lockText = String(data: lockData, encoding: .utf8),
                    lockText.hasPrefix("PODS:\n") || lockText.contains("\nPODS:\n")
                else {
                    throw CoverageError.invalid("Podfile.lock缺少PODS登记，不能猜测模块可用性")
                }
                hashes["Podfile.lock"] = sha256(lockData)
                var inPods = false
                var installed = Set<String>()
                for line in lockText.components(separatedBy: .newlines) {
                    if line == "PODS:" {
                        inPods = true
                        continue
                    }
                    if inPods && !line.isEmpty && !line.hasPrefix(" ") {
                        break
                    }
                    if inPods && line.hasPrefix("  - ") {
                        let name = line.dropFirst(4).prefix {
                            return !$0.isWhitespace && $0 != "(" && $0 != "/"
                        }
                        installed.insert(String(name))
                    }
                }
                if installed.isDisjoint(with: names) {
                    exclusions[id] = "Podfile.lock未登记所需模块：" + module
                }
            }
        }
    }
    var resolvedRoutes: [String: ResolvedRoute] = [:]
    var resolving = Set<String>()
    func resolveRoute(_ id: String) throws -> ResolvedRoute {
        if let result = resolvedRoutes[id] {
            return result
        }
        guard let route = byRoute[id] else {
            throw CoverageError.invalid("parentRoute不存在：" + id)
        }
        try require(resolving.insert(id).inserted, "路由父链存在循环：" + id)
        try require(resolving.count <= 128, "路由父链超过128层")
        defer {
            resolving.remove(id)
        }
        let ownSteps = route["navigationSteps"] as? [[String: Any]] ?? []
        let result: ResolvedRoute
        if let parentID = route["parentRoute"] as? String {
            let parent = try resolveRoute(parentID)
            let hasAssertion = ["expect", "expectChanged", "expectGone"].contains(
                ownSteps.last?["kind"] as? String ?? ""
            )
            result = ResolvedRoute(
                rootID: parent.rootID,
                steps: parent.steps + ownSteps,
                navigationIssue: parent.navigationIssue
                    ?? (hasAssertion ? nil : "子页\(id)缺少末尾页面断言，不能只凭父页ready或tap返回算作覆盖"),
                unavailableReason: exclusions[id]
                    ?? parent.unavailableReason.map {
                        return "父链当前不适用：" + $0
                    }
            )
        } else {
            result = ResolvedRoute(
                rootID: id,
                steps: ownSteps,
                navigationIssue: nil,
                unavailableReason: exclusions[id]
            )
        }
        resolvedRoutes[id] = result
        return result
    }
    for route in routes {
        _ = try resolveRoute(route["id"] as! String)
    }
    let flows = try object(
        JSONSerialization.jsonObject(with: flowData),
        at: "flows",
        allowed: ["version", "projectID", "scenarios", "pending", "notApplicable", "catalogDigests"],
        required: ["scenarios"]
    )
    if let version = flows["version"] {
        try require(try integer(version, at: "flows.version") == 1, "flows版本必须为1")
    }
    if let id = flows["projectID"] {
        try require(id as? String == project, "flows与当前工程不匹配")
    }
    var catalogHashes: [String: String] = [:]
    for input in [routeDocument, flows] {
        if let value = input["catalogDigests"] {
            guard let values = value as? [String: String], !values.isEmpty else {
                throw CoverageError.invalid("catalogDigests必须是非空冻结哈希字典")
            }
            for (source, digest) in values {
                _ = try relativeSource(source, at: "catalogDigests.key")
                try require(
                    digest.range(of: #"^[a-f0-9]{64}$"#, options: .regularExpression) != nil,
                    "catalogDigests不是小写SHA256"
                )
                try require(
                    catalogHashes[source] == nil || catalogHashes[source] == digest,
                    "routes与flows的冻结catalog哈希冲突"
                )
                try require(
                    sha256(try Data(contentsOf: sourceURL(source, root: root))) == digest,
                    "冻结catalog已漂移；必须同步盘点清单，不能自动刷新"
                )
                catalogHashes[source] = digest
                hashes[source] = digest
            }
        }
    }
    if !catalogHashes.isEmpty {
        try require(
            metadataSources.isSubset(of: Set(catalogHashes.keys)),
            "冻结catalog没有覆盖文档内容或reader实现源码"
        )
    }
    guard let flowValues = flows["scenarios"] as? [[String: Any]] else {
        throw CoverageError.invalid("flows.scenarios必须是对象数组")
    }
    var pending = flows["pending"] as? [[String: Any]] ?? []
    if flows["pending"] != nil && !(flows["pending"] is [[String: Any]]) {
        throw CoverageError.invalid("flows.pending必须是对象数组")
    }
    var notApplicable = flows["notApplicable"] as? [[String: Any]] ?? []
    if flows["notApplicable"] != nil && !(flows["notApplicable"] is [[String: Any]]) {
        throw CoverageError.invalid("flows.notApplicable必须是对象数组")
    }
    var scenes: [[String: Any]] = []
    var inventory: [[String: Any]] = []
    for route in routes {
        let id = route["id"] as! String
        let source = route["source"] as! String
        let sceneID = "page." + id
        let resolution = try resolveRoute(id)
        if let reason = resolution.unavailableReason {
            notApplicable.append(["id": sceneID, "source": source, "reason": reason])
            continue
        }
        if let reason = resolution.navigationIssue {
            pending.append(["id": sceneID, "source": source, "reason": reason])
            continue
        }
        scenes.append([
            "id": sceneID, "title": route["title"] as! String, "kind": "page", "route": resolution.rootID,
            "source": source, "steps": resolution.steps,
        ])
        inventory.append([
            "id": id, "kind": "route", "route": resolution.rootID, "source": source,
            "scenarioIDs": [sceneID],
        ])
    }
    for (index, rawScene) in flowValues.enumerated() {
        var scene = try object(
            rawScene,
            at: "flows.scenarios[\(index)]",
            allowed: ["id", "title", "kind", "route", "source", "steps", "availability"],
            required: ["id", "title", "kind", "route", "source", "steps"]
        )
        let id = try stableID(scene["id"], at: "flows.scenarios[\(index)].id")
        let route = try stableID(scene["route"], at: "flows.scenarios[\(index)].route")
        try require(byRoute[route] != nil, "flow引用未登记的启动路由")
        let resolution = try resolveRoute(route)
        let source = try relativeSource(scene["source"], at: "flows.scenarios[\(index)].source")
        hashes[source] = sha256(try Data(contentsOf: sourceURL(source, root: root)))
        var excludedReason = resolution.unavailableReason
        if let rawAvailability = scene.removeValue(forKey: "availability") {
            let availability = try object(
                rawAvailability,
                at: "flows.scenarios[\(index)].availability",
                allowed: ["devices"],
                required: ["devices"]
            )
            guard let devices = availability["devices"] as? [String], !devices.isEmpty,
                Set(devices).count == devices.count, Set(devices).isSubset(of: ["simulator", "device"])
            else {
                throw CoverageError.invalid("flows.availability.devices无效")
            }
            if !devices.contains(platform) {
                excludedReason = "当前平台不适用，流程要求：" + devices.joined(separator: ",")
            }
        }
        if let reason = excludedReason {
            notApplicable.append(["id": id, "source": source, "reason": reason])
        } else if byRoute[route]?["parentRoute"] != nil, let reason = resolution.navigationIssue {
            pending.append(["id": id, "source": source, "reason": reason])
        } else {
            // 只有逻辑子页需要自动前置父链；已指定真实root的流程保持作者明确写出的步骤。
            if byRoute[route]?["parentRoute"] != nil {
                guard let steps = scene["steps"] as? [[String: Any]] else {
                    throw CoverageError.invalid("flow.steps必须是对象数组")
                }
                scene["steps"] = resolution.steps + steps
            }
            scene["route"] = resolution.rootID
            scenes.append(scene)
            inventory.append([
                "id": "capability." + id, "kind": "capability", "route": resolution.rootID,
                "source": source, "scenarioIDs": [id],
            ])
        }
    }
    for entry in pending + notApplicable {
        let source = try relativeSource(entry["source"], at: "pending/notApplicable.source")
        hashes[source] = sha256(try Data(contentsOf: sourceURL(source, root: root)))
    }
    var raw: [String: Any] = [
        "version": 1, "projectID": project, "platform": platform, "scenarios": scenes,
        "inventory": inventory, "sourceDigests": hashes, "pending": pending,
        "notApplicable": notApplicable,
    ]
    if !catalogHashes.isEmpty {
        raw["catalogDigests"] = catalogHashes
    }
    let manifest = try decodeManifest(
        data: canonicalJSON(raw),
        project: project,
        sourceRoot: sourceRoot
    )
    let outputURL = URL(fileURLWithPath: output).standardizedFileURL.resolvingSymlinksInPath()
    try require(
        ![
            URL(fileURLWithPath: routesPath).standardizedFileURL.resolvingSymlinksInPath(),
            URL(fileURLWithPath: flowsPath).standardizedFileURL.resolvingSymlinksInPath(),
        ].contains(outputURL),
        "计划输出不能覆盖routes/flows输入"
    )
    try writeJSON(raw, path: output)
    var metadata = manifest.metadata
    metadata["pendingCount"] = pending.count
    metadata["notApplicableCount"] = notApplicable.count
    try printJSON(metadata)
}

private func remaining(_ manifest: Manifest,
                       events: String,
                       mapPath: String,
                       output: String) throws {
    let report = try makeReport(manifest, eventsPath: events, xcodeExit: 0)
    let data = try Data(contentsOf: URL(fileURLWithPath: mapPath))
    guard let mapping = try JSONSerialization.jsonObject(with: data) as? [String: Any],
        mapping["manifestDigest"] as? String == manifest.digest,
        mapping["projectID"] as? String == manifest.projectID,
        let cases = mapping["cases"] as? [[String: Any]]
    else {
        throw CoverageError.invalid("map与本轮Manifest不匹配")
    }
    var byScene: [String: String] = [:]
    let expectedTests = Dictionary(
        uniqueKeysWithValues: manifest.scenes.enumerated().map {
            (
                $0.element.id,
                "JobsCrashCrawler/JobsCrashCrawlerTests/"
                    + String(format: "testCoverage_%04d", $0.offset + 1)
            )
        }
    )
    for entry in cases {
        guard let id = entry["sceneID"] as? String, let test = entry["testIdentifier"] as? String else {
            throw CoverageError.invalid("map条目缺少场景或测试标识")
        }
        try require(
            byScene[id] == nil
                && test.range(
                    of: #"^JobsCrashCrawler/JobsCrashCrawlerTests/testCoverage_[0-9]{4}$"#,
                    options: .regularExpression
                ) != nil,
            "map测试标识重复或格式不符"
        )
        try require(expectedTests[id] == test, "map测试编号与Manifest场景顺序不一致")
        byScene[id] = test
    }
    try require(Set(byScene.keys) == Set(manifest.scenes.map(\.id)), "map场景清单与Manifest不一致")
    try require((report["issues"] as? [String] ?? []).isEmpty, "事件文件存在全局异常，不能猜测剩余场景")
    let results = report["scenes"] as? [[String: Any]] ?? []
    let unstarted = results.filter {
        return $0["observedStatus"] as? String == "pending"
    }
    let lines = try unstarted.map { row -> String in
        guard let id = row["sceneID"] as? String, let test = byScene[id] else {
            throw CoverageError.invalid("剩余场景缺少测试映射")
        }
        return "-only-testing:" + test
    }
    let url = URL(fileURLWithPath: output)
    try FileManager.default.createDirectory(
        at: url.deletingLastPathComponent(),
        withIntermediateDirectories: true
    )
    try Data((lines.joined(separator: "\n") + (lines.isEmpty ? "" : "\n")).utf8).write(
        to: url,
        options: .atomic
    )
    var metadata = manifest.metadata
    metadata["remainingCount"] = lines.count
    metadata["remainingSceneIDs"] = unstarted.compactMap {
        return $0["sceneID"] as? String
    }
    metadata["startedCount"] =
        results.filter {
            return $0["started"] as? Bool == true
        }.count
    try printJSON(metadata)
}

@main
private struct JobsCoverageTool {
    static func main() {
        do {
            var arguments = Array(CommandLine.arguments.dropFirst())
            guard let command = arguments.first,
                ["validate", "generate", "report", "plan", "remaining"].contains(command)
            else {
                throw CoverageError.invalid(
                    "用法：CoverageTool plan|validate|generate|report|remaining；plan需--routes/--flows/--platform/--source-root/--output/--project，其它需--manifest/--project；generate另需--template/--output/--map；report另需--events/--xcode-exit/--output；remaining另需--events/--map/--output"
                )
            }
            arguments.removeFirst()
            let allowed: Set<String>
            switch command {
            /// 生成只接受清单、模板与本轮输出路径。
            case "generate":
                allowed = ["--manifest", "--project", "--source-root", "--template", "--output", "--map"]
            /// 报告必须提供事件和主机汇总状态。
            case "report":
                allowed = [
                    "--manifest", "--project", "--source-root", "--events", "--xcode-exit", "--output",
                ]
            /// 计划依据当前平台与工程内盘点配置。
            case "plan":
                allowed = ["--routes", "--flows", "--platform", "--source-root", "--output", "--project"]
            /// 剩余项必须与本轮映射核对。
            case "remaining":
                allowed = ["--manifest", "--project", "--source-root", "--events", "--map", "--output"]
            /// validate 只需要清单及源码根目录。
            default:
                allowed = ["--manifest", "--project", "--source-root"]
            }
            var options: [String: String] = [:]
            while !arguments.isEmpty {
                let key = arguments.removeFirst()
                try require(
                    allowed.contains(key) && options[key] == nil && !arguments.isEmpty,
                    "参数未知、重复或缺值"
                )
                options[key] = arguments.removeFirst()
            }
            func needed(_ key: String) throws -> String {
                guard let value = options[key], !value.isEmpty else {
                    throw CoverageError.invalid("缺少\(key)")
                }
                return value
            }
            if command == "plan" {
                try plan(
                    routesPath: needed("--routes"),
                    flowsPath: needed("--flows"),
                    platform: needed("--platform"),
                    sourceRoot: needed("--source-root"),
                    project: needed("--project"),
                    output: needed("--output")
                )
                return
            }
            let manifest = try loadManifest(
                path: needed("--manifest"),
                project: needed("--project"),
                sourceRoot: options["--source-root"]
            )
            switch command {
            /// 只验证合同，不操作设备。
            case "validate":
                var result = manifest.metadata
                result["valid"] = true
                try printJSON(result)
            /// 每个场景生成固定编号的独立测试入口。
            case "generate":
                try generate(
                    manifest,
                    template: needed("--template"),
                    output: needed("--output"),
                    mapPath: needed("--map")
                )
            /// 汇总可观测证据，同时返回完整性门禁状态。
            case "report":
                guard let exitCode = Int(try needed("--xcode-exit")), 0...255 ~= exitCode else {
                    throw CoverageError.invalid("xcode退出状态必须是0...255整数")
                }
                let report = try makeReport(manifest, eventsPath: needed("--events"), xcodeExit: exitCode)
                try writeReport(report, path: needed("--output"))
                try printJSON(report)
                if report["gatePassed"] as? Bool != true {
                    exit(1)
                }
            /// 只调度从未开始的场景，不掩盖失败。
            case "remaining":
                try remaining(
                    manifest,
                    events: needed("--events"),
                    mapPath: needed("--map"),
                    output: needed("--output")
                )
            /// plan 已在解码清单前处理并返回。
            default:
                break
            }
        } catch {
            FileHandle.standardError.write(Data(("Coverage配置或证据错误：\(error)\n").utf8))
            exit(2)
        }
    }
}
