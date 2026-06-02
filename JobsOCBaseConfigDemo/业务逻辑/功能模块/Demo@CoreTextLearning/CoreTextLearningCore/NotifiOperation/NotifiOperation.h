//
//  NotifiOperation.h
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

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NotifiOperation : NSOperation

Prop_strong()id data;
/** 通知展示的父view */
Prop_strong()UIView *fatherView;
/** block */
Prop_copy()FinishBlock finishBlock;
/** showview */
Prop_strong()NotifiView *showView;
/**
 增加一个操作
 @param fatherView 通知要显示在的父view
 @param data 通知的数据
 @param finishBlock 回调操作结束
 @return 操作
 */
+ (instancetype)addOperatioOnView:(UIView *)fatherView
                             Info:(id)data
                    completeBlock:(FinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
