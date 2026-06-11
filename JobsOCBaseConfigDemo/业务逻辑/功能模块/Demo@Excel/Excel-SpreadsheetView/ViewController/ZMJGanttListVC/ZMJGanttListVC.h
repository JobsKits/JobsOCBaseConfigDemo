//
//  ZMJGanttListVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "ZMJTask.h"
#import "ZMJHeaderCell.h"
#import "ZMJChartBarCell.h"
#import "ZMJTaskCell.h"
#import "ZMJTaskView.h"

#if __has_include(<ZMJTipView/ZMJTipView.h>)
#import <ZMJTipView/ZMJTipView.h>
#else
#import "ZMJTipView.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

typedef NS_ENUM(NSInteger, ZMJTimeUnit) {
    ZMJTimeUnit_week,
    ZMJTimeUnit_month,
    ZMJTimeUnit_year,
};

typedef NS_ENUM(NSInteger, ZMJDisplayMode) {
    ZMJDisplayMode_daily,
    ZMJDisplayMode_weekly,
    ZMJDisplayMode_monthly,
};

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface ZMJGanttListVC : BaseViewController
<
SpreadsheetViewDelegate
,SpreadsheetViewDataSource
,ZMJTipViewDelegate
>

@end

NS_ASSUME_NONNULL_END
