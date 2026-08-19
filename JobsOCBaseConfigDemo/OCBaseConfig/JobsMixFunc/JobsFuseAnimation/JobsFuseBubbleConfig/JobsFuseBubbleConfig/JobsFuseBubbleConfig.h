//
//  JobsFuseBubbleConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsFuseBubbleConfig : NSObject<NSCopying>

Prop_assign()NSTimeInterval emissionInterval;
Prop_assign()CGFloat riseDistance;
Prop_assign()CGFloat horizontalDrift;
Prop_assign()NSTimeInterval duration;
Prop_assign()CGFloat initialScale;
Prop_assign()CGFloat peakScale;
Prop_assign()CGFloat endScale;
Prop_assign()CGFloat maximumRotation;
Prop_assign()NSInteger maximumConcurrentCount;

+(JobsRetJobsFuseBubbleConfigByVoidBlock _Nonnull)config;
-(JobsRetJobsFuseBubbleConfigByNSTimeIntervalBlock _Nonnull)byEmissionInterval;
-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byRiseDistance;
-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byHorizontalDrift;
-(JobsRetJobsFuseBubbleConfigByNSTimeIntervalBlock _Nonnull)byDuration;
-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byInitialScale;
-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byPeakScale;
-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byEndScale;
-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byMaximumRotation;
-(JobsRetJobsFuseBubbleConfigByNSIntegerBlock _Nonnull)byMaximumConcurrentCount;

@end

NS_ASSUME_NONNULL_END
