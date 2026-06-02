//
//  XLSphereView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5
#define JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5

#import <UIKit/UIKit.h>
#import <JobsOCTools/XLMatrix.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface XLSphereView : UIView<UIGestureRecognizerDelegate>

Prop_assign() BOOL isTimerStart;

- (void)setItems:(NSArray *)items;
- (void)timerStart;
- (void)timerStop;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5 */
