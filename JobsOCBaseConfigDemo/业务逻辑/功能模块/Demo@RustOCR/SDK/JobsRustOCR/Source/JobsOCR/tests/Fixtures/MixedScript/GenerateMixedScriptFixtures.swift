//
//  GenerateMixedScriptFixtures.swift
//  JobsOCRFixtureTests
//
//  Created by Jobs on 2026年11月17日，星期二.
//

import AppKit
import CryptoKit

@main
struct GenerateMixedScriptFixtures {

    private struct FixtureSpec {

        let identifier: String
        let file: String
        let lines: [String]
        let requiredFragments: [String]
        let asciiFragmentsToPreserve: [String]
        let role: String
        var monospaced = false
    }

    private static let originalLines = [
        "离线文字识别 Rust 核心",
        "跨平台：iOS Android HarmonyOS",
        "Jobs OCR 2026"
    ]

    private static let specifications = [
        FixtureSpec(identifier: "chinese-prefix",
                    file: "01-ChinesePrefix.png",
                    lines: ["跨平台：iOS Android HarmonyOS"],
                    requiredFragments: ["跨平台", "iOS", "Android", "HarmonyOS"],
                    asciiFragmentsToPreserve: ["iOS", "Android", "HarmonyOS"],
                    role: "Chinese prefix before a longer ASCII run"),
        FixtureSpec(identifier: "chinese-middle",
                    file: "02-ChineseMiddle.png",
                    lines: ["iOS Android 跨平台 HarmonyOS"],
                    requiredFragments: ["跨平台", "iOS", "Android", "HarmonyOS"],
                    asciiFragmentsToPreserve: ["iOS", "Android", "HarmonyOS"],
                    role: "Chinese segment between ASCII runs"),
        FixtureSpec(identifier: "chinese-suffix",
                    file: "03-ChineseSuffix.png",
                    lines: ["iOS Android HarmonyOS：跨平台"],
                    requiredFragments: ["跨平台", "iOS", "Android", "HarmonyOS"],
                    asciiFragmentsToPreserve: ["iOS", "Android", "HarmonyOS"],
                    role: "Chinese suffix after a longer ASCII run"),
        FixtureSpec(identifier: "chinese-only",
                    file: "04-ChineseOnly.png",
                    lines: ["离线文字识别跨平台测试"],
                    requiredFragments: ["离线文字识别", "跨平台测试"],
                    asciiFragmentsToPreserve: [],
                    role: "Chinese-only routing control"),
        FixtureSpec(identifier: "english-only",
                    file: "05-EnglishOnly.png",
                    lines: ["Jobs OCR 2026", "Offline text recognition"],
                    requiredFragments: ["Jobs OCR 2026", "Offline text recognition"],
                    asciiFragmentsToPreserve: ["Jobs OCR 2026", "Offline text recognition"],
                    role: "English baseline control; preserve before/after script-routing changes"),
        FixtureSpec(identifier: "ascii-code",
                    file: "06-ASCIICode.png",
                    lines: ["let count = 2026;", "fn main() { return 0; }"],
                    requiredFragments: ["let", "count", "2026", "main", "return"],
                    asciiFragmentsToPreserve: ["let", "count", "2026", "main", "return"],
                    role: "ASCII code control; literal punctuation remains in ground-truth lines",
                    monospaced: true),
        FixtureSpec(identifier: "digits",
                    file: "07-Digits.png",
                    lines: ["0123456789 2026 12345", "2026-11-17 23:59:59"],
                    requiredFragments: ["0123456789", "2026", "12345"],
                    asciiFragmentsToPreserve: ["0123456789", "2026", "12345"],
                    role: "Digits and punctuation control; no script-based rewrite should erase digits",
                    monospaced: true)
    ]

