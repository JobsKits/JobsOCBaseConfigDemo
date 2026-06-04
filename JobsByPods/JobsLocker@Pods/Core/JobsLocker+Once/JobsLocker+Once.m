//
//  JobsLocker+Once.m
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsLocker+Once.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

typedef NS_ENUM(NSUInteger, _JobsOnceStatus) {
    _JobsOnceStatusIdle = 0,
    _JobsOnceStatusExecuting,
    _JobsOnceStatusDone,
};

@interface _JobsOnceState : NSObject

Prop_strong()NSCondition *condition;
Prop_assign()_JobsOnceStatus status;

@end

@implementation _JobsOnceState

- (instancetype)init {
    self = [super init];
    if (self) {
        _condition = [[NSCondition alloc] init];
        _status = _JobsOnceStatusIdle;
    }return self;
}

@end

@implementation JobsLocker (Once)

static const void *JobsLockerOnceStateKey = &JobsLockerOnceStateKey;

- (_JobsOnceState *)jobs_onceState {
    _JobsOnceState *state = objc_getAssociatedObject(self, JobsLockerOnceStateKey);
    if (state) return state;

    @synchronized (self) {
        state = objc_getAssociatedObject(self, JobsLockerOnceStateKey);
        if (!state) {
            state = [[_JobsOnceState alloc] init];
            objc_setAssociatedObject(self, JobsLockerOnceStateKey, state, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

    return state;
}

- (void)executeOnce:(NS_NOESCAPE dispatch_block_t)block {
    if (!block) return;

    _JobsOnceState *state = [self jobs_onceState];
    [state.condition lock];

    while (state.status == _JobsOnceStatusExecuting) {
        [state.condition wait];
    }

    if (state.status == _JobsOnceStatusDone) {
        [state.condition unlock];
        return;
    }

    state.status = _JobsOnceStatusExecuting;
    [state.condition unlock];

    @try {
        block();
    } @finally {
        [state.condition lock];
        state.status = _JobsOnceStatusDone;
        [state.condition broadcast];
        [state.condition unlock];
    }
}

- (BOOL)didExecuteOnce {
    _JobsOnceState *state = [self jobs_onceState];

    [state.condition lock];
    BOOL executed = state.status == _JobsOnceStatusDone;
    [state.condition unlock];

    return executed;
}

- (void)resetOnceState {
    _JobsOnceState *state = [self jobs_onceState];

    [state.condition lock];
    while (state.status == _JobsOnceStatusExecuting) {
        [state.condition wait];
    }
    state.status = _JobsOnceStatusIdle;
    [state.condition unlock];
}

@end
