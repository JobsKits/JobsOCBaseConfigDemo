//
//  JobsWindowFixture.h
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSWINDOWFIXTURE_H
#define JOBS_TEST_JOBSWINDOWFIXTURE_H

#import <UIKit/UIKit.h>

// 用途：声明测试替身（fixture）；模拟窗口的 keyWindow 状态，供窗口选择用例组合前台场景。
// 运行：由 JobsGetWindow-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsWindowFixture : UIWindow

@property(nonatomic,assign)BOOL simulatedKeyWindow;

@end

#endif /* JOBS_TEST_JOBSWINDOWFIXTURE_H */
