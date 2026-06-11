//
//  CountdownView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_COUNTDOWNVIEW_C3E55D4224
#define JOBS_HEADER_GUARD_COUNTDOWNVIEW_C3E55D4224

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

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

@interface CountdownView : UIView

Prop_assign()NSInteger time;
Prop_copy()NSString *str;
Prop_strong()UIFont *font;
Prop_strong()UIColor *textColor;
Prop_copy()void (^blockTapAction)(void);
Prop_copy()void (^blockAnimationFinishedAction)(void);

@end
#endif /* JOBS_HEADER_GUARD_COUNTDOWNVIEW_C3E55D4224 */
