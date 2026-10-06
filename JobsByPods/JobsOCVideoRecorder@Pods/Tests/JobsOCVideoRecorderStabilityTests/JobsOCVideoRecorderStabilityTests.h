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

@interface JobsOCVideoRecorderVC (JobsStabilityTesting)
-(jobsByVoidBlock)startRecord;
-(jobsByCMFormatDescriptionRefBlock)updateVideoFormatDescription;
-(jobsByVoidBlock)clearFormatDescriptions;
@end

@interface JobsOCVideoRecorderStabilityTests : XCTestCase

@end
