//
//  JobsOCKeyboardMgrStabilityTests.m
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCKeyboardMgrStabilityTests.h"

@implementation JobsOCKeyboardMgrStabilityTests

-(void)testSavedStartAndStopReturnNilAfterManagerReleases{
    JobsRetJobsOCKeyboardMgrByVoidBlock start;
    JobsRetJobsOCKeyboardMgrByVoidBlock stop;
    JobsRetJobsOCKeyboardMgrByConfigBlock configure;
    @autoreleasepool {
        JobsOCKeyboardMgr *manager = JobsOCKeyboardMgr.new;
        start = manager.start;
        stop = manager.stop;
        configure = manager.byConfig;
    }
    XCTAssertNil(start());
    XCTAssertNil(stop());
    XCTAssertNil(configure(nil));
}

@end
