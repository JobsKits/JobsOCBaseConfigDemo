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

@interface JobsUIKitRegistrationTests : XCTestCase <UICollectionViewDataSource, UINavigationControllerDelegate>

@property(nonatomic,strong)UICollectionViewCell *lastCell;
@property(nonatomic,assign)NSUInteger logoutRequests;
@property(nonatomic,assign)NSUInteger logoutToastRequests;
@property(nonatomic,strong)UIViewController *expectedShownViewController;
@property(nonatomic,strong)XCTestExpectation *navigationShownExpectation;
@property(nonatomic,assign)BOOL lastNavigationWasAnimated;

@end

#endif /* JOBS_TEST_JOBSUIKITREGISTRATIONTESTS_H */
