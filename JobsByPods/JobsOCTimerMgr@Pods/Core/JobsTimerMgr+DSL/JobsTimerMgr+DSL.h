//
//  JobsTimerMgr+DSL.h
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年6月20日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSTIMERMGR_DSL_20260620
#define JOBS_HEADER_GUARD_JOBSTIMERMGR_DSL_20260620

#import "JobsTimerMgr.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsTimerMgr (DSL)

-(JobsRetJobsTimerMgrByUpsertTimerBlock _Nonnull)byUpsertTimer;
-(JobsRetJobsTimerMgrByScopedUpsertTimerBlock _Nonnull)byUpsertScopedTimer;
-(JobsRetJobsTimerMgrByStringAndJobsByCGFloatBlockBlock _Nonnull)byOnTick;
-(JobsRetJobsTimerMgrByStringAndJobsByVoidBlockBlock _Nonnull)byOnTickVoid;
-(JobsRetJobsTimerMgrByStringAndJobsTimerBlockBlock _Nonnull)byOnFinish;
-(JobsRetJobsTimerMgrByStringAndJobsByVoidBlockBlock _Nonnull)byOnFinishVoid;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byStart;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byPause;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byResume;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byPauseScope;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byResumeScope;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byFireOnceAndRemove;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byStopAndRemove;
-(JobsRetJobsTimerMgrByStringAndJobsTimerBlock _Nonnull)byStopAndRemoveExpectedTimer;
-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byStopAndRemoveScope;
-(JobsRetJobsTimerMgrByVoidBlock _Nonnull)byStopAndRemoveAll;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTIMERMGR_DSL_20260620 */
