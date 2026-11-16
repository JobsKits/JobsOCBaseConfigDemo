//
//  JobsOCKeyboardMgrStabilityTests.m
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCKeyboardMgrStabilityTests.h"

// 用途：实现自动化测试；验证键盘管理器释放后，已保存的开始和停止监听块安全返回。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

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
