//
//  JobsOCBaseConfigDemoTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <XCTest/XCTest.h>

@interface JobsOCBaseConfigDemoTests : XCTestCase

@end

@implementation JobsOCBaseConfigDemoTests
-(void)setUp {
    [super setUp];
}

-(void)tearDown {
    [super tearDown];
}

-(void)testAppBundleCanBeLoaded {
    NSBundle *bundle = NSBundle.mainBundle;
    XCTAssertNotNil(bundle, @"测试进程必须能读取 App Bundle。");
}

-(void)testInfoPlistBundleIdentifierReadable {
    NSString *bundleIdentifier = NSBundle.mainBundle.bundleIdentifier;
    XCTAssertTrue(bundleIdentifier.length > 0, @"Info.plist 里必须能读到 Bundle Identifier。");
}

-(void)testPerformanceExample {
    [self measureBlock:^{
        (void)NSBundle.mainBundle.infoDictionary;
    }];
}

@end
