//
//  CountdownView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_COUNTDOWNVIEW_C3E55D4224
#define JOBS_HEADER_GUARD_COUNTDOWNVIEW_C3E55D4224

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsMakes.h"

#import "JobsLanMgr.h"

#import "JobsDefines.h"

#import "JobsBlock.h"

#import "JobsOCDSL.h"

@interface CountdownView : UIView

Prop_assign()NSInteger time;
Prop_copy()NSString *str;
Prop_strong()UIFont *font;
Prop_strong()UIColor *textColor;
Prop_copy()jobsByVoidBlock blockTapAction;
Prop_copy()jobsByVoidBlock blockAnimationFinishedAction;

@end
#endif /* JOBS_HEADER_GUARD_COUNTDOWNVIEW_C3E55D4224 */
