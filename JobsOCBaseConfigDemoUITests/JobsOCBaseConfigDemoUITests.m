//
//  JobsOCBaseConfigDemoUITests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <XCTest/XCTest.h>

@interface JobsOCBaseConfigDemoUITests : XCTestCase

@end

@implementation JobsOCBaseConfigDemoUITests

-(void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
}

-(void)tearDown {
    [super tearDown];
}

-(void)testAppCanLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    XCTAssertTrue(app.exists, @"UI 测试必须能启动被测 App。");
}

-(void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *)) {
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
