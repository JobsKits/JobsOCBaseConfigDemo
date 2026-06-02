//
//  NotifiManager.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "NotifiView.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NotifiManager : NSObject

+ (instancetype)shared;
/** 设置队列的并发数(不可大于绑定的notifiView的个数) */
- (void)setQueueNaxConcurrentOperationCount:(NSInteger)count;
/** 显示notifiView */
- (void)showNotifiWithData:(id)data
                    onView:(UIView*)onView
               finishBlock:(FinishBlock)finishBlock;
/** 更新notifiView */
- (void)updateNotifiWithData:(id)data
                 finishBlock:(FinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
