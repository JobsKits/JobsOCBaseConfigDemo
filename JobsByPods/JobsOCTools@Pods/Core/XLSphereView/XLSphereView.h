//
//  XLSphereView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5
#define JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsOCTools/XLMatrix.h>

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

@interface XLSphereView : UIView<UIGestureRecognizerDelegate>

Prop_assign() BOOL isTimerStart;

-(jobsByNSArrayBlock _Nonnull)setItems;
- (jobsByVoidBlock _Nonnull)timerStart;
- (jobsByVoidBlock _Nonnull)timerStop;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5 */
