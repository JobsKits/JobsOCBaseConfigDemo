//
//  JobsFuseOuterRingConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsFuseOuterRingConfig_h
#define JobsFuseOuterRingConfig_h

#import <UIKit/UIKit.h>
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

+(__kindof JobsFuseOuterRingConfig *)config;
-(instancetype)init;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byLineWidth;
-(JobsFuseOuterRingConfig *(^)(UIColor *data))byStrokeColor;
-(JobsFuseOuterRingConfig *(^)(UIColor *_Nullable data))byTrackColor;
-(JobsFuseOuterRingConfig *(^)(UIColor *data))byFillColor;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byFromOpacity;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byToOpacity;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byGrowDuration;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byTimerInterval;
-(JobsFuseOuterRingConfig *(^)(BOOL data))byRepeatsWhileHolding;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byRetreatDuration;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byFadeOutDuration;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byInset;
-(JobsFuseOuterRingConfig *(^)(BOOL data))byStartsFromTop;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsFuseOuterRingConfig_h */
