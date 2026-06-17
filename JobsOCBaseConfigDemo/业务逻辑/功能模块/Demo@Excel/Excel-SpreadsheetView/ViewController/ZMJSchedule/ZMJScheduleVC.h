//
//  ZMJScheduleVC.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/29/24.
//

#import "BaseViewController.h"
#import "TimeTitleCell.h"
#import "TimeCell.h"
#import "DayTitleCell.h"
#import "ScheduleCell.h"
#import "DateCell.h"
#import "JobsDefineProperty.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface ZMJScheduleVC : BaseViewController
<
SpreadsheetViewDelegate
,SpreadsheetViewDataSource
>

@end

NS_ASSUME_NONNULL_END
