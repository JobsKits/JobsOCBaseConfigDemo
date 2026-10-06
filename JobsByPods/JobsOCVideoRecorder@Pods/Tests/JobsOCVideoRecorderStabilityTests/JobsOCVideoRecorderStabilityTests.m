//
//  JobsOCVideoRecorderStabilityTests.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCVideoRecorderStabilityTests.h"

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
