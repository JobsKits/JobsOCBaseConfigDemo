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

@interface JobsOCAudioRecorderEngine (JobsStabilityTesting)
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)success;
@end

@interface JobsOCAudioRecorderStabilityTests : XCTestCase

@end
