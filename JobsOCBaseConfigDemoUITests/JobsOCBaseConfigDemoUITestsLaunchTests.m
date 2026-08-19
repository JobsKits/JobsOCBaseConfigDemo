//
//  JobsOCBaseConfigDemoUITestsLaunchTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/7/3.
//

#import "JobsOCBaseConfigDemoUITestsLaunchTests.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN XCTAttachment
@interface XCTAttachment (JobsLocalPropertyDSLAutogen_a55704dceb)
-(JobsRetXCTAttachmentByNSStringBlock _Nonnull)byName;
-(JobsRetXCTAttachmentByXCTAttachmentLifetimeBlock _Nonnull)byLifetime;
-(void)setLifetime:(XCTAttachmentLifetime)data;
-(void)setName:(NSString * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END XCTAttachment

@implementation JobsOCBaseConfigDemoUITestsLaunchTests
+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    JobsRetBOOLByVoidBlock action = ((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsOCBaseConfigDemoUITestsLaunchTests.class, @selector(jobsRunsForEachTargetApplicationUIConfiguration)))(self, @selector(jobsRunsForEachTargetApplicationUIConfiguration));
    return action ? action() : NO;
}

+(JobsRetBOOLByVoidBlock _Nonnull)jobsRunsForEachTargetApplicationUIConfiguration{
    return ^BOOL{
        return YES;
    };
}

- (void)setUp {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITestsLaunchTests.class, @selector(jobsSetUp)))(self, @selector(jobsSetUp));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsSetUp{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byContinueAfterFailure(NO);
    };
}

- (void)testLaunch {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoUITestsLaunchTests.class, @selector(jobsTestLaunch)))(self, @selector(jobsTestLaunch));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestLaunch{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        XCUIApplication *app = [[XCUIApplication alloc] init];
        [app launch];
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
        attachment.byName(@"Launch Screen");
        attachment.byLifetime(XCTAttachmentLifetimeKeepAlways);
        [self addAttachment:attachment];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCBaseConfigDemoUITestsLaunchTests
-(JobsRetJobsOCBaseConfigDemoUITestsLaunchTestsByBOOLBlock _Nonnull)byContinueAfterFailure{
    @jobs_weakify(self)
    return ^__kindof JobsOCBaseConfigDemoUITestsLaunchTests * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setContinueAfterFailure:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCBaseConfigDemoUITestsLaunchTests
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN XCTAttachment
@implementation XCTAttachment (JobsLocalPropertyDSLAutogen_a55704dceb)
-(JobsRetXCTAttachmentByNSStringBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof XCTAttachment * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setName:data];
        return self;
    };
}

-(JobsRetXCTAttachmentByXCTAttachmentLifetimeBlock _Nonnull)byLifetime{
    @jobs_weakify(self)
    return ^__kindof XCTAttachment * _Nullable(XCTAttachmentLifetime data){
        @jobs_strongify(self)
        [self setLifetime:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END XCTAttachment
