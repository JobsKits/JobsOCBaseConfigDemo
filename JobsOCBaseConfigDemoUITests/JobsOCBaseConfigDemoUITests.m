//
//  JobsOCBaseConfigDemoUITests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/7/3.
//

#import "JobsOCBaseConfigDemoUITests.h"

@implementation JobsOCBaseConfigDemoUITests
- (void)setUp {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsSetUp)))(self, @selector(jobsSetUp));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsSetUp{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        self.byContinueAfterFailure(NO);
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    };
}

- (void)tearDown {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsTearDown)))(self, @selector(jobsTearDown));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTearDown{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    };
}

- (void)testExample {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsTestExample)))(self, @selector(jobsTestExample));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestExample{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        // UI tests must launch the application that they test.
        XCUIApplication *app = [[XCUIApplication alloc] init];
        [app launch];
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    };
}

- (void)testLaunchPerformance {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITests.class, @selector(jobsTestLaunchPerformance)))(self, @selector(jobsTestLaunchPerformance));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestLaunchPerformance{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *)) {
            // This measures how long it takes to launch your application.
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
