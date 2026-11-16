//
//  JobsWindowSceneFixture.h
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSWINDOWSCENEFIXTURE_H
#define JOBS_TEST_JOBSWINDOWSCENEFIXTURE_H

#import <UIKit/UIKit.h>

// 用途：声明测试替身（fixture）；提供可控的窗口集合、Scene 活跃状态和会话标识，供窗口筛选测试。
// 运行：由 JobsGetWindow-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsWindowSceneFixture : NSObject

@property(nonatomic,copy)NSArray<UIWindow *> *windows;
@property(nonatomic,assign)UISceneActivationState activationState;
@property(nonatomic,copy)NSString *persistentIdentifier;
@property(nonatomic,strong,readonly)JobsWindowSceneFixture *session;

@end

#endif /* JOBS_TEST_JOBSWINDOWSCENEFIXTURE_H */
