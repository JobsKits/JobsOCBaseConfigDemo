//
//  ZMJChartBarCell.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/27/24.
//

#import "ZMJCell+CustomView.h"
#import "JobsDefineProperty.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
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
