//
//  NSNotificationCenter+JobsBlock.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSNOTIFICATIONCENTER_JOBSBLOCK_8BED577B9B
#define JOBS_HEADER_GUARD_NSNOTIFICATIONCENTER_JOBSBLOCK_8BED577B9B

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (JobsBlock)

Prop_copy()jobsByNotificationBlock jobsNotificationBlock;

-(jobsByIDBlock _Nonnull)remove;
-(jobsByKey_ValueBlock _Nonnull)Remove;

@end

NS_ASSUME_NONNULL_END
/**
 使用方法 1：
 [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
                                     object:nil
                                      queue:nil
                                 usingBlock:^(NSNotification * _Nonnull notification) {
        NSString *d = notification.name;
        JobsLog(@"");
 }];
 =================================================================================================
 或者，使用方法 2：
 JobsNotificationCenter.jobsNotificationBlock = ^(NSNotification * _Nonnull notification) {
     NSString *d = notification.name;
     JobsLog(@"");
 };

 // 添加观察者监听通知
 [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
                                     object:nil
                                      queue:nil
                                 usingBlock:JobsNotificationCenter.jobsNotificationBlock];
 =================================================================================================
 或者，使用方法 3：
 [JobsNotificationCenter addObserver:self
                            selector:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                             id  _Nullable arg) {
        JobsLog(@"SSSS加载新的数据，参数: %@", arg);
        /// 在需要结束刷新的时候调用（只能调用一次）
        /// _collectionView.endRefreshing(YES);
        return nil;
    }, MethodName(self), self)
                                name:GSUploadNetworkSpeedNotificationKey
                              object:nil];
 
 */
#endif /* JOBS_HEADER_GUARD_NSNOTIFICATIONCENTER_JOBSBLOCK_8BED577B9B */
