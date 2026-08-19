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

@class JobsViewPushConfiguration;
typedef JobsViewPushConfiguration *_Nonnull(^JobsRetJobsViewPushConfigurationByVoidBlock)(void);
typedef JobsViewPushConfiguration *_Nonnull(^JobsRetJobsViewPushConfigurationByJobsViewPushDirectionBlock)(JobsViewPushDirection);
typedef JobsViewPushConfiguration *_Nonnull(^JobsRetJobsViewPushConfigurationByCGFloatBlock)(CGFloat);
typedef JobsViewPushConfiguration *_Nonnull(^JobsRetJobsViewPushConfigurationByNSTimeIntervalBlock)(NSTimeInterval);
typedef JobsViewPushConfiguration *_Nonnull(^JobsRetJobsViewPushConfigurationByBOOLBlock)(BOOL);
typedef JobsViewPushConfiguration *_Nonnull(^JobsRetJobsViewPushConfigurationByUIColorBlock)(UIColor *);

@interface JobsViewPushConfiguration : NSObject <NSCopying>

Prop_assign()JobsViewPushDirection direction;
Prop_assign()CGFloat presentedRatio;
Prop_assign()NSTimeInterval animationDuration;
Prop_assign()BOOL allowsInteractiveDismiss;
Prop_assign()BOOL dismissOnBackgroundTap;
Prop_strong()UIColor *backgroundColor;

+(JobsRetJobsViewPushConfigurationByVoidBlock _Nonnull)defaultConfiguration;
-(JobsRetJobsViewPushConfigurationByJobsViewPushDirectionBlock _Nonnull)byDirection;
-(JobsRetJobsViewPushConfigurationByCGFloatBlock _Nonnull)byPresentedRatio;
-(JobsRetJobsViewPushConfigurationByNSTimeIntervalBlock _Nonnull)byAnimationDuration;
-(JobsRetJobsViewPushConfigurationByBOOLBlock _Nonnull)byAllowsInteractiveDismiss;
-(JobsRetJobsViewPushConfigurationByBOOLBlock _Nonnull)byDismissOnBackgroundTap;
-(JobsRetJobsViewPushConfigurationByUIColorBlock _Nonnull)byBackgroundColor;

@end

@interface JobsViewPushPresentation : NSObject

Prop_weak(readonly)UIView *sourceView;
Prop_weak(readonly)UIView *presentedView;
Prop_assign(readonly)BOOL isPresented;
Prop_copy(nullable)JobsViewPushCompletionBlock onDismiss;

-(void)dismissAnimated:(BOOL)animated
            completion:(nullable JobsViewPushCompletionBlock)completion;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsViewPushPresentation
-(JobsRetJobsViewPushPresentationByBOOLBlock _Nonnull)byAnimatingTransition;
-(JobsRetJobsViewPushPresentationByBOOLBlock _Nonnull)byPresented;
-(JobsRetJobsViewPushPresentationByJobsViewPushTransitionViewBlock _Nonnull)byTransitionView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsViewPushPresentation
@end

@interface UIView (JobsViewPush)

-(JobsRetJobsViewPushPresentationByUIViewBlock _Nonnull)jobsPushView;
-(JobsViewPushPresentation *)jobsPushView:(UIView *)presentedView
                            configuration:(nullable JobsViewPushConfiguration *)configuration
                               completion:(nullable JobsViewPushCompletionBlock)completion;
-(void)jobsDismissPushedViewAnimated:(BOOL)animated
                          completion:(nullable JobsViewPushCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_UIVIEW_JOBSVIEWPUSH_7D446826D1 */
