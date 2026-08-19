//
//  JobsTimerMgr+DSL.m
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年6月20日，星期六.
//

#import "JobsTimerMgr+DSL.h"

@implementation JobsTimerMgr (DSL)
-(JobsRetJobsTimerMgrByUpsertTimerBlock _Nonnull)byUpsertTimer{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable identifier,
                                             JobsTimerType timerType,
                                             NSUInteger policy,
                                             BOOL startImmediately,
                                             JobsTimerMgrBuildBlock _Nullable build,
                                             jobsByVoidBlock _Nullable handler) {
        @jobs_strongify(self)
        [self upsertTimerWithIdentifier:identifier
                              timerType:timerType
                                 policy:policy
                       startImmediately:startImmediately
                                  build:build
                                handler:handler];
        return self;
    };
}

-(JobsRetJobsTimerMgrByScopedUpsertTimerBlock _Nonnull)byUpsertScopedTimer{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable identifier,
                                             NSString *_Nullable scopeIdentifier,
                                             JobsTimerType timerType,
                                             NSUInteger policy,
                                             BOOL startImmediately,
                                             JobsTimerMgrBuildBlock _Nullable build,
                                             jobsByVoidBlock _Nullable handler) {
        @jobs_strongify(self)
        [self upsertTimerWithIdentifier:identifier
                       scopeIdentifier:scopeIdentifier
                             timerType:timerType
                                policy:policy
                      startImmediately:startImmediately
                                 build:build
                               handler:handler];
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringAndJobsByCGFloatBlockBlock _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable identifier, jobsByCGFloatBlock _Nullable block) {
        @jobs_strongify(self)
        [self onTick:identifier block:block];
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringAndJobsByVoidBlockBlock _Nonnull)byOnTickVoid{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable identifier, jobsByVoidBlock _Nullable block) {
        @jobs_strongify(self)
        [self onTickVoid:identifier block:block];
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringAndJobsTimerBlockBlock _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable identifier, JobsTimerBlock _Nullable block) {
        @jobs_strongify(self)
        [self onFinish:identifier block:block];
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringAndJobsByVoidBlockBlock _Nonnull)byOnFinishVoid{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable identifier, jobsByVoidBlock _Nullable block) {
        @jobs_strongify(self)
        [self onFinishVoid:identifier block:block];
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byStart{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.start(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byPause{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.pause(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byResume{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.resume(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byPauseScope{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.pauseScope(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byResumeScope{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.resumeScope(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byFireOnceAndRemove{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.fireOnceAndRemove(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byStopAndRemove{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.stopAndRemove(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringAndJobsTimerBlock _Nonnull)byStopAndRemoveExpectedTimer{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable identifier,
                                             JobsTimer *_Nullable expectedTimer) {
        @jobs_strongify(self)
        [self stopAndRemove:identifier expectedTimer:expectedTimer];
        return self;
    };
}

-(JobsRetJobsTimerMgrByStringBlock _Nonnull)byStopAndRemoveScope{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        self.stopAndRemoveScope(data);
        return self;
    };
}

-(JobsRetJobsTimerMgrByVoidBlock _Nonnull)byStopAndRemoveAll{
    @jobs_weakify(self)
    return ^__kindof JobsTimerMgr *_Nullable(void) {
        @jobs_strongify(self)
        self.stopAndRemoveAll();
        return self;
    };
}

@end
