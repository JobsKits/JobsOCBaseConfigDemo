//
//  JobsRuntimeSafetyTests.m
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsRuntimeSafetyTests.h"

// 用途：实现自动化测试；验证动态调用的标量和结构体 ABI、非法调用拒绝、一次执行隔离及弱关联释放。
// 运行：在 Xcode 的 Pods 工程 JobsOCRuntimeKits-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsRuntimeSafetyTests

-(double)fixtureDouble:(double)left right:(double)right {
    return left + right;
}

-(CGRect)fixtureRect:(CGRect)rect offset:(NSNumber *)offset {
    return CGRectOffset(rect, offset.doubleValue, 0);
}

-(void)fixtureIncrement {
    self.fixtureCount++;
}

-(void *)fixturePointer {
    self.fixtureCount++;
    return NULL;
}

-(void)testTypedScalarsAndStructures {
    NSError *error = nil;
    id value = [NSObject methodName:@"fixtureDouble:right:" targetObj:self paramarrays:@[@1.25, @2.5] error:&error];
    XCTAssertEqualWithAccuracy([value doubleValue], 3.75, 0.0001);
    XCTAssertNil(error);
    CGRect rect = CGRectMake(1, 2, 3, 4);
    NSValue *boxed = [NSValue valueWithCGRect:rect];
    NSValue *result = [NSObject methodName:@"fixtureRect:offset:" targetObj:self paramarrays:@[boxed, @5] error:&error];
    XCTAssertTrue(CGRectEqualToRect(result.CGRectValue, CGRectOffset(rect, 5, 0)));
    XCTAssertNil(error);
}

-(void)testRejectedABIAndArityNeverInvokeTarget {
    NSError *error = nil;
    XCTAssertNil([NSObject methodName:@"fixtureDouble:right:" targetObj:self paramarrays:@[@1] error:&error]);
    XCTAssertNotNil(error);
    XCTAssertNil([NSObject methodName:@"fixturePointer" targetObj:self paramarrays:nil error:&error]);
    XCTAssertNotNil(error);
    XCTAssertEqual(self.fixtureCount, 0u);
    XCTAssertNil([NSObject methodName:@"copy" targetObj:self paramarrays:nil error:&error]);
    XCTAssertNotNil(error);
}

-(void)testOnceIsPerOwnerAndSelector {
    JobsRuntimeSafetyTests *other = JobsRuntimeSafetyTests.new;
    self.dispatchOnceInvokingWithMethodName(@"fixtureIncrement");
    self.dispatchOnceInvokingWithMethodName(@"fixtureIncrement");
    other.dispatchOnceInvokingWithMethodName(@"fixtureIncrement");
    XCTAssertEqual(self.fixtureCount, 1u);
    XCTAssertEqual(other.fixtureCount, 1u);
}

-(void)testWeakAssociationDoesNotChangeClassOrRetainValue {
    static const char key = 0;
    NSObject *first = NSObject.new;
    NSObject *second = NSObject.new;
    Class cls = object_getClass(first);
    __weak NSObject *weakValue;
    @autoreleasepool {
        NSObject *value = NSObject.new;
        weakValue = value;
        JobsSetAssociatedWeakObject(first, &key, value);
        JobsSetAssociatedWeakObject(second, &key, value);
        XCTAssertEqual(JobsGetAssociatedWeakObject(first, &key), value);
        XCTAssertEqual(object_getClass(first), cls);
    }
    XCTAssertNil(weakValue);
    XCTAssertNil(JobsGetAssociatedWeakObject(first, &key));
    XCTAssertNil(JobsGetAssociatedWeakObject(second, &key));
    XCTAssertEqual(object_getClass(second), NSObject.class);
}

@end
