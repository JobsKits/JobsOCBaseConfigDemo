//
//  JobsBioKitStabilityTests.m
//  JobsBioKit
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsBioKitStabilityTests.h"

@implementation JobsBioKitStabilityTests

-(void)testBiometryAndInteractionErrorsStayDistinct{
    NSDictionary<NSNumber *, NSNumber *> *cases = @{
        @(LAErrorBiometryNotAvailable):@(JobsBioKitResultBiometryNotAvailable),
        @(LAErrorBiometryNotEnrolled):@(JobsBioKitResultBiometryNotEnrolled),
        @(LAErrorBiometryLockout):@(JobsBioKitResultBiometryLockout),
        @(LAErrorNotInteractive):@(JobsBioKitResultNotInteractive),
        @(LAErrorUserCancel):@(JobsBioKitResultUserCancel)
    };
    for (NSNumber *code in cases) {
        NSError *error = [NSError errorWithDomain:LAErrorDomain code:code.integerValue userInfo:nil];
        XCTAssertEqual(JobsBioKit.resultForError(error), cases[code].integerValue);
    }
    XCTAssertEqual(JobsBioKit.resultForError([NSError errorWithDomain:@"other" code:LAErrorBiometryLockout userInfo:nil]), JobsBioKitResultFailed);
}

@end
