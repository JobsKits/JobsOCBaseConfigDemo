//
//  JobsOCVideoRecorderStabilityTests.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCVideoRecorderStabilityTests.h"

// 用途：实现自动化测试；验证录制收尾期间拒绝新会话，以及音视频格式描述并发清理安全。
// 运行：在 Xcode 的 Pods 工程 JobsOCVideoRecorder-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsOCVideoRecorderStabilityTests

-(void)testFinishingRejectsNewSessionAndFormatDescriptionsCanBeClearedConcurrently{
    JobsOCVideoRecorderVC *controller = [[JobsOCVideoRecorderVC alloc] init];
    [controller setValue:@YES forKey:@"permissionReady"];
    [controller setValue:@YES forKey:@"finishingRecord"];
    controller.startRecord();
    XCTAssertFalse([[controller valueForKey:@"recording"] boolValue]);
    XCTAssertNil([controller valueForKey:@"assetWriter"]);
    CMVideoFormatDescriptionRef format = NULL;
    XCTAssertEqual(CMVideoFormatDescriptionCreate(kCFAllocatorDefault, kCVPixelFormatType_32BGRA, 64, 64, NULL, &format), noErr);
    dispatch_apply(200, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
        controller.updateVideoFormatDescription(format);
        controller.clearFormatDescriptions();
    });
    CFRelease(format);
    controller.clearFormatDescriptions();
}

@end
