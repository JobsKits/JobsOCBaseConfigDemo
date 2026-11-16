//
//  _JobsTimerMgrEntry.h
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsTimerMgr.h"

@interface _JobsTimerMgrEntry : NSObject

Prop_strong()JobsTimer<TimerProtocol> *timer;
Prop_copy(nullable)NSString *scopeIdentifier;
Prop_assign()JobsTimerBackgroundPolicy policy;
Prop_assign()_JobsTimerPauseState pauseState;
Prop_assign()BOOL finishDelivered;
Prop_strong()NSMutableArray<jobsByCGFloatBlock> *tickBlocks;
Prop_strong()NSMutableArray<JobsTimerBlock> *finishBlocks;

@end

@interface _JobsTimerMgrEntry (DSL)

-(JobsRetJobsTimerMgrEntryByJobsTimerBlock _Nonnull)byTimer;
-(JobsRetJobsTimerMgrEntryByStringBlock _Nonnull)byScopeIdentifier;
-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock _Nonnull)byPolicy;
-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock _Nonnull)byPauseState;
-(JobsRetJobsTimerMgrEntryByJobsByCGFloatBlockBlock _Nonnull)byTickBlock;
-(JobsRetJobsTimerMgrEntryByJobsTimerBlockBlock _Nonnull)byFinishBlock;

@end

