//
//  JobsAPIsStabilityTests.h
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsAPIs/UploadImageApi.h>

// 用途：声明自动化测试；验证真实请求代理的 GET 编码、超时与蜂窝约束、图片 multipart 上传、错误及取消传递。
// 运行：在 Xcode 的 Pods 工程 JobsAPIs-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsAPIsStabilityTests : XCTestCase

@end
