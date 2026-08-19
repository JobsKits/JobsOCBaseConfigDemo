//
//  JobsControlTarget.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCONTROLTARGET_4D7FDBFBB9
#define JOBS_HEADER_GUARD_JOBSCONTROLTARGET_4D7FDBFBB9

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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
/// 内部 Target 容器
@interface JobsControlTarget : NSObject

Prop_copy(nullable)jobsByCtrlBlock block;
Prop_assign()JobsInvokePolicy policy;
Prop_assign()NSTimeInterval interval;   // for throttle/debounce
Prop_assign()NSTimeInterval lastFire;   // for throttle
Prop_assign()uint64_t debounceGen;      // for debounce
Prop_weak()UIControl *boundControl;
Prop_assign()UIControlEvents event;     // 单一事件

-(JobsRetJobsControlTargetByJobsByCtrlBlock _Nonnull)byBlock;
-(JobsRetJobsControlTargetByPolicyBlock _Nonnull)byPolicy;
-(JobsRetJobsControlTargetByTimeIntervalBlock _Nonnull)byInterval;
-(JobsRetJobsControlTargetByTimeIntervalBlock _Nonnull)byLastFire;
-(JobsRetJobsControlTargetByUInt64Block _Nonnull)byDebounceGen;
-(JobsRetJobsControlTargetByControlBlock _Nonnull)byBoundControl;
-(JobsRetJobsControlTargetByControlEventsBlock _Nonnull)byEvent;
-(void)invoke:(__kindof UIControl *)sender;
-(jobsByCtrlBlock _Nonnull)jobsInvoke;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsControlTarget *_Nonnull jobsMakeControlTarget(jobsByControlTargeBlock _Nonnull block){
    JobsControlTarget *data = JobsControlTarget.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSCONTROLTARGET_4D7FDBFBB9 */
