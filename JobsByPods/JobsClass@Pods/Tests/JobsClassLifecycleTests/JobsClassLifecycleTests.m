//
//  JobsClassLifecycleTests.m
//  JobsClass
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsClassLifecycleTests.h"

@implementation JobsClassLifecycleTests

-(void)testSavedOrderedPropertyReaderAfterOwnerRelease {
    JobsRetArrByVoidBlock reader;
    __weak NSObject *owner;
    @autoreleasepool {
        NSObject *object = NSObject.new;
        owner = object;
        reader = object.readModelPropertyValueByOrder;
    }
    XCTAssertNil(owner);
    XCTAssertNil(reader());
}
@end
