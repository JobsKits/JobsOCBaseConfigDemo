//
//  JobsMarqueeViewCore.h
//  JobsMarqueeView
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSMARQUEEVIEWCORE_20260707
#define JOBS_HEADER_GUARD_JOBSMARQUEEVIEWCORE_20260707

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsOCTimerMgr/JobsOCTimerMgr.h>)
#import <JobsOCTimerMgr/JobsOCTimerMgr.h>
#else
#import "JobsOCTimerMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsMarqueeView;

typedef NS_ENUM(NSUInteger, JobsMarqueeDirection) {
    JobsMarqueeDirectionTop = 0,
    JobsMarqueeDirectionBottom,
    JobsMarqueeDirectionLeft,
    JobsMarqueeDirectionRight
};

typedef NS_ENUM(NSUInteger, JobsMarqueeScrollMode) {
    JobsMarqueeScrollModeFrequency = 0,
    JobsMarqueeScrollModeContinuous
};

typedef NS_ENUM(NSUInteger, JobsMarqueeItemSizeMode) {
    JobsMarqueeItemSizeModeFitContent = 0,
    JobsMarqueeItemSizeModeFillBounds
};

typedef NS_ENUM(NSUInteger, JobsMarqueePageControlPosition) {
    JobsMarqueePageControlPositionLeftBottom = 0,
    JobsMarqueePageControlPositionBottomCenter,
    JobsMarqueePageControlPositionRightBottom
};

typedef void(^JobsMarqueePageControlConstraintsBlock)(MASConstraintMaker *make);

/// 统一「跑马灯」和「轮播图」的 Objective-C 组件。
@interface JobsMarqueeView : UIView

Prop_assign()JobsMarqueeDirection direction;
Prop_assign()JobsMarqueeScrollMode scrollMode;
Prop_assign()JobsMarqueeItemSizeMode itemSizeMode;
Prop_strong()NSArray<UIButton *> *dataSourceButtons;
Prop_assign()JobsTimerType timerTypeForFrequency;
Prop_assign()JobsTimerType timerTypeForContinuous;
Prop_assign()NSTimeInterval frequencyInterval;
Prop_assign()CGFloat continuousSpeed;
Prop_assign()BOOL manualScrollEnabled;
Prop_assign()BOOL pageControlEnabled;
Prop_assign()JobsMarqueePageControlPosition pageControlPosition;
Prop_copy(nullable)JobsMarqueePageControlConstraintsBlock pageControlConstraintsBlock;
Prop_strong(readonly)UIPageControl *pageControl;
Prop_assign(readonly,getter=isRunning)BOOL running;

-(instancetype)byDirection:(JobsMarqueeDirection)direction;
-(instancetype)byFrequencyWithInterval:(NSTimeInterval)interval;
-(instancetype)byContinuousWithSpeed:(CGFloat)speed;
-(instancetype)byItemSizeMode:(JobsMarqueeItemSizeMode)mode;
-(instancetype)byDataSourceButtons:(NSArray<UIButton *> *)buttons;
-(instancetype)byManualScrollEnabled:(BOOL)enabled;
-(instancetype)byPageControlEnabled:(BOOL)enabled;
-(instancetype)byPageControlPosition:(JobsMarqueePageControlPosition)position;
-(instancetype)byPageControlConstraintsBlock:(nullable JobsMarqueePageControlConstraintsBlock)block;
-(instancetype)byTimerTypeForFrequency:(JobsTimerType)timerType;
-(instancetype)byTimerTypeForContinuous:(JobsTimerType)timerType;

-(void)start;
-(void)pause;
-(void)resume;
-(void)stop;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSMARQUEEVIEWCORE_20260707 */
