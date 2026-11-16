//
//  JobsUIKitRegistrationTests.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSUIKITREGISTRATIONTESTS_H
#define JOBS_TEST_JOBSUIKITREGISTRATIONTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsByOCPods/UICollectionView+RegistrationTracking.h>)
#import <JobsByOCPods/UICollectionView+RegistrationTracking.h>
#else
#import "UICollectionView+RegistrationTracking.h"
#endif
#if __has_include(<JobsByOCPods/UINavigationController+SafeTransition.h>)
#import <JobsByOCPods/UINavigationController+SafeTransition.h>
#else
#import "UINavigationController+SafeTransition.h"
#endif
#if __has_include(<JobsByOCPods/NSObject+PopViewToLogOut.h>)
#import <JobsByOCPods/NSObject+PopViewToLogOut.h>
#else
#import "NSObject+PopViewToLogOut.h"
#endif
#if __has_include(<JobsByOCPods/NSObject+Extra.h>)
#import <JobsByOCPods/NSObject+Extra.h>
#else
#import "NSObject+Extra.h"
#endif

// 用途：声明自动化测试；验证 UIKit 注册和安全导航、多语言通知、注销弹窗及弱引用回调的生命周期。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

#if __has_include(<JobsByOCPods/NSObject+Extra.h>)
#import <JobsByOCPods/NSObject+Extra.h>
#else
#import "NSObject+Extra.h"
#endif

#if __has_include(<JobsByOCPods/NSObject+Notification.h>)
#import <JobsByOCPods/NSObject+Notification.h>
#else
#import "NSObject+Notification.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDSL/UIView+Gesture.h>)
#import <JobsOCDSL/UIView+Gesture.h>
#else
#import "UIView+Gesture.h"
#endif

#if __has_include(<JobsOCDSL/UIGestureRecognizer+Extra.h>)
#import <JobsOCDSL/UIGestureRecognizer+Extra.h>
#else
#import "UIGestureRecognizer+Extra.h"
#endif

#if __has_include(<JobsOCRuntimeKits/NSObject+DynamicInvoke.h>)
#import <JobsOCRuntimeKits/NSObject+DynamicInvoke.h>
#else
#import "NSObject+DynamicInvoke.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsSEL_IMP.h>)
#import <JobsOCRuntimeKits/JobsSEL_IMP.h>
#else
#import "JobsSEL_IMP.h"
#endif

@interface JobsUIKitRegistrationTests : XCTestCase <UICollectionViewDataSource, UINavigationControllerDelegate>

@property(nonatomic,strong)UICollectionViewCell *lastCell;
@property(nonatomic,assign)NSUInteger logoutRequests;
@property(nonatomic,assign)NSUInteger logoutToastRequests;
@property(nonatomic,strong)UIViewController *expectedShownViewController;
@property(nonatomic,strong)XCTestExpectation *navigationShownExpectation;
@property(nonatomic,assign)BOOL lastNavigationWasAnimated;

@end

#endif /* JOBS_TEST_JOBSUIKITREGISTRATIONTESTS_H */
