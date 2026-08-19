//
//  JobsGestureLockView.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKVIEW_5F898D6865
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKVIEW_5F898D6865

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsGestureLockConfiguration.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@class JobsGestureLockView;

@protocol JobsGestureLockViewDelegate <NSObject>

-(void)gestureLockView:(JobsGestureLockView *)lockView didCompletePattern:(NSString *)pattern;

@end

@interface JobsGestureLockView : UIView

Prop_weak(nullable)id<JobsGestureLockViewDelegate> delegate;
Prop_strong()JobsGestureLockConfiguration *configuration;
Prop_assign(readonly)JobsGestureLockValidationResult validationResult;

-(JobsRetJobsGestureLockViewByIDBlock _Nonnull)byDelegate;
-(instancetype)initWithConfiguration:(nullable JobsGestureLockConfiguration *)configuration;
-(jobsByJobsGestureLockValidationResultBlock _Nonnull)showValidationResult;
-(jobsByVoidBlock _Nonnull)reset;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsGestureLockView
-(JobsRetJobsGestureLockViewByBOOLBlock _Nonnull)byFinished;
-(JobsRetJobsGestureLockViewByCGPointBlock _Nonnull)byCurrentPoint;
-(JobsRetJobsGestureLockViewByJobsGestureLockValidationResultBlock _Nonnull)byValidationResult;
-(JobsRetJobsGestureLockViewByUIPanGestureRecognizerBlock _Nonnull)byPanGesture;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsGestureLockView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKVIEW_5F898D6865 */
