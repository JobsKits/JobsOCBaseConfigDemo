//
//  JobsDebugJSONTests.m
//  JobsDebug
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugJSONTests.h"

@implementation JobsDebugJSONTests

#if DEBUG
-(void)testSortedJSONAndInvalidContainerFallback {
    NSDictionary *object = @{@"z": @1, @"a": @2};
    NSString *json = object.convertToJsonString();
    XCTAssertTrue([json rangeOfString:@"\"a\""].location < [json rangeOfString:@"\"z\""].location);
    XCTAssertNil((@[NSDate.date]).convertToJsonString());
    NSMutableArray *cycle = [NSMutableArray array];
    [cycle addObject:cycle];
    XCTAssertNil(cycle.convertToJsonString());
    [cycle removeAllObjects];
#if !JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    XCTAssertFalse([object.description containsString:@"\"a\""]);
#endif
}

-(void)testSavedJSONBlockAfterContainerRelease {
    JobsRetStrByVoidBlock action;
    __weak NSArray *owner;
    @autoreleasepool {
        NSArray *array = [NSArray arrayWithObjects:NSUUID.UUID.UUIDString, nil];
        owner = array;
        action = array.convertToJsonString;
    }
    XCTAssertNil(owner);
    XCTAssertNil(action());
}
#endif
@end
