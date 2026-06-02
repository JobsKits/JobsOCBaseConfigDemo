//
//  TextCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "ZMJCell+CustomView.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

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

@interface TextCell : ZMJCell

@end

NS_ASSUME_NONNULL_END
