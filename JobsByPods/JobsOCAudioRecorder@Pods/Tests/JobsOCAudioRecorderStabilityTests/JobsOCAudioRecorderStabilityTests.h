//
//  JobsOCAudioRecorderStabilityTests.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsOCAudioRecorder/JobsOCAudioRecorder.h>)
#import <JobsOCAudioRecorder/JobsOCAudioRecorder.h>
#else
#import "JobsOCAudioRecorder.h"
#endif

// 用途：声明自动化测试；验证录音和播放的初始化失败清理、会话互斥及旧回调不干扰新任务。
// 运行：在 Xcode 的 Pods 工程 JobsOCAudioRecorder-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCAudioRecorderEngine (JobsStabilityTesting)

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)success;

@end

@interface JobsOCAudioRecorderStabilityTests : XCTestCase

@end
