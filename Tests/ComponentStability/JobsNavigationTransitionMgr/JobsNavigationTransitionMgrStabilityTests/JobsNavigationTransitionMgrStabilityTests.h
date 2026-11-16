//
//  JobsNavigationTransitionMgrStabilityTests.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsNavigationTransitionMgr/JobsNavigationTransitionMgrHeader.h>)
#import <JobsNavigationTransitionMgr/JobsNavigationTransitionMgrHeader.h>
#else
#import "JobsNavigationTransitionMgrHeader.h"
#endif

// 用途：声明自动化测试；验证导航手势按容器隔离、重复挂载去重、取消转场恢复位置及控制器释放。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

#if __has_include(<JobsByOCPods/UIViewController+Extra.h>)
#import <JobsByOCPods/UIViewController+Extra.h>
#else
#import "UIViewController+Extra.h"
#endif

@interface JobsNavigationTransitionMgrStabilityTests : XCTestCase

@end
