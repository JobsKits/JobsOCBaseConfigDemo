//
//  JobsAppToolsResetTests.m
//  JobsAppTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAppToolsResetTests.h"

@implementation JobsAppToolsResetTests

-(void)testConcurrentReadersShareOneGeneration {
    JobsAppTools.jobsDestroySingleton();
    JobsAppTools *expected = JobsAppTools.jobsSharedManager();
    __block BOOL mismatch = NO;
    NSObject *monitor = NSObject.new;
    dispatch_apply(128, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
        JobsAppTools *actual = JobsAppTools.jobsSharedManager();
        if (actual != expected) {
            @synchronized (monitor) {
                mismatch = YES;
            }
        }
    });
    XCTAssertFalse(mismatch);
    JobsAppTools.jobsDestroySingleton();
    JobsAppTools *next = JobsAppTools.jobsSharedManager();
    XCTAssertNotEqual(next, expected);
    XCTAssertNotNil(expected);
    XCTAssertEqual([JobsAppTools alloc], next);
}
-(void)testConcurrentDestroyAndReadPreservesRetainedGenerations {
    JobsAppTools.jobsDestroySingleton();
    JobsAppTools *retained = JobsAppTools.jobsSharedManager();
    NSMutableArray<JobsAppTools *> *generations = NSMutableArray.new;
    NSObject *monitor = NSObject.new;
    __block BOOL invalidInstance = NO;
    dispatch_apply(128, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
        @autoreleasepool {
            if (index % 2 == 0) {
                JobsAppTools.jobsDestroySingleton();
            }
            JobsAppTools *actual = JobsAppTools.jobsSharedManager();
            @synchronized (monitor) {
                if (![actual isKindOfClass:JobsAppTools.class] || [actual copy] != actual) {
                    invalidInstance = YES;
                }
                if (actual) {
                    [generations addObject:actual];
                }
            }
        }
    });
    XCTAssertFalse(invalidInstance);
    XCTAssertEqual(generations.count, 128u);
    XCTAssertEqual([retained copy], retained);
    JobsAppTools.jobsDestroySingleton();
    JobsAppTools *finalGeneration = JobsAppTools.jobsSharedManager();
    XCTAssertNotEqual(finalGeneration, retained);
    dispatch_apply(128, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
        JobsAppTools *actual = JobsAppTools.jobsSharedManager();
        @synchronized (monitor) {
            invalidInstance |= actual != finalGeneration;
        }
    });
    XCTAssertFalse(invalidInstance);
    for (JobsAppTools *generation in generations) {
        XCTAssertEqual([generation copy], generation);
    }
}
@end
