//
//  JobsImageRotator.m
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsImageRotator.h"

NSTimeInterval const JobsImageRotationDefaultInterval = 1.0 / 60.0;
static CGFloat const JobsImageRotationRadiansPerTick = M_PI * 2.0 / 60.0;

@interface JobsImageRotator ()

Prop_weak()UIView *targetView;
Prop_strong()JobsTimer *timer;
Prop_assign()CGAffineTransform baseTransform;
Prop_assign()CGFloat currentAngle;

-(void)rotateOneTick;
+(NSTimeInterval)normalizedInterval:(NSTimeInterval)interval;

@end

@implementation JobsImageRotator

-(void)dealloc{
    [_timer stop];
}

-(instancetype)initWithTargetView:(UIView *)targetView{
    return [self initWithTargetView:targetView
                         direction:JobsImageRotationDirectionClockwise
                          interval:JobsImageRotationDefaultInterval];
}

-(instancetype)initWithTargetView:(UIView *)targetView
                        direction:(JobsImageRotationDirection)direction
                         interval:(NSTimeInterval)interval{
    if (self = [super init]) {
        _targetView = targetView;
        _direction = direction;
        _interval = [JobsImageRotator normalizedInterval:interval];
        _baseTransform = targetView.transform;
    };return self;
}

-(void)setInterval:(NSTimeInterval)interval{
    _interval = [JobsImageRotator normalizedInterval:interval];
}

-(instancetype)start{
    NSAssert(NSThread.isMainThread, @"JobsImageRotator.start 必须在主线程调用");
    [self.timer stop];
    @jobs_weakify(self)
    self.timer = jobsMakeTimer(^(__kindof JobsTimer * _Nullable timer) {
        @jobs_strongify(self)
        timer.byTimerType(JobsTimerTypeGCD)
            .byTimerStyle(TimerStyle_clockwise)
            .byStartTime(0)
            .byTimeInterval(self.interval)
            .byQueue(dispatch_get_main_queue())
            .byPauseInBackground(YES)
            .byAutoManageAppState(YES)
            .byOnTick(^(CGFloat time) {
                @jobs_strongify(self)
                [self rotateOneTick];
            });
    });
    [self.timer start];
    return self;
}

-(instancetype)pause{
    NSAssert(NSThread.isMainThread, @"JobsImageRotator.pause 必须在主线程调用");
    [self.timer pause];
    return self;
}

-(instancetype)resume{
    NSAssert(NSThread.isMainThread, @"JobsImageRotator.resume 必须在主线程调用");
    [self.timer resume];
    return self;
}

-(instancetype)stop{
    return [self stopAndReset:YES];
}

-(instancetype)stopAndReset:(BOOL)reset{
    NSAssert(NSThread.isMainThread, @"JobsImageRotator.stop 必须在主线程调用");
    [self.timer stop];
    self.timer = nil;
    if (reset) {
        self.currentAngle = 0;
        self.targetView.transform = self.baseTransform;
    };return self;
}

-(void)rotateOneTick{
    NSAssert(NSThread.isMainThread, @"JobsImageRotator tick 必须在主线程执行");
    CGFloat multiplier = self.direction == JobsImageRotationDirectionClockwise ? 1 : -1;
    self.currentAngle += multiplier * JobsImageRotationRadiansPerTick;
    self.currentAngle = fmod(self.currentAngle, M_PI * 2.0);
    self.targetView.transform = CGAffineTransformConcat(
        self.baseTransform,
        CGAffineTransformMakeRotation(self.currentAngle)
    );
}

+(NSTimeInterval)normalizedInterval:(NSTimeInterval)interval{
    return isfinite(interval) && interval > 0 ? interval : JobsImageRotationDefaultInterval;
}

@end
