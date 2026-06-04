//
//  ZMJChartBarCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJCell+CustomView.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
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

typedef NS_ENUM(NSInteger, ZMJDashlineDirection) {
    ZMJDashlineDirectionNone = 0,
    ZMJDashlineDirectionLeft ,
    ZMJDashlineDirectionRight,
};

NS_ASSUME_NONNULL_BEGIN

@interface ZMJChartBarCell : ZMJCell

Prop_strong()UIView *colorBarView;
Prop_strong()UIColor *color;
Prop_assign()ZMJDashlineDirection direction;

@end

NS_ASSUME_NONNULL_END
