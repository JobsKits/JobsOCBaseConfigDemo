//
//  JobsGestureLockView.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKVIEW_5F898D6865
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKVIEW_5F898D6865

#import <UIKit/UIKit.h>
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

-(instancetype)initWithConfiguration:(nullable JobsGestureLockConfiguration *)configuration;
-(void)showValidationResult:(JobsGestureLockValidationResult)result;
-(void)reset;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKVIEW_5F898D6865 */
