//
//  JobsOCDeviceGuardLaunchDecision.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDeviceGuard/JobsOCDeviceGuard.h>)
#import <JobsOCDeviceGuard/JobsOCDeviceGuard.h>
#else
#import "JobsOCDeviceGuard.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDeviceGuardLaunchDecision : NSObject

Prop_strong(readonly)JobsOCDeviceGuardReport *report;
Prop_assign(readonly,getter=isBlocked)BOOL blocked;

-(instancetype)initWithReport:(JobsOCDeviceGuardReport *)report
                       policy:(nullable JobsRetBOOLByJobsOCDeviceGuardReportBlock)policy NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
