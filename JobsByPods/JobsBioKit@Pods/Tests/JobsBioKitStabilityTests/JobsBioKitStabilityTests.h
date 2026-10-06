//
//  JobsBioKitStabilityTests.h
//  JobsBioKit
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsBioKit/JobsBioKitHeader.h>)
#import <JobsBioKit/JobsBioKitHeader.h>
#else
#import "JobsBioKitHeader.h"
#endif

@interface JobsBioKit (JobsStabilityTesting)
+(JobsRetJobsBioKitResultByNSErrorBlock)resultForError;
@end

@interface JobsBioKitStabilityTests : XCTestCase

@end
