//
//  JobsFuseOuterRingConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsFuseOuterRingConfig_h
#define JobsFuseOuterRingConfig_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsFuseOuterRingConfig : NSObject<NSCopying>

Prop_assign()CGFloat lineWidth;
Prop_strong()UIColor *strokeColor;
Prop_strong(nullable)UIColor *trackColor;
Prop_strong()UIColor *fillColor;
Prop_assign()CGFloat fromOpacity;
Prop_assign()CGFloat toOpacity;
Prop_assign()NSTimeInterval growDuration;
Prop_assign()NSTimeInterval timerInterval;
Prop_assign()BOOL repeatsWhileHolding;
Prop_assign()NSTimeInterval retreatDuration;
Prop_assign()NSTimeInterval fadeOutDuration;
Prop_assign()CGFloat inset;
Prop_assign()BOOL startsFromTop;

+(JobsRetJobsFuseOuterRingConfigByVoidBlock _Nonnull)config;
-(instancetype)init;
-(JobsRetJobsFuseOuterRingConfigByCGFloatBlock _Nonnull)byLineWidth;
-(JobsRetJobsFuseOuterRingConfigByUIColorBlock _Nonnull)byStrokeColor;
-(JobsRetJobsFuseOuterRingConfigByUIColorBlock _Nonnull)byTrackColor;
-(JobsRetJobsFuseOuterRingConfigByUIColorBlock _Nonnull)byFillColor;
-(JobsRetJobsFuseOuterRingConfigByCGFloatBlock _Nonnull)byFromOpacity;
-(JobsRetJobsFuseOuterRingConfigByCGFloatBlock _Nonnull)byToOpacity;
-(JobsRetJobsFuseOuterRingConfigByNSTimeIntervalBlock _Nonnull)byGrowDuration;
-(JobsRetJobsFuseOuterRingConfigByNSTimeIntervalBlock _Nonnull)byTimerInterval;
-(JobsRetJobsFuseOuterRingConfigByBOOLBlock _Nonnull)byRepeatsWhileHolding;
-(JobsRetJobsFuseOuterRingConfigByNSTimeIntervalBlock _Nonnull)byRetreatDuration;
-(JobsRetJobsFuseOuterRingConfigByNSTimeIntervalBlock _Nonnull)byFadeOutDuration;
-(JobsRetJobsFuseOuterRingConfigByCGFloatBlock _Nonnull)byInset;
-(JobsRetJobsFuseOuterRingConfigByBOOLBlock _Nonnull)byStartsFromTop;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsFuseOuterRingConfig_h */
