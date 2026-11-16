//
//  ZMJCell+CustomView.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ZMJCELL_CUSTOMVIEW_4DFC0D63DD
#define JOBS_HEADER_GUARD_ZMJCELL_CUSTOMVIEW_4DFC0D63DD

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMJCell (CustomView)

Prop_strong()UIButton *btn;
Prop_strong()UIView *colorBarView;
Prop_strong()UIColor *color;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZMJCELL_CUSTOMVIEW_4DFC0D63DD */
