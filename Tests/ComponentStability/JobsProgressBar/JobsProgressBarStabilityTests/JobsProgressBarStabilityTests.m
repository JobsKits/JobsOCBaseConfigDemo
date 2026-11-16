//
//  JobsProgressBarStabilityTests.m
//  JobsProgressBar
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsProgressBarStabilityTests.h"

// 用途：实现自动化测试；验证运行中的进度动画不强留视图、非有限输入规整及未启动对象释放。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@implementation JobsProgressBarStabilityTests

-(void)testRunningProgressDoesNotRetainViewAndNormalizesNonfiniteInput{
    __weak JobsProgressBar *weakProgress;
    @autoreleasepool {
        JobsProgressBar *progress = JobsProgressBar.new;
        progress.byProgress(NAN);
        XCTAssertEqual(progress.progress, 0);
        [progress startAutoProgressFromZero:YES step:NAN interval:INFINITY animated:NO];
        weakProgress = progress;
    }
    XCTAssertNil(weakProgress);
}


-(void)testUnstartedViewReleasesWithoutWeakRegistrationInDealloc{
    __weak JobsProgressBar *weakView;
    @autoreleasepool {
        JobsProgressBar *view = JobsProgressBar.new;
        weakView = view;
    }
    XCTAssertNil(weakView);
}


@end