    static func main() throws {
        guard CommandLine.arguments.count == 3 else {
            throw failure(1, "Usage: GenerateMixedScriptFixtures <output-directory> <original-chinese-english.png>")
        }
        let directory = URL(fileURLWithPath: CommandLine.arguments[1],
                            isDirectory: true).standardizedFileURL
        let originalURL = URL(fileURLWithPath: CommandLine.arguments[2]).standardizedFileURL
        let outputNames = specifications.map(\.file) + ["00-OriginalThreeLines.png", "expected.json"]
        for file in outputNames {
            guard !FileManager.default.fileExists(atPath: directory.appendingPathComponent(file).path) else {
                throw failure(2, "Refusing to overwrite an existing fixture: \(file)")
            }
        }
        let originalData = try Data(contentsOf: originalURL)
        guard let originalBitmap = NSBitmapImageRep(data: originalData),
              originalBitmap.pixelsWide == 1600,
              originalBitmap.pixelsHigh == 500 else {
            throw failure(3, "Reference must be the original 1600x500 three-line fixture.")
        }
        try FileManager.default.createDirectory(at: directory,
                                                withIntermediateDirectories: true)
        try originalData.write(to: directory.appendingPathComponent("00-OriginalThreeLines.png"),
                               options: .withoutOverwriting)
        var cases: [[String: Any]] = [[
            "id": "original-three-lines-exact-copy",
            "file": "00-OriginalThreeLines.png",
            "width": originalBitmap.pixelsWide,
            "height": originalBitmap.pixelsHigh,
            "lines": originalLines,
            "exact_lines": false,
            "required_fragments": ["离线文字识别", "Rust", "核心", "跨平台", "iOS", "Android", "HarmonyOS", "Jobs OCR 2026"],
            "ascii_fragments_to_preserve": ["Rust", "iOS", "Android", "HarmonyOS", "Jobs OCR 2026"],
            "role": "Exact reproduction input for the observed Chinese-prefix omission",
            "png_sha256": digest(originalData),
            "provenance": [
                "kind": "exact byte copy; not redrawn",
                "source_repository_relative": "JobsOCR/tests/Fixtures/chinese-english.png",
                "source_generator_repository_relative": "JobsOCR/tests/Fixtures/GenerateTextFixture.swift",
                "source_sha256": digest(originalData)
            ],
            "ocr_validation": "not run by this fixture generator"
        ]]
        for specification in specifications {
            cases.append(try render(specification,
                                    directory: directory))
        }
        let manifest: [String: Any] = [
            "schema_version": 1,
            "kind": "Jobs-authored synthetic mixed-script regression fixtures; not a benchmark",
            "benchmark": false,
            "case_count": cases.count,
            "generator_source": "GenerateMixedScriptFixtures.swift",
            "generator_platform": "MacOS AppKit; local system fonts, no font file redistribution",
            "generated_on_os": ProcessInfo.processInfo.operatingSystemVersionString,
            "matching_contract": [
                "lines": "Literal ground truth, including punctuation and letter case; not observed OCR output.",
                "exact_lines": "When true, compare the exact line count and text, including punctuation and letter case, trimming only leading and trailing whitespace from each line.",
                "required_fragments": "Targeted case-sensitive text fragments; the E2E owner may collapse whitespace but must preserve missing-script evidence.",
                "ascii_fragments_to_preserve": "Before/after baseline controls, especially both English-only lines; no assertion that the current engine has already passed.",
                "scope": "No general accuracy, speed, memory, or platform-compatibility claim. Images must never be hardcoded into the engine.",
                "regeneration": "Build this standalone Swift source, then pass an explicit empty output directory and explicit original PNG path. No working-directory dependency."
            ],
            "cases": cases
        ]
        let expected = try JSONSerialization.data(withJSONObject: manifest,
                                                  options: [.prettyPrinted, .sortedKeys])
        try expected.write(to: directory.appendingPathComponent("expected.json"),
                           options: .withoutOverwriting)
        print("Generated \(cases.count) fixtures; layout margins checked; OCR not executed.")
        print("Reference PNG SHA256: \(digest(originalData))")
    }

