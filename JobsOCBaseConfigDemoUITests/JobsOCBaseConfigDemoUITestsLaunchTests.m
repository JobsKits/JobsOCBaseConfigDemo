//
//  JobsOCBaseConfigDemoUITestsLaunchTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <XCTest/XCTest.h>

@interface JobsOCBaseConfigDemoUITestsLaunchTests : XCTestCase

@end

@implementation JobsOCBaseConfigDemoUITestsLaunchTests
+(BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

-(void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
}

-(void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
