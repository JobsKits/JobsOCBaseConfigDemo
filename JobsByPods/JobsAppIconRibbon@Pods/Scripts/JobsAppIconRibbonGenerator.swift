//
//  JobsAppIconRibbonGenerator.swift
//  JobsAppIconRibbon
//
//  Created by Jobs on 2026年7月15日，星期三.
//

import AppKit
import Darwin
import Foundation
import ImageIO

private enum RibbonGeneratorError: LocalizedError {
    case invalidArguments
    case missingConfiguration(String)
    case missingSource(String)
    case invalidColor(String)
    case invalidImage(String)
    case unsafePath(String)
    case replacementFailed(Int32)

    var errorDescription: String? {
        switch self {
        /// 拒绝不完整命令行
        case .invalidArguments:
            return "参数错误：需要 --project-root、--config 和 --configuration。"
        /// 配置文件必须存在
        case .missingConfiguration(let path):
            return "找不到配置文件：\(path)"
        /// 图标输入必须存在
        case .missingSource(let path):
            return "找不到源 AppIcon：\(path)"
        /// 颜色必须能解析
        case .invalidColor(let value):
            return "颜色格式无效：\(value)，请使用 #RRGGBB 或 #RRGGBBAA。"
        /// 图像必须能解码与编码
        case .invalidImage(let path):
            return "无法读取图标：\(path)"
        /// 阻止输入输出别名与越界路径
        case .unsafePath(let path):
            return "拒绝不安全的图标路径：\(path)"
        /// 原子目录替换失败时保留旧输出
        case .replacementFailed(let code):
            return "图标目录原子替换失败，errno=\(code)"
        }
    }
}

private struct RibbonGeneratorOptions {
    let projectRoot: URL
    let configurationFile: URL
    let buildConfiguration: String

    init(arguments: [String]) throws {
        guard arguments.count == 7 else {
            throw RibbonGeneratorError.invalidArguments
        }
        var values: [String: String] = [:]
        var index = 1
        while index + 1 < arguments.count {
            let key = arguments[index]
            guard ["--project-root", "--config", "--configuration"].contains(key), values[key] == nil else {
                throw RibbonGeneratorError.invalidArguments
            }
            values[key] = arguments[index + 1]
            index += 2
        }
        guard let projectRoot = values["--project-root"],
              let configurationFile = values["--config"],
              let buildConfiguration = values["--configuration"], !buildConfiguration.isEmpty else {
            throw RibbonGeneratorError.invalidArguments
        }
        self.projectRoot = URL(fileURLWithPath: projectRoot).standardizedFileURL
        self.configurationFile = URL(fileURLWithPath: configurationFile).standardizedFileURL
        self.buildConfiguration = buildConfiguration
    }
}

private struct RibbonConfiguration {
    let sourceAppIconSet: URL
    let outputAppIconSet: URL
    let text: String
    let backgroundColor: NSColor
    let textColor: NSColor
    let fontName: String
    let fontSizeRatio: CGFloat

