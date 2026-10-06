//
//  JobsNetWorkTools.m
//  JobsNetWorkTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNetWorkTools.h"

@interface JobsNetworkTrafficMonitor ()

Prop_copy()JobsNetworkUpdateBlock onUpdate;
@property(nonatomic, assign)uint64_t lastDownload;
@property(nonatomic, assign)uint64_t lastUpload;
@property(nonatomic, assign)NSTimeInterval lastSampleTime;
-(JobsRetIDByDoubleBlock _Nonnull)byTimeInterval;
-(JobsRetIDByIDBlock _Nonnull)byTimer;

@end

@implementation JobsNetworkTrafficMonitor

-(void)dealloc{
    JobsTimer *timer = _timer;
    if (!timer) {
        return;
    }
    if (NSThread.isMainThread) {
        timer.jobsStop();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            timer.jobsStop();
        });
    }
}

-(JobsRetIDByDoubleBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^id(NSTimeInterval interval){
        @jobs_strongify(self)
        self.timeInterval = interval;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^id(JobsTimer *timer){
        @jobs_strongify(self)
        self.timer = timer;
        return self;
    };
}
/// 可销毁单例
static JobsNetworkTrafficMonitor *_sharedInstance = nil;
+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id _Nonnull{
        @synchronized(self) {
            if (!_sharedInstance) {
                _sharedInstance = [self.alloc init];
            };return _sharedInstance;
        }
    };
}

+(jobsByVoidBlock _Nonnull)destroyShared{
    return ^{
        @synchronized(self) {
            if (_sharedInstance) {
                _sharedInstance.byStop();
                _sharedInstance = nil;
            }
        }
    };
}

-(JobsRetTNetworkTrafficMonitorByUpdateBlock _Nonnull)onUpdateBy{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkTrafficMonitor *_Nullable(JobsNetworkUpdateBlock _Nullable block){
        @jobs_strongify(self)
        self.onUpdate = block;
        return self;
    };
}
@synthesize timeInterval = _timeInterval;
-(jobsByDoubleBlock _Nonnull)byStartWithInterval{
    @jobs_weakify(self)
    return ^(NSTimeInterval interval){
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.byStartWithInterval(interval);
            });
            return;
        }
        self.byStop();
        self.byTimeInterval(isfinite(interval) && interval > 0 ? MAX(0.1, MIN(interval, 3600)) : 1.0);
        JobsNetworkBytes baseline = JobsCurrentNetworkBytes();
        self.lastDownload = baseline.download;
        self.lastUpload = baseline.upload;
        self.lastSampleTime = NSProcessInfo.processInfo.systemUptime;
        self.timer.start();
    };
}

-(jobsByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.byStop();
            });
            return;
        }
        if (_timer) _timer.jobsStop();
        self.byTimer(nil);
        self.lastSampleTime = 0;
    };
}
@synthesize timer = _timer;
-(JobsTimer *)timer{
    if(!_timer){
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeNSTimer)
            .byTimerStyle(TimerStyle_clockwise) // 倒计时模式
            .byTimeInterval(self.timeInterval)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
            .byTime(0)
            .byOnTick(^(CGFloat time){
                @jobs_strongify(self)
                if (!self) return;
                JobsNetworkBytes now = JobsCurrentNetworkBytes();
                NSTimeInterval sampledAt = NSProcessInfo.processInfo.systemUptime;
                NSTimeInterval elapsed = sampledAt - self.lastSampleTime;
                uint64_t deltaDown = now.download >= self.lastDownload ? now.download - self.lastDownload : 0;
                uint64_t deltaUp = now.upload >= self.lastUpload ? now.upload - self.lastUpload : 0;
                self.lastDownload = now.download;
                self.lastUpload = now.upload;
                self.lastSampleTime = sampledAt;
                if (!isfinite(elapsed) || elapsed <= 0) return;
                long double downRate = (long double)deltaDown / elapsed;
                long double upRate = (long double)deltaUp / elapsed;
                uint64_t downloadBps = downRate >= UINT64_MAX ? UINT64_MAX : (uint64_t)downRate;
                uint64_t uploadBps = upRate >= UINT64_MAX ? UINT64_MAX : (uint64_t)upRate;
                if (self.onUpdate) self.onUpdate(jobsMakeNetworkSource(^(__kindof JobsNetworkSource * _Nullable source) {
                    source.byType(JobsNetworkSourceTypeUnknown)
                          .byDisplayName(@"设备总流量");
                }), uploadBps, downloadBps);
            })
            .byOnFinish(^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"我死球了");
                if (self.objBlock) self.objBlock(timer);
            })

                .byAccumulatedElapsed(0)
                .byLastStartDate(nil);
        });
    };return _timer;
}

@end
