//
//  JobsAPIsStabilityTests.h
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsAPIs/UploadImageApi.h>)
#import <JobsAPIs/UploadImageApi.h>
#else
#import "UploadImageApi.h"
#endif

// 用途：声明自动化测试；验证真实请求代理的 GET 编码、超时与蜂窝约束、图片 multipart 上传、错误及取消传递。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsAPIsStabilityTests : XCTestCase

@end
