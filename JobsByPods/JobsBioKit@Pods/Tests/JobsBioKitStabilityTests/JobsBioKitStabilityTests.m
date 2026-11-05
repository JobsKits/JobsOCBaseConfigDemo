//
//  JobsBioKitStabilityTests.m
//  JobsBioKit
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsBioKitStabilityTests.h"

// 用途：实现自动化测试；验证生物识别不可用与交互失败的错误分类保持可区分。
// 运行：在 Xcode 的 Pods 工程 JobsBioKit-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

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