    init(options: RibbonGeneratorOptions) throws {
        guard FileManager.default.fileExists(atPath: options.configurationFile.path) else {
            throw RibbonGeneratorError.missingConfiguration(options.configurationFile.path)
        }
        let values = try Self.parseConfiguration(at: options.configurationFile)
        guard let sourcePath = values["SOURCE_APPICONSET"], !sourcePath.isEmpty else {
            throw RibbonGeneratorError.missingSource("SOURCE_APPICONSET 未配置")
        }
        sourceAppIconSet = options.projectRoot.appendingPathComponent(sourcePath).standardizedFileURL
        guard FileManager.default.fileExists(atPath: sourceAppIconSet.path) else {
            throw RibbonGeneratorError.missingSource(sourceAppIconSet.path)
        }

        let outputPrefix = values["OUTPUT_NAME_PREFIX"].flatMap { $0.isEmpty ? nil : $0 } ?? "JobsAppIconRibbon"
        guard outputPrefix.range(of: "^[A-Za-z0-9_-]+$", options: .regularExpression) != nil else {
            throw RibbonGeneratorError.unsafePath(outputPrefix)
        }
        let safeConfiguration = options.buildConfiguration
            .replacingOccurrences(of: "[^A-Za-z0-9_-]", with: "-", options: .regularExpression)
        outputAppIconSet = sourceAppIconSet.deletingLastPathComponent()
            .appendingPathComponent("\(outputPrefix)-\(safeConfiguration).appiconset")
            .standardizedFileURL
        guard sourceAppIconSet.resolvingSymlinksInPath() != outputAppIconSet.resolvingSymlinksInPath(),
              sourceAppIconSet.pathExtension == "appiconset" else {
            throw RibbonGeneratorError.unsafePath(outputAppIconSet.path)
        }
        if FileManager.default.fileExists(atPath: outputAppIconSet.path) {
            let outputValues = try outputAppIconSet.resourceValues(forKeys: [.isSymbolicLinkKey, .isDirectoryKey])
            guard outputValues.isSymbolicLink != true, outputValues.isDirectory == true else {
                throw RibbonGeneratorError.unsafePath(outputAppIconSet.path)
            }
        }

        let uppercasedConfiguration = options.buildConfiguration.uppercased()
        if let customText = values["RIBBON_TEXT"], !customText.isEmpty {
            text = customText
        } else if uppercasedConfiguration.contains("DEBUG") {
            text = values["DEBUG_TEXT"].flatMap { $0.isEmpty ? nil : $0 } ?? "DEBUG"
        } else if uppercasedConfiguration.contains("RELEASE") {
            text = values["RELEASE_TEXT"].flatMap { $0.isEmpty ? nil : $0 } ?? "RELEASE"
        } else {
            let key = "TEXT_" + uppercasedConfiguration
                .replacingOccurrences(of: "[^A-Z0-9]", with: "_", options: .regularExpression)
            text = values[key].flatMap { $0.isEmpty ? nil : $0 } ?? uppercasedConfiguration
        }

        backgroundColor = try Self.color(from: values["BACKGROUND_COLOR"] ?? "#8B4513")
        textColor = try Self.color(from: values["TEXT_COLOR"] ?? "#FFFFFF")
        fontName = values["FONT_NAME"].flatMap { $0.isEmpty ? nil : $0 } ?? "HelveticaNeue-Bold"
        guard let ratio = Double(values["FONT_SIZE_RATIO"] ?? "0.105"), ratio.isFinite, ratio > 0, ratio <= 1 else {
            throw RibbonGeneratorError.invalidArguments
        }
        fontSizeRatio = CGFloat(ratio)
    }

    private static func parseConfiguration(at url: URL) throws -> [String: String] {
        let content = try String(contentsOf: url, encoding: .utf8)
        return content.split(whereSeparator: \Character.isNewline).reduce(into: [:]) { result, line in
            let text = line.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !text.isEmpty, !text.hasPrefix("#"), let separator = text.firstIndex(of: "=") else {
                return
            }
            let key = String(text[..<separator]).trimmingCharacters(in: .whitespaces)
            var value = String(text[text.index(after: separator)...]).trimmingCharacters(in: .whitespaces)
            if value.count >= 2,
               (value.hasPrefix("\"") && value.hasSuffix("\"") || value.hasPrefix("'") && value.hasSuffix("'")) {
                value.removeFirst()
                value.removeLast()
            }
            result[key] = value
        }
    }

    private static func color(from value: String) throws -> NSColor {
        let hex = value.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        guard hex.count == 6 || hex.count == 8, let number = UInt64(hex, radix: 16) else {
            throw RibbonGeneratorError.invalidColor(value)
        }
        let hasAlpha = hex.count == 8
        let red = CGFloat((number >> (hasAlpha ? 24 : 16)) & 0xFF) / 255
        let green = CGFloat((number >> (hasAlpha ? 16 : 8)) & 0xFF) / 255
        let blue = CGFloat((number >> (hasAlpha ? 8 : 0)) & 0xFF) / 255
        let alpha = hasAlpha ? CGFloat(number & 0xFF) / 255 : 1
        return NSColor(deviceRed: red, green: green, blue: blue, alpha: alpha)
    }
}

private final class JobsAppIconRibbonGenerator {
    private let configuration: RibbonConfiguration
    private let fileManager = FileManager.default

    init(configuration: RibbonConfiguration) {
        self.configuration = configuration
    }

    func run() throws {
        let contentsURL = configuration.sourceAppIconSet.appendingPathComponent("Contents.json")
        let data = try Data(contentsOf: contentsURL)
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let images = json["images"] as? [[String: Any]] else {
            throw RibbonGeneratorError.missingSource(contentsURL.path)
        }

        let output = configuration.outputAppIconSet
        let staging = output.deletingLastPathComponent()
            .appendingPathComponent(".JobsAppIconRibbon-\(UUID().uuidString).appiconset")
        try fileManager.createDirectory(at: staging, withIntermediateDirectories: false)
        defer {
            try? fileManager.removeItem(at: staging)
        }
        try fileManager.copyItem(at: contentsURL, to: staging.appendingPathComponent("Contents.json"))
        var renderedFiles = Set<String>()
        for image in images {
            guard let filename = image["filename"] as? String, renderedFiles.insert(filename).inserted else {
                continue
            }
            guard !filename.isEmpty, filename != ".", filename != "..",
                  filename == (filename as NSString).lastPathComponent,
                  !filename.contains("\\"), !filename.hasPrefix("/") else {
                throw RibbonGeneratorError.unsafePath(filename)
            }
            try render(filename: filename, outputDirectory: staging)
        }
        guard !renderedFiles.isEmpty else {
            throw RibbonGeneratorError.missingSource(contentsURL.path)
        }
        // macOS 原子交换两个目录；交换后 staging 持有旧输出，由 defer 清理。
        let result: Int32
        if fileManager.fileExists(atPath: output.path) {
            result = renameatx_np(AT_FDCWD, staging.path, AT_FDCWD, output.path, UInt32(RENAME_SWAP))
        } else {
            result = rename(staging.path, output.path)
        }
        guard result == 0 else {
            throw RibbonGeneratorError.replacementFailed(errno)
        }
        print("✔ AppIcon 绶带已生成：\(configuration.outputAppIconSet.path)")
        print("  文案：\(configuration.text)｜背景：\(configuration.backgroundColor)｜字体：\(configuration.fontName)")
    }

