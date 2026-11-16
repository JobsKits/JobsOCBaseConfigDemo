//
//  JobsUploadingProgressViewStabilityTests.h
//  JobsUploadingProgressView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
// 旧主工程使用公共声明入口，并明确选中维护中的实现，避开手工引入的同名头。
#import "../../../../Libs/JobsOCBaseCustomizeUIKitCore/JobsBaseCustomizeUIKitCoreHeader.h"
#import "../../../../Libs/OCBaseConfig/JobsMixFunc/JobsUploadingProgressView/JobsUploadingProgressView/JobsUploadingProgressView.h"

// 用途：声明自动化测试；验证上传进度隐藏后再次展示会重启动画，且指定宿主不被视图强留。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsUploadingProgressViewStabilityTests : XCTestCase

@end
