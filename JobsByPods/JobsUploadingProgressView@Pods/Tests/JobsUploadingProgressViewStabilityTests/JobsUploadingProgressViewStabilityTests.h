//
//  JobsUploadingProgressViewStabilityTests.h
//  JobsUploadingProgressView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsUploadingProgressView/JobsUploadingProgressView.h>

// 用途：声明自动化测试；验证上传进度隐藏后再次展示会重启动画，且指定宿主不被视图强留。
// 运行：在 Xcode 的 Pods 工程 JobsUploadingProgressView-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsUploadingProgressViewStabilityTests : XCTestCase

@end
