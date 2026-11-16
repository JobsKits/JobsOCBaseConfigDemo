//
//  XLSphereView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5
#define JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5

#import <UIKit/UIKit.h>
#import "XLMatrix.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLSphereView : UIView<UIGestureRecognizerDelegate>

Prop_assign() BOOL isTimerStart;

- (void)setItems:(NSArray *)items;
- (void)timerStart;
- (void)timerStop;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_XLSPHEREVIEW_A45E24EFA5 */