    // This is the standalone raster backend; it creates no App, window or view hierarchy.
    private static func render(_ specification: FixtureSpec,
                               directory: URL) throws -> [String: Any] {
        let width = 1600
        let padding: CGFloat = 64
        let pitch: CGFloat = 92
        let font = specification.monospaced
            ? NSFont.monospacedSystemFont(ofSize: 48, weight: .regular)
            : NSFont.systemFont(ofSize: 48)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: NSColor.black
        ]
        let sizes = specification.lines.map { line in
            (line as NSString).size(withAttributes: attributes)
        }
        guard let maximumHeight = sizes.map(\.height).max(),
              sizes.allSatisfy({ size in
                  size.width <= CGFloat(width) - padding * 2 && size.height < pitch
              }) else {
            throw failure(4, "Text would overflow the fixture canvas: \(specification.identifier)")
        }
        let height = max(220,
                         Int(ceil(padding * 2 + maximumHeight + pitch * CGFloat(specification.lines.count - 1))))
        guard let bitmap = NSBitmapImageRep(bitmapDataPlanes: nil,
                                            pixelsWide: width,
                                            pixelsHigh: height,
                                            bitsPerSample: 8,
                                            samplesPerPixel: 4,
                                            hasAlpha: true,
                                            isPlanar: false,
                                            colorSpaceName: .deviceRGB,
                                            bytesPerRow: 0,
                                            bitsPerPixel: 0),
              let context = NSGraphicsContext(bitmapImageRep: bitmap) else {
            throw failure(5, "Could not allocate fixture bitmap.")
        }
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = context
        NSColor.white.setFill()
        NSRect(x: 0, y: 0, width: width, height: height).fill()
        for (index, line) in specification.lines.enumerated() {
            (line as NSString).draw(at: NSPoint(x: padding,
                                              y: CGFloat(height) - padding - maximumHeight - CGFloat(index) * pitch),
                                   withAttributes: attributes)
        }
        NSGraphicsContext.restoreGraphicsState()
        let bounds = try inkBounds(bitmap)
        guard bounds[0] >= 32,
              bounds[1] >= 32,
              bounds[2] < width - 32,
              bounds[3] < height - 32 else {
            throw failure(6, "Raster ink touches the protected edge: \(specification.identifier)")
        }
        guard let png = bitmap.representation(using: .png,
                                              properties: [:]) else {
            throw failure(7, "PNG encoding failed.")
        }
        try png.write(to: directory.appendingPathComponent(specification.file),
                      options: .withoutOverwriting)
        return [
            "id": specification.identifier,
            "file": specification.file,
            "width": width,
            "height": height,
            "lines": specification.lines,
            "exact_lines": ["chinese-only", "english-only", "ascii-code", "digits"].contains(specification.identifier),
            "required_fragments": specification.requiredFragments,
            "ascii_fragments_to_preserve": specification.asciiFragmentsToPreserve,
            "role": specification.role,
            "png_sha256": digest(png),
            "drawing": [
                "font_postscript_name": font.fontName,
                "font_size": Double(font.pointSize),
                "monospaced": specification.monospaced,
                "padding": Int(padding),
                "ink_bounds_inclusive_bitmap_rows": bounds,
                "protected_edge_pixels": 32,
                "line_widths": sizes.map { size in
                    Double(size.width)
                }
            ],
            "provenance": ["kind": "Jobs-authored text, rendered locally by this source"],
            "ocr_validation": "not run by this fixture generator"
        ]
    }

    private static func inkBounds(_ bitmap: NSBitmapImageRep) throws -> [Int] {
        guard let bytes = bitmap.bitmapData,
              bitmap.bitsPerSample == 8,
              bitmap.samplesPerPixel == 4 else {
            throw failure(8, "Unexpected bitmap layout.")
        }
        var minX = bitmap.pixelsWide
        var minY = bitmap.pixelsHigh
        var maxX = -1
        var maxY = -1
        for y in 0..<bitmap.pixelsHigh {
            for x in 0..<bitmap.pixelsWide {
                let offset = y * bitmap.bytesPerRow + x * 4
                if bytes[offset] < 250 || bytes[offset + 1] < 250 || bytes[offset + 2] < 250 {
                    minX = min(minX, x)
                    minY = min(minY, y)
                    maxX = max(maxX, x)
                    maxY = max(maxY, y)
                }
            }
        }
        guard maxX >= minX, maxY >= minY else {
            throw failure(9, "No visible text was rendered.")
        }
        return [minX, minY, maxX, maxY]
    }

    private static func digest(_ data: Data) -> String {
        SHA256.hash(data: data).map { byte in
            String(format: "%02x", byte)
        }.joined()
    }

    private static func failure(_ code: Int,
                                _ description: String) -> NSError {
        NSError(domain: "JobsOCRMixedScriptFixture",
                code: code,
                userInfo: [NSLocalizedDescriptionKey: description])
    }
}
