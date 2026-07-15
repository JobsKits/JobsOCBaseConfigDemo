//
//  JobsFuseBubbleConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import <UIKit/UIKit.h>
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

+(__kindof JobsFuseBubbleConfig *)config;
-(JobsFuseBubbleConfig *(^)(NSTimeInterval data))byEmissionInterval;
-(JobsFuseBubbleConfig *(^)(CGFloat data))byRiseDistance;
-(JobsFuseBubbleConfig *(^)(CGFloat data))byHorizontalDrift;
-(JobsFuseBubbleConfig *(^)(NSTimeInterval data))byDuration;
-(JobsFuseBubbleConfig *(^)(CGFloat data))byInitialScale;
-(JobsFuseBubbleConfig *(^)(CGFloat data))byPeakScale;
-(JobsFuseBubbleConfig *(^)(CGFloat data))byEndScale;
-(JobsFuseBubbleConfig *(^)(CGFloat data))byMaximumRotation;
-(JobsFuseBubbleConfig *(^)(NSInteger data))byMaximumConcurrentCount;

@end

NS_ASSUME_NONNULL_END
