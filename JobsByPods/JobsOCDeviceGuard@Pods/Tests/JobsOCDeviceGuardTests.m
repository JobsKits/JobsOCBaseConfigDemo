//
//  JobsOCDeviceGuardTests.m
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardTests.h"

static JobsOCDeviceGuardCheck *JobsGuardTestCheck(JobsOCDeviceGuardCategory category, JobsOCDeviceGuardCheckStatus status) {
    return [[JobsOCDeviceGuardCheck alloc] initWithCategory:category status:status identifier:@"test" detail:@"test" errorCode:0];
}

@implementation JobsOCDeviceGuardTests

-(void)testRepeatedPathsCountAsOneCategory {
    JobsOCDeviceGuardReport *report = [[JobsOCDeviceGuardReport alloc]
        initWithChecks:@[JobsGuardTestCheck(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusDetected),
                         JobsGuardTestCheck(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusDetected)]
        configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration() unsupportedReason:@""];
    XCTAssertEqual(report.detectedCategories.count, 1);
    XCTAssertEqual(report.verdict, JobsOCDeviceGuardVerdictSuspicious);
    XCTAssertFalse(report.isJailbroken);
    XCTAssertTrue(report.shouldRestrict);
}

-(void)testIndependentCategoriesMeetThreshold {
    NSArray *checks = @[JobsGuardTestCheck(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusDetected),
                        JobsGuardTestCheck(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusDetected)];
    JobsOCDeviceGuardReport *report = [[JobsOCDeviceGuardReport alloc] initWithChecks:checks
        configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration() unsupportedReason:@""];
    XCTAssertEqual(report.verdict, JobsOCDeviceGuardVerdictJailbroken);
    JobsOCDeviceGuardReport *strict = [[JobsOCDeviceGuardReport alloc] initWithChecks:checks
        configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration().byMinimumDetectedCategories(3) unsupportedReason:@""];
    XCTAssertEqual(strict.verdict, JobsOCDeviceGuardVerdictSuspicious);
}

-(void)testUnavailableAndEmptyNeverPass {
    for (NSArray *checks in @[@[], @[JobsGuardTestCheck(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusUnavailable)],
                              @[JobsGuardTestCheck(JobsOCDeviceGuardCategorySandbox, JobsOCDeviceGuardCheckStatusSkipped)]]) {
        JobsOCDeviceGuardReport *report = [[JobsOCDeviceGuardReport alloc] initWithChecks:checks
            configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration() unsupportedReason:@""];
        XCTAssertEqual(report.verdict, JobsOCDeviceGuardVerdictIndeterminate);
        XCTAssertTrue(report.shouldRestrict);
    }
    JobsOCDeviceGuardReport *partial = [[JobsOCDeviceGuardReport alloc]
        initWithChecks:@[JobsGuardTestCheck(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusPassed),
                         JobsGuardTestCheck(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusUnavailable)]
        configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration() unsupportedReason:@""];
    XCTAssertEqual(partial.verdict, JobsOCDeviceGuardVerdictIndeterminate);
}

-(void)testNoIndicatorsIsNotJailbroken {
    JobsOCDeviceGuardReport *report = [[JobsOCDeviceGuardReport alloc]
        initWithChecks:@[JobsGuardTestCheck(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusPassed)]
        configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration() unsupportedReason:@""];
    XCTAssertEqual(report.verdict, JobsOCDeviceGuardVerdictNoIndicators);
    XCTAssertFalse(report.shouldRestrict);
    XCTAssertFalse(report.isJailbroken);
}

-(void)testUnsupportedOverridesEvidence {
    JobsOCDeviceGuardReport *report = [[JobsOCDeviceGuardReport alloc]
        initWithChecks:@[JobsGuardTestCheck(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusDetected),
                         JobsGuardTestCheck(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusDetected)]
        configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration() unsupportedReason:@"Simulator"];
    XCTAssertEqual(report.verdict, JobsOCDeviceGuardVerdictUnsupported);
    XCTAssertTrue(report.shouldRestrict);
}

-(void)testConfigurationIsCopiedAndThresholdClamped {
    JobsOCDeviceGuardConfiguration *configuration = JobsOCDeviceGuardConfiguration.defaultConfiguration().byMinimumDetectedCategories(0);
    XCTAssertEqual(configuration.minimumDetectedCategories, 2);
    JobsOCDeviceGuardConfiguration *snapshot = [configuration copy];
    configuration.bySandboxWriteProbeEnabled(YES).byMinimumDetectedCategories(99);
    XCTAssertFalse(snapshot.sandboxWriteProbeEnabled);
    XCTAssertEqual(snapshot.minimumDetectedCategories, 2);
    XCTAssertEqual(configuration.minimumDetectedCategories, 3);
}

-(void)testAsyncCompletionReturnsOnMainOnce {
    XCTestExpectation *expectation = [self expectationWithDescription:@"main completion"];
    expectation.assertForOverFulfill = YES;
    [JobsOCDeviceGuardDetector detectAsyncWithConfiguration:JobsOCDeviceGuardConfiguration.defaultConfiguration()
        completion:^(JobsOCDeviceGuardReport *report) {
            XCTAssertTrue(NSThread.isMainThread);
            XCTAssertNotNil(report);
#if TARGET_OS_SIMULATOR
            XCTAssertEqual(report.verdict, JobsOCDeviceGuardVerdictUnsupported);
            XCTAssertEqual(report.checks.count, 3);
#endif
            [expectation fulfill];
        }];
    [self waitForExpectations:@[expectation] timeout:5];
}

@end
