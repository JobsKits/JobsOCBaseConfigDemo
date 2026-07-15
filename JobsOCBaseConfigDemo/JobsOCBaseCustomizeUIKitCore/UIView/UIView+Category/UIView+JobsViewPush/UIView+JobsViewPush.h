//
//  UIView+JobsViewPush.h
//  JobsViewPush
//
//  Created by Jobs on 2026/6/22.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_JOBSVIEWPUSH_7D446826D1
#define JOBS_HEADER_GUARD_UIVIEW_JOBSVIEWPUSH_7D446826D1

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsOCDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JobsViewPushDirection) {
    JobsViewPushDirectionTop,
    JobsViewPushDirectionBottom,
    JobsViewPushDirectionLeft,
    JobsViewPushDirectionRight
};

@interface JobsViewPushConfiguration : NSObject <NSCopying>

Prop_assign()JobsViewPushDirection direction;
Prop_assign()CGFloat presentedRatio;
Prop_assign()NSTimeInterval animationDuration;
Prop_assign()BOOL allowsInteractiveDismiss;
Prop_assign()BOOL dismissOnBackgroundTap;
Prop_strong()UIColor *backgroundColor;

+(instancetype)defaultConfiguration;
-(instancetype)byDirection:(JobsViewPushDirection)direction;
-(instancetype)byPresentedRatio:(CGFloat)presentedRatio;
-(instancetype)byAnimationDuration:(NSTimeInterval)animationDuration;
-(instancetype)byAllowsInteractiveDismiss:(BOOL)allowsInteractiveDismiss;
-(instancetype)byDismissOnBackgroundTap:(BOOL)dismissOnBackgroundTap;
-(instancetype)byBackgroundColor:(UIColor *)backgroundColor;

@end

@interface JobsViewPushPresentation : NSObject

Prop_weak(readonly)UIView *sourceView;
Prop_weak(readonly)UIView *presentedView;
Prop_assign(readonly)BOOL isPresented;
Prop_copy(nullable)JobsViewPushCompletionBlock onDismiss;

-(void)dismissAnimated:(BOOL)animated
            completion:(nullable JobsViewPushCompletionBlock)completion;

@end

@interface UIView (JobsViewPush)

-(JobsViewPushPresentation *)jobsPushView:(UIView *)presentedView;
-(JobsViewPushPresentation *)jobsPushView:(UIView *)presentedView
                            configuration:(nullable JobsViewPushConfiguration *)configuration
                               completion:(nullable JobsViewPushCompletionBlock)completion;
-(void)jobsDismissPushedViewAnimated:(BOOL)animated
                          completion:(nullable JobsViewPushCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_UIVIEW_JOBSVIEWPUSH_7D446826D1 */