    private func render(filename: String, outputDirectory: URL) throws {
        let sourceURL = configuration.sourceAppIconSet.appendingPathComponent(filename)
        let outputURL = outputDirectory.appendingPathComponent(filename)
        guard sourceURL.resolvingSymlinksInPath().deletingLastPathComponent() ==
                configuration.sourceAppIconSet.resolvingSymlinksInPath() else {
            throw RibbonGeneratorError.unsafePath(sourceURL.path)
        }
        guard let imageSource = CGImageSourceCreateWithURL(sourceURL as CFURL, nil),
              let sourceCGImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
            throw RibbonGeneratorError.invalidImage(sourceURL.path)
        }

        let width = sourceCGImage.width
        let height = sourceCGImage.height
        guard width > 0, height > 0, width <= 8192, height <= 8192 else {
            throw RibbonGeneratorError.invalidImage(sourceURL.path)
        }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let bitmapContext = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width * 4,
            space: colorSpace,
            bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
        ) else {
            throw RibbonGeneratorError.invalidImage(sourceURL.path)
        }

        let canvas = NSRect(x: 0, y: 0, width: width, height: height)
        let context = NSGraphicsContext(cgContext: bitmapContext, flipped: false)
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = context
        bitmapContext.draw(sourceCGImage, in: canvas)
        drawRibbon(in: canvas, context: bitmapContext)
        context.flushGraphics()
        NSGraphicsContext.restoreGraphicsState()

        guard let outputImage = bitmapContext.makeImage() else {
            throw RibbonGeneratorError.invalidImage(outputURL.path)
        }
        let isJPEG = outputURL.pathExtension.lowercased().hasPrefix("jp")
        let uniformType = (isJPEG ? "public.jpeg" : "public.png") as CFString
        guard let destination = CGImageDestinationCreateWithURL(outputURL as CFURL, uniformType, 1, nil) else {
            throw RibbonGeneratorError.invalidImage(outputURL.path)
        }
        let properties = isJPEG ? [kCGImageDestinationLossyCompressionQuality: 0.98] as CFDictionary : nil
        CGImageDestinationAddImage(destination, outputImage, properties)
        guard CGImageDestinationFinalize(destination) else {
            throw RibbonGeneratorError.invalidImage(outputURL.path)
        }
    }

    private func drawRibbon(in canvas: NSRect, context: CGContext) {
        let width = canvas.width
        let height = canvas.height
        let path = NSBezierPath()
        path.move(to: NSPoint(x: width * 0.50, y: height))
        path.line(to: NSPoint(x: width * 0.72, y: height))
        path.line(to: NSPoint(x: width, y: height * 0.72))
        path.line(to: NSPoint(x: width, y: height * 0.50))
        path.close()
        configuration.backgroundColor.setFill()
        path.fill()

        let fontSize = max(3, min(width, height) * configuration.fontSizeRatio)
        let font = NSFont(name: configuration.fontName, size: fontSize) ?? NSFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: configuration.textColor
        ]
        let text = configuration.text as NSString
        let textSize = text.size(withAttributes: attributes)
        context.saveGState()
        context.translateBy(x: width * 0.80, y: height * 0.80)
        context.rotate(by: -.pi / 4)
        text.draw(
            at: NSPoint(x: -textSize.width / 2, y: -textSize.height / 2),
            withAttributes: attributes
        )
        context.restoreGState()
    }
}

do {
    let options = try RibbonGeneratorOptions(arguments: CommandLine.arguments)
    let configuration = try RibbonConfiguration(options: options)
    try JobsAppIconRibbonGenerator(configuration: configuration).run()
} catch {
    fputs("✖ \(error.localizedDescription)\n", stderr)
    exit(1)
}

