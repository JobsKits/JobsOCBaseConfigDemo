//
//  NotifiManager.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "NotifiView.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class NotifiManager;
typedef NotifiManager *_Nullable(^JobsRetNotifiManagerByVoidBlock)(void);

@interface NotifiManager : NSObject

+ (JobsRetNotifiManagerByVoidBlock _Nonnull)shared;
/** 设置队列的并发数(不可大于绑定的notifiView的个数) */
-(jobsByNSIntegerBlock _Nonnull)setQueueNaxConcurrentOperationCount;
/** 显示notifiView */
- (void)showNotifiWithData:(id)data
                    onView:(UIView*)onView
               finishBlock:(FinishBlock)finishBlock;
/** 更新notifiView */
- (void)updateNotifiWithData:(id)data
                 finishBlock:(FinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
