//
//  JobsUIKitRegistrationTests.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSUIKITREGISTRATIONTESTS_H
#define JOBS_TEST_JOBSUIKITREGISTRATIONTESTS_H

#import <XCTest/XCTest.h>
#import <JobsByOCPods/UICollectionView+RegistrationTracking.h>
#import <JobsByOCPods/UINavigationController+SafeTransition.h>
#import <JobsByOCPods/NSObject+PopViewToLogOut.h>
#import <JobsByOCPods/NSObject+Extra.h>

// 用途：声明自动化测试；验证 UIKit 注册和安全导航、多语言通知、注销弹窗及弱引用回调的生命周期。
// 运行：在 Xcode 的 Pods 工程 JobsByOCPods-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsUIKitRegistrationTests : XCTestCase <UICollectionViewDataSource, UINavigationControllerDelegate>

@property(nonatomic,strong)UICollectionViewCell *lastCell;
@property(nonatomic,assign)NSUInteger logoutRequests;
@property(nonatomic,assign)NSUInteger logoutToastRequests;
@property(nonatomic,strong)UIViewController *expectedShownViewController;
@property(nonatomic,strong)XCTestExpectation *navigationShownExpectation;
@property(nonatomic,assign)BOOL lastNavigationWasAnimated;

@end

#endif /* JOBS_TEST_JOBSUIKITREGISTRATIONTESTS_H */
