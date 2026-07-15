//
//  UIControl+Extra.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIControl+Extra.h"
#import <JobsSuspend/JobsControlTarget.h>

JobsKey(kJobsTargetsMapKey)
static inline NSMutableDictionary<NSNumber *, JobsControlTarget *> *jobs_targetsMap(UIControl *ctl, BOOL createIfMissing) {
    NSMutableDictionary *map = Jobs_getAssociatedObjectByTarget(ctl, kJobsTargetsMapKey);
    if (!map && createIfMissing) {
        map = NSMutableDictionary.dictionary;
        Jobs_setAssociatedRETAIN_NONATOMICByTarget(ctl, kJobsTargetsMapKey, map)
    };return map;
}

static inline JobsControlTarget *_jobs_bind(UIControl *ctl, UIControlEvents singleEvent, jobsByCtrlBlock block) {
    NSMutableDictionary *map = jobs_targetsMap(ctl, YES);
    JobsControlTarget *old = map[@(singleEvent)];
    if (old) {
        [ctl removeTarget:old action:@selector(invoke:) forControlEvents:singleEvent];
        [map removeObjectForKey:@(singleEvent)];
    }
    JobsControlTarget *t = jobsMakeControlTarget(^(JobsControlTarget * _Nullable target) {
        target.block = [block copy];
        target.policy = JobsInvokePolicyNone;
        target.boundControl = ctl;
        target.event = singleEvent;
    });
    [ctl addTarget:t action:@selector(invoke:) forControlEvents:singleEvent];
    map[@(singleEvent)] = t;
    return t;
}

@implementation UIControl (Extra)
-(instancetype)jobs_onChange:(jobsByCtrlBlock _Nonnull)block{
    _jobs_bind(self, UIControlEventValueChanged, block);
    return self;
}

@end
