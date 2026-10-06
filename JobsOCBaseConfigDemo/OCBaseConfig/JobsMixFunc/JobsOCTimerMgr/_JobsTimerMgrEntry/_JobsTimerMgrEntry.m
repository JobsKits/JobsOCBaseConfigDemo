//
//  _JobsTimerMgrEntry.m
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "_JobsTimerMgrEntry.h"

@implementation _JobsTimerMgrEntry
- (instancetype)init {
    if (self = [super init]) {
        _pauseState = _JobsTimerPauseStateRunning;
    }
    return self;
}

-(NSMutableArray<jobsByCGFloatBlock> * _Nonnull)tickBlocks{
    if(!_tickBlocks){
        _tickBlocks = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
        });
    }
    return _tickBlocks;
}

-(NSMutableArray<JobsTimerBlock> * _Nonnull)finishBlocks{
    if(!_finishBlocks){
        _finishBlocks = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
        });
    }
    return _finishBlocks;
}

@end

@implementation _JobsTimerMgrEntry (DSL)
-(JobsRetJobsTimerMgrEntryByJobsTimerBlock _Nonnull)byTimer{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(JobsTimer<TimerProtocol> *_Nullable timer) {
        self.timer = timer;
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByStringBlock _Nonnull)byScopeIdentifier{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(NSString *_Nullable data) {
        self.scopeIdentifier = data;
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock _Nonnull)byPolicy{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(NSUInteger data) {
        self.policy = (JobsTimerBackgroundPolicy)data;
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock _Nonnull)byPauseState{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(NSUInteger data) {
        self.pauseState = (_JobsTimerPauseState)data;
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByJobsByCGFloatBlockBlock _Nonnull)byTickBlock{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(jobsByCGFloatBlock _Nullable block) {
        if (block) {
            [self.tickBlocks addObject:[block copy]];
        }
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByJobsTimerBlockBlock _Nonnull)byFinishBlock{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(JobsTimerBlock _Nullable block) {
        if (block) {
            [self.finishBlocks addObject:[block copy]];
        }
        return self;
    };
}

@end

