//
//  JobsBitsMonitorSuspendLab.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBITSMONITORSUSPENDLAB_FEE414A65E
#define JOBS_HEADER_GUARD_JOBSBITSMONITORSUSPENDLAB_FEE414A65E

#import <UIKit/UIKit.h>

#if __has_include(<ZWPullMenuView/ZWPullMenuView.h>)
#import <ZWPullMenuView/ZWPullMenuView.h>
#else
#import "ZWPullMenuView.h"
#endif

#if __has_include(<JobsNetWorkTools/JobsNetWorkTools.h>)
#import <JobsNetWorkTools/JobsNetWorkTools.h>
#else
#import "JobsNetWorkTools.h"
#endif

#if __has_include(<JobsSuspend/JobsSuspend.h>)
#import <JobsSuspend/JobsSuspend.h>
#else
#import "JobsSuspend.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 显示风格：普通字符串 / 富文本
typedef NS_ENUM(NSUInteger, JobsBitsMonitorDisplayStyle) {
    JobsBitsMonitorDisplayStylePlainText = 0,
    JobsBitsMonitorDisplayStyleRichText
};

@interface JobsBitsMonitorSuspendLab : JobsSuspendLab

-(JobsRetLabelByTextBlock _Nonnull)byText;
-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString;

+(instancetype)new NS_UNAVAILABLE; // 禁止用 +new
-(instancetype)init NS_UNAVAILABLE; // 禁止用 -init
-(instancetype)initBy:(JobsBitsMonitorDisplayStyle)style;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBITSMONITORSUSPENDLAB_FEE414A65E */
