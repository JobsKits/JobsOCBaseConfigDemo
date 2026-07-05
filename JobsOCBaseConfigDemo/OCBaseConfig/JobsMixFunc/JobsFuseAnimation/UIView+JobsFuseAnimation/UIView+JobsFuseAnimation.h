//
//  UIView+JobsFuseAnimation.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef UIView_JobsFuseAnimation_h
#define UIView_JobsFuseAnimation_h

#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>

#import "JobsFuseOuterRingConfig.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JobsFuseAnimation)

-(instancetype)byFuseOuterRingStart:(JobsFuseOuterRingConfig *_Nullable)config;
-(instancetype)byFuseOuterRingStop:(BOOL)animated;
-(instancetype)byFuseOuterRingLayoutIfNeeded;
-(instancetype)byFusePressScaleStart:(CGFloat)scale duration:(NSTimeInterval)duration;
-(instancetype)byFusePressScaleStop:(BOOL)animated duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity;
-(instancetype)byFuseTapScale;
-(instancetype)byFuseTapScaleWithScale:(CGFloat)scale duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity;
-(instancetype)byFusePressStart:(JobsFuseOuterRingConfig *_Nullable)ringConfig scale:(CGFloat)scale;
-(instancetype)byFusePressStop:(BOOL)animated;
-(instancetype)byFusePlaySystemSound:(SystemSoundID)soundID;

@end

NS_ASSUME_NONNULL_END

#endif /* UIView_JobsFuseAnimation_h */
