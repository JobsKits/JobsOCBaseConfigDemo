//
//  JobsCallbackLifecycleTests.m
//  JobsCallBackBlockDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsCallbackLifecycleTests.h"

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
