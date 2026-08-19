//
//  RYCuteView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_RYCUTEVIEW_64113C70E0
#define JOBS_HEADER_GUARD_RYCUTEVIEW_64113C70E0

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
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

NS_ASSUME_NONNULL_BEGIN
/// 用UIBezierPath实现果冻效果
@interface RYCuteView : UIView

Prop_assign()CGFloat MIN_HEIGHT;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN RYCuteView
-(JobsRetRYCuteViewByBOOLBlock _Nonnull)byAnimating;
-(JobsRetRYCuteViewByCGFloatBlock _Nonnull)byCurveX;
-(JobsRetRYCuteViewByCGFloatBlock _Nonnull)byCurveY;
-(JobsRetRYCuteViewByCGFloatBlock _Nonnull)byMHeight;
-(JobsRetRYCuteViewByCGFloatBlock _Nonnull)byMIN_HEIGHT;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END RYCuteView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_RYCUTEVIEW_64113C70E0 */
