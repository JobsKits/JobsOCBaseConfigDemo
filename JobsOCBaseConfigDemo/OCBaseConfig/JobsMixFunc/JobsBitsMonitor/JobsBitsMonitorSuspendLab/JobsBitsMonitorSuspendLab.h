//
//  JobsBitsMonitorSuspendLab.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBITSMONITORSUSPENDLAB_FEE414A65E
#define JOBS_HEADER_GUARD_JOBSBITSMONITORSUSPENDLAB_FEE414A65E

#import <UIKit/UIKit.h>

#if __has_include(<ZWPullMenuView/ZWPullMenuViewHeader.h>)
#import <ZWPullMenuView/ZWPullMenuViewHeader.h>
#else
#import "ZWPullMenuViewHeader.h"
#endif

#import "JobsNetWorkToolsHeader.h"

#import "JobsSuspend.h"

#import "JobsModelDSL.h"

#import "JobsByOCPods.h"

#import "JobsLanMgr.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

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
