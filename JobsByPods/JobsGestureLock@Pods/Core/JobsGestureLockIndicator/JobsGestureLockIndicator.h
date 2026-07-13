//
//  JobsGestureLockIndicator.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKINDICATOR_60CF741297
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKINDICATOR_60CF741297

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#import <JobsBaseUI/UIButton+SimplyMake.h>
#else
#import "JobsBaseUI.h"
#import "UIButton+SimplyMake.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@class JobsGestureLockConfiguration;

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureLockIndicator : UIView

Prop_strong()JobsGestureLockConfiguration *configuration;

-(instancetype)initWithConfiguration:(nullable JobsGestureLockConfiguration *)configuration;
-(void)updateWithPattern:(nullable NSString *)pattern;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKINDICATOR_60CF741297 */
