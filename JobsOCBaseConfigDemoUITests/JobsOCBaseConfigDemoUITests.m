//
//  JobsOCBaseConfigDemoUITests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsOCBaseConfigDemoUITests.h"

@implementation JobsOCBaseConfigDemoUITests
-(void)setUp {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsSetUp)))(self, @selector(jobsSetUp));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsSetUp{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super setUp];
        self.byContinueAfterFailure(NO);
    };
}

-(void)tearDown {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsTearDown)))(self, @selector(jobsTearDown));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTearDown{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super tearDown];
    };
}

-(void)testAppCanLaunch {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsTestAppCanLaunch)))(self, @selector(jobsTestAppCanLaunch));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestAppCanLaunch{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        XCUIApplication *app = [[XCUIApplication alloc] init];
        [app launch];
        XCTAssertTrue(app.exists, @"UI 测试必须能启动被测 App。");
    };
}

-(void)testLaunchPerformance {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsTestLaunchPerformance)))(self, @selector(jobsTestLaunchPerformance));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestLaunchPerformance{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *)) {
            [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
                [[[XCUIApplication alloc] init] launch];
            }];
        }
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCBaseConfigDemoUITests
-(JobsRetJobsOCBaseConfigDemoUITestsByBOOLBlock _Nonnull)byContinueAfterFailure{
    @jobs_weakify(self)
    return ^__kindof JobsOCBaseConfigDemoUITests * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setContinueAfterFailure:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCBaseConfigDemoUITests
@end
