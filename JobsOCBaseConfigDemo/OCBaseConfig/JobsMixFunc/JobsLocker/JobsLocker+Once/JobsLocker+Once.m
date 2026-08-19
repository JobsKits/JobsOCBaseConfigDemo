//
//  JobsLocker+Once.m
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsLocker+Once.h"

typedef NS_ENUM(NSUInteger, _JobsOnceStatus) {
    _JobsOnceStatusIdle = 0,
    _JobsOnceStatusExecuting,
    _JobsOnceStatusDone,
};

@interface _JobsOnceState : NSObject

Prop_strong()NSCondition *condition;
Prop_assign()_JobsOnceStatus status;

-(JobsRetIDByUIntegerBlock _Nonnull)byStatus;

@end

@implementation _JobsOnceState

-(JobsRetIDByUIntegerBlock _Nonnull)byStatus{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.status = data;
        return self;
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _condition = [[NSCondition alloc] init];
        _status = _JobsOnceStatusIdle;
    };return self;
}

@end

@implementation JobsLocker (Once)
JobsKey(JobsLockerOnceStateKey)
- (JobsRetJobsOnceStateByVoidBlock _Nonnull)jobs_onceState {
    @jobs_weakify(self)
    return ^_JobsOnceState *{
        @jobs_strongify(self)
        if (!self) return nil;
        _JobsOnceState *state = Jobs_getAssociatedObject(JobsLockerOnceStateKey);
        if (state) return state;
        @synchronized (self) {
            state = Jobs_getAssociatedObject(JobsLockerOnceStateKey);
            if (!state) {
                state = [[_JobsOnceState alloc] init];
                Jobs_setAssociatedRETAIN_NONATOMIC(JobsLockerOnceStateKey, state)
            }
        };return state;
    };
}

-(jobsBydispatch_block_tBlock _Nonnull)executeOnce{
    @jobs_weakify(self)
    return ^(NS_NOESCAPE dispatch_block_t block){
        @jobs_strongify(self)
        if (!self) return;
        if (!block) return;
        _JobsOnceState *state = self.jobs_onceState();
        [state.condition lock];
        while (state.status == _JobsOnceStatusExecuting) {
            [state.condition wait];
        }
        if (state.status == _JobsOnceStatusDone) {
            [state.condition unlock];
            return;
        }
        state.byStatus(_JobsOnceStatusExecuting);
        [state.condition unlock];
        @try {
            block();
        } @finally {
            [state.condition lock];
            state.byStatus(_JobsOnceStatusDone);
            [state.condition broadcast];
            [state.condition unlock];
        }
    };
}

- (BOOL)didExecuteOnce {
    _JobsOnceState *state = self.jobs_onceState();
    [state.condition lock];
    BOOL executed = state.status == _JobsOnceStatusDone;
    [state.condition unlock];
    return executed;
}

- (jobsByVoidBlock _Nonnull)resetOnceState {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        _JobsOnceState *state = self.jobs_onceState();
        [state.condition lock];
        while (state.status == _JobsOnceStatusExecuting) {
            [state.condition wait];
        }
        state.byStatus(_JobsOnceStatusIdle);
        [state.condition unlock];
    };
}

@end
