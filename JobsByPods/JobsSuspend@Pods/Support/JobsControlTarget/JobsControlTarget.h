//
//  JobsControlTarget.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCONTROLTARGET_4D7FDBFBB9
#define JOBS_HEADER_GUARD_JOBSCONTROLTARGET_4D7FDBFBB9

#pragma once

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
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

-(void)invoke:(__kindof UIControl *)sender;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsControlTarget *_Nonnull jobsMakeControlTarget(jobsByControlTargeBlock _Nonnull block){
    JobsControlTarget *data = JobsControlTarget.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSCONTROLTARGET_4D7FDBFBB9 */
