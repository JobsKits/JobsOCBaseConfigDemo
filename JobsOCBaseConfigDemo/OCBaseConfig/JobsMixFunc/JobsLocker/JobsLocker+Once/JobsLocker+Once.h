//
//  JobsLocker+Once.h
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSLOCKER_ONCE_43E0C8243B
#define JOBS_HEADER_GUARD_JOBSLOCKER_ONCE_43E0C8243B

#import <objc/runtime.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsLocker.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocker (Once)
/// 基于当前 locker 实例执行一次。
/// 同一个 locker 对象上，无论并发调用多少次，block 只会真正执行一次；
/// 其他并发调用会等待首次执行完成，然后直接返回。
-(jobsBydispatch_block_tBlock _Nonnull)executeOnce;
/// 返回该 locker 实例是否已经执行过 once block。
Prop_assign(readonly)BOOL didExecuteOnce;
/// 重置 once 状态。
/// 注意：只有在你明确需要“重新允许执行一次”时才调用。
- (jobsByVoidBlock _Nonnull)resetOnceState;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLOCKER_ONCE_43E0C8243B */
