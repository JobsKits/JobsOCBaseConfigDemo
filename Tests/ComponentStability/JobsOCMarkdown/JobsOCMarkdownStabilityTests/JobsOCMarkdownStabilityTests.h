//
//  JobsOCMarkdownStabilityTests.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCMarkdown/JobsOCMarkdown.h>)
#import <JobsOCMarkdown/JobsOCMarkdown.h>
#else
#import "JobsOCMarkdown.h"
#endif

// 用途：声明自动化测试；验证 Markdown 文档 DSL 不递归重入，以及未启动视图释放时的弱引用安全。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCMarkdownStabilityTests : XCTestCase

@end
