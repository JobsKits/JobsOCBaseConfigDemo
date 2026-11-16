//
//  JobsMarqueeViewStabilityTests.m
//  JobsMarqueeView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsMarqueeViewStabilityTests.h"

// 用途：实现自动化测试；验证尚未启动的跑马灯视图能够释放，析构期间不重新注册弱引用。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@implementation JobsMarqueeViewStabilityTests



-(void)testUnstartedViewReleasesWithoutWeakRegistrationInDealloc{
    __weak JobsMarqueeView *weakView;
    @autoreleasepool {
        JobsMarqueeView *view = JobsMarqueeView.new;
        weakView = view;
    }
    XCTAssertNil(weakView);
}


@end
