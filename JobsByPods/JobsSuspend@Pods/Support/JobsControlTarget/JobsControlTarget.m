//
//  JobsControlTarget.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsControlTarget.h"

@interface JobsControlTarget ()

@end

@implementation JobsControlTarget
#define JobsControlTargetDSL(_type_, _name_, _property_, _dataType_) \
-(JobsRetJobsControlTargetBy##_type_##Block _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsControlTarget *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JobsControlTargetDSL(JobsByCtrl, Block, block, jobsByCtrlBlock _Nullable)
JobsControlTargetDSL(Policy, Policy, policy, JobsInvokePolicy)
JobsControlTargetDSL(TimeInterval, Interval, interval, NSTimeInterval)
JobsControlTargetDSL(TimeInterval, LastFire, lastFire, NSTimeInterval)
JobsControlTargetDSL(UInt64, DebounceGen, debounceGen, uint64_t)
JobsControlTargetDSL(Control, BoundControl, boundControl, __kindof UIControl *_Nullable)
JobsControlTargetDSL(ControlEvents, Event, event, UIControlEvents)

#undef JobsControlTargetDSL

static inline NSTimeInterval _jobs_now(void) {
    return CFAbsoluteTimeGetCurrent();
}

-(void)invoke:(__kindof UIControl *)sender {
    jobsByCtrlBlock action = ((jobsByCtrlBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsControlTarget.class, @selector(jobsInvoke)))(self, @selector(jobsInvoke));
    if (action) action(sender);
}

-(jobsByCtrlBlock _Nonnull)jobsInvoke{
    @jobs_weakify(self)
    return ^(__kindof UIControl * sender){
        @jobs_strongify(self)
        if (!self) return;
        // 保险：强制回到主线程（UIControl 事件本就主线程，但防止外部 sendActions 异线程调用）
        if (![NSThread isMainThread]) {
            @jobs_weakify(self)
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self invoke:sender];
            });return;
        }
        switch (self.policy) {
            /// 处理 JobsInvokePolicyNone 分支
            case JobsInvokePolicyNone: {
                if (self.block) self.block(sender);
            } break;
            /// 处理 JobsInvokePolicyOnce 分支
            case JobsInvokePolicyOnce: {
                if (!self.block) return;
                jobsByCtrlBlock blk = [self.block copy];
                // 触发后解绑自身
                [sender removeTarget:self action:@selector(invoke:) forControlEvents:self.event];
                self.byBlock(nil);
                if (blk) blk(sender);
            } break;
            /// 处理 JobsInvokePolicyThrottle 分支
            case JobsInvokePolicyThrottle: {
                NSTimeInterval now = _jobs_now();
                if (now - self.lastFire >= MAX(self.interval, 0)) {
                    self.byLastFire(now);
                    if (self.block) self.block(sender);
                }
            } break;
            /// 处理 JobsInvokePolicyDebounce 分支
            case JobsInvokePolicyDebounce: {
                self.debounceGen += 1;
                uint64_t currentGen = self.debounceGen;
                NSTimeInterval delay = MAX(self.interval, 0);
                @jobs_weakify(self)
                @jobs_weakify(sender)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)),
                               dispatch_get_main_queue(), ^{
                    @jobs_strongify(self)
                    @jobs_strongify(sender)
                    if (!self || !sender) return;
                    if (currentGen == self.debounceGen && self.block) {
                        self.block(sender);
                    }
                });
            } break;
        }
    };
}

@end
