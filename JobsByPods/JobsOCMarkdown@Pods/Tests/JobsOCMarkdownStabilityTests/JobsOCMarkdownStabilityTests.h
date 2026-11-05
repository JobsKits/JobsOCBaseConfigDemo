//
//  JobsOCMarkdownStabilityTests.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCMarkdown/JobsOCMarkdown.h>

// 用途：声明自动化测试；验证 Markdown 文档 DSL 不递归重入，以及未启动视图释放时的弱引用安全。
// 运行：在 Xcode 的 Pods 工程 JobsOCMarkdown-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCMarkdownStabilityTests : XCTestCase

@end
