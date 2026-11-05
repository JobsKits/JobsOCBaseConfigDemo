//
//  JobsOCVideoRecorderStabilityTests.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsOCVideoRecorder/JobsOCVideoRecorder.h>)
#import <JobsOCVideoRecorder/JobsOCVideoRecorder.h>
#else
#import "JobsOCVideoRecorder.h"
#endif

// 用途：声明自动化测试；验证录制收尾期间拒绝新会话，以及音视频格式描述并发清理安全。
// 运行：在 Xcode 的 Pods 工程 JobsOCVideoRecorder-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCVideoRecorderVC (JobsStabilityTesting)

-(jobsByVoidBlock)startRecord;
-(jobsByCMFormatDescriptionRefBlock)updateVideoFormatDescription;
-(jobsByVoidBlock)clearFormatDescriptions;

@end

@interface JobsOCVideoRecorderStabilityTests : XCTestCase

@end
