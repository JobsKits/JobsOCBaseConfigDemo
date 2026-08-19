//
//  UIView+JobsFuseAnimation.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef UIView_JobsFuseAnimation_h
#define UIView_JobsFuseAnimation_h

#import <AudioToolbox/AudioToolbox.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/UIView+DSL.h>)
#import <JobsOCDSL/UIView+DSL.h>
#else
#import "UIView+DSL.h"
#endif
#import "JobsFuseBubbleConfig.h"
#import "JobsFuseOuterRingConfig.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

typedef __kindof UIView *_Nonnull (^JobsFuseBubbleProvider)(void);
typedef void (^JobsFuseBubbleEmitBlock)(void);

@interface UIView (JobsFuseAnimation)

-(instancetype)byFuseBubbleStartInView:(UIView *_Nullable)hostView
                                config:(JobsFuseBubbleConfig *_Nullable)config
                        bubbleProvider:(JobsFuseBubbleProvider)bubbleProvider
                                onEmit:(JobsFuseBubbleEmitBlock _Nullable)onEmit;
-(JobsRetIDByVoidBlock _Nonnull)byFuseBubbleStop;
-(JobsRetIDByJobsFuseOuterRingConfigBlock _Nonnull)byFuseOuterRingStart;
-(JobsRetIDByBOOLBlock _Nonnull)byFuseOuterRingStop;
-(JobsRetIDByVoidBlock _Nonnull)byFuseOuterRingLayoutIfNeeded;
-(instancetype)byFusePressScaleStart:(CGFloat)scale duration:(NSTimeInterval)duration;
-(instancetype)byFusePressScaleStop:(BOOL)animated duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity;
-(JobsRetIDByVoidBlock _Nonnull)byFuseTapScale;
-(instancetype)byFuseTapScaleWithScale:(CGFloat)scale duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity;
-(instancetype)byFusePressStart:(JobsFuseOuterRingConfig *_Nullable)ringConfig scale:(CGFloat)scale;
-(JobsRetIDByBOOLBlock _Nonnull)byFusePressStop;
-(JobsRetIDByStrBlock _Nonnull)byFusePlaySound;
-(JobsRetIDBySystemSoundIDBlock _Nonnull)byFusePlaySystemSound;

@end

NS_ASSUME_NONNULL_END

#endif /* UIView_JobsFuseAnimation_h */
