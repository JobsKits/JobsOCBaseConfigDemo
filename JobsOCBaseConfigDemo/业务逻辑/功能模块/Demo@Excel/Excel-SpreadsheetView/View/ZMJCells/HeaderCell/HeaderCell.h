//
//  HeaderCell.h
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

NS_ASSUME_NONNULL_BEGIN

@interface HeaderCell : ZMJCell

Prop_strong()UILabel *sortArrow;/// 排序的箭头

@end

NS_ASSUME_NONNULL_END
