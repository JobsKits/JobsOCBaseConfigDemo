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

#if __has_include(<JobsFuseAnimation/JobsFuseBubbleConfig.h>)
#import <JobsFuseAnimation/JobsFuseBubbleConfig.h>
#else
#import "../../JobsFuseBubbleConfig/JobsFuseBubbleConfig/JobsFuseBubbleConfig.h"
#endif

#if __has_include(<JobsFuseAnimation/JobsFuseOuterRingConfig.h>)
#import <JobsFuseAnimation/JobsFuseOuterRingConfig.h>
#elif __has_include("../JobsFuseOuterRingConfig/JobsFuseOuterRingConfig.h")
#import "../JobsFuseOuterRingConfig/JobsFuseOuterRingConfig.h"
#else
#import "JobsFuseOuterRingConfig.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#elif __has_include("../../../../JobsOCDefs@Pods/JobsDefines.h")
#import "../../../../JobsOCDefs@Pods/JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef __kindof UIView *_Nonnull (^JobsFuseBubbleProvider)(void);
typedef void (^JobsFuseBubbleEmitBlock)(void);

@interface UIView (JobsFuseAnimation)

-(instancetype)byFuseBubbleStartInView:(UIView *_Nullable)hostView
                                config:(JobsFuseBubbleConfig *_Nullable)config
                        bubbleProvider:(JobsFuseBubbleProvider)bubbleProvider
                                onEmit:(JobsFuseBubbleEmitBlock _Nullable)onEmit;
-(instancetype)byFuseBubbleStop;
-(instancetype)byFuseOuterRingStart:(JobsFuseOuterRingConfig *_Nullable)config;
-(instancetype)byFuseOuterRingStop:(BOOL)animated;
-(instancetype)byFuseOuterRingLayoutIfNeeded;
-(instancetype)byFusePressScaleStart:(CGFloat)scale duration:(NSTimeInterval)duration;
-(instancetype)byFusePressScaleStop:(BOOL)animated duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity;
-(instancetype)byFuseTapScale;
-(instancetype)byFuseTapScaleWithScale:(CGFloat)scale duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity;
-(instancetype)byFusePressStart:(JobsFuseOuterRingConfig *_Nullable)ringConfig scale:(CGFloat)scale;
-(instancetype)byFusePressStop:(BOOL)animated;
-(instancetype)byFusePlaySound:(NSString *)fileFullName;
-(instancetype)byFusePlaySystemSound:(SystemSoundID)soundID;

@end

NS_ASSUME_NONNULL_END

#endif /* UIView_JobsFuseAnimation_h */
