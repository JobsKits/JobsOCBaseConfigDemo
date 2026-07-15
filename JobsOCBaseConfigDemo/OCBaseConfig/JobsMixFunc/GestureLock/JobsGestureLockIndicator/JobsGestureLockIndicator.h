//
//  JobsGestureLockIndicator.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKINDICATOR_60CF741297
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKINDICATOR_60CF741297

#import <UIKit/UIKit.h>
#import "JobsDefines.h"

@class JobsGestureLockConfiguration;

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureLockIndicator : UIView

Prop_strong()JobsGestureLockConfiguration *configuration;

-(instancetype)initWithConfiguration:(nullable JobsGestureLockConfiguration *)configuration;
-(void)updateWithPattern:(nullable NSString *)pattern;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKINDICATOR_60CF741297 */
