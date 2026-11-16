//
//  JobsImageNumberViewStabilityTests.m
//  JobsImageNumberView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsImageNumberViewStabilityTests.h"

// 用途：实现自动化测试；验证图片数字视图释放后，已保存的模型配置块不访问失效宿主。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@implementation JobsImageNumberViewStabilityTests

-(void)testSavedModelBlockAfterImageViewReleaseIsSafe{
    __weak JobsImageNumberView *weakView = nil;
    __block jobsByIDBlock modelBlock;
    @autoreleasepool {
        JobsImageNumberView *view = JobsImageNumberView.new;
        weakView = view;
        modelBlock = view.jobsRichViewByModel;
    }
    XCTAssertNil(weakView);
    XCTAssertNotNil(modelBlock);
    modelBlock(@[]);
}

@end
