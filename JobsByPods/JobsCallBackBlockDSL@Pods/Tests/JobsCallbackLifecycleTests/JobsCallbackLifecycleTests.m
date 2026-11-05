//
//  JobsCallbackLifecycleTests.m
//  JobsCallBackBlockDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsCallbackLifecycleTests.h"

// 用途：实现自动化测试；验证回调存储与调用，以及宿主释放后已保存的回调设置块仍可安全执行。
// 运行：在 Xcode 的 Pods 工程 JobsCallBackBlockDSL-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsCallbackLifecycleTests

-(void)testSavedCallbackSetterAfterOwnerRelease {
    JobsRetNSObjectByJobsByVoidBlock setter;
    __weak NSObject *owner;
    @autoreleasepool {
        NSObject *object = NSObject.new;
        owner = object;
        setter = object.byVoidBlock;
    }
    XCTAssertNil(owner);
    XCTAssertNil(setter(^{}));
}

-(void)testUniqueObjectCallbackOwnerStoresAndCalls {
    NSObject *object = NSObject.new;
    __block id received = nil;
    object.byObjBlock(^(id value) { received = value; });
    object.objBlock(@"payload");
    XCTAssertEqualObjects(received, @"payload");
}

@end
