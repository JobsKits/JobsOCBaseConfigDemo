//
//  MJRefreshConfigModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_MJREFRESHCONFIGMODEL_DSL_EBB236DA06589C9D
#define JOBS_HEADER_GUARD_MJREFRESHCONFIGMODEL_DSL_EBB236DA06589C9D

#if __has_include(<JobsModel/MJRefreshConfigModel.h>)
#import <JobsModel/MJRefreshConfigModel.h>
#else
#import "MJRefreshConfigModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshConfigModel (DSL)

#pragma mark —— 来自 MJRefreshConfigModel
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(UIFont * data))byFont;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(UIColor * data))byTextColor;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byStateIdleDuration;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byPullingDuration;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byRefreshingDuration;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byWillRefreshDuration;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byNoMoreDataDuration;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byStateIdleTitle;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byPullingTitle;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byRefreshingTitle;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byWillRefreshTitle;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byNoMoreDataTitle;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byStateIdlePicsMutArr;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byPullingPicsMutArr;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byRefreshingPicsMutArr;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byWillRefreshPicsMutArr;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byNoMoreDataPicsMutArr;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byJsonLottiefilePaths;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byLoadBlock;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(BOOL data))byAutomaticallyChangeAlpha;
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShake;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MJREFRESHCONFIGMODEL_DSL_EBB236DA06589C9D */
