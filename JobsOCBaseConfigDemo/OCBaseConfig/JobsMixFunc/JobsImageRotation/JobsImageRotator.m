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

-(jobsByVoidBlock _Nonnull)rotateOneTick;
-(JobsRetIDByIDBlock _Nonnull)byTimer;
+(JobsRetNSTimeIntervalByNSTimeIntervalBlock _Nonnull)normalizedInterval;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsImageRotator
@interface JobsImageRotator (JobsPropertyDSLSetterAutogen_7f23908c2e)
-(void)setCurrentAngle:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsImageRotator

@implementation JobsImageRotator

-(JobsRetJobsImageRotatorByDirectionBlock _Nonnull)byDirection{
    @jobs_weakify(self)
    return ^__kindof JobsImageRotator *_Nullable(JobsImageRotationDirection data){
        @jobs_strongify(self)
        self.direction = data;
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

-(void)dealloc{
    if (_timer) _timer.jobsStop();
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
        _interval = JobsImageRotator.normalizedInterval(interval);
        _baseTransform = targetView.transform;
    };return self;
}

-(void)setInterval:(NSTimeInterval)interval{
    _interval = JobsImageRotator.normalizedInterval(interval);
}

-(JobsRetIDByVoidBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        NSAssert(NSThread.isMainThread, @"JobsImageRotator.start 必须在主线程调用");
        if (self.timer) self.timer.jobsStop();
        @jobs_weakify(self)
        self.byTimer(jobsMakeTimer(^(__kindof JobsTimer * _Nullable timer) {
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
                    self.rotateOneTick();
                });
        }));
        self.timer.start();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)pause{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        NSAssert(NSThread.isMainThread, @"JobsImageRotator.pause 必须在主线程调用");
        if (self.timer) self.timer.pause();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)resume{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        NSAssert(NSThread.isMainThread, @"JobsImageRotator.resume 必须在主线程调用");
        if (self.timer) self.timer.resume();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.stopAndReset(YES);
    };
}

-(JobsRetIDByBOOLBlock _Nonnull)stopAndReset{
    @jobs_weakify(self)
    return ^id(BOOL reset){
        @jobs_strongify(self)
        if (!self) return nil;
        NSAssert(NSThread.isMainThread, @"JobsImageRotator.stop 必须在主线程调用");
        if (self.timer) self.timer.jobsStop();
        self.byTimer(nil);
        if (reset) {
            self.byCurrentAngle(0);
            self.targetView.byTransform(self.baseTransform);
        };return self;
    };
}

-(jobsByVoidBlock _Nonnull)rotateOneTick{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSAssert(NSThread.isMainThread, @"JobsImageRotator tick 必须在主线程执行");
        CGFloat multiplier = self.direction == JobsImageRotationDirectionClockwise ? 1 : -1;
        self.currentAngle += multiplier * JobsImageRotationRadiansPerTick;
        self.byCurrentAngle(fmod(self.currentAngle, M_PI * 2.0));
        self.targetView.transform = CGAffineTransformConcat(
            self.baseTransform,
            CGAffineTransformMakeRotation(self.currentAngle)
        );
    };
}

+(JobsRetNSTimeIntervalByNSTimeIntervalBlock _Nonnull)normalizedInterval{
    return ^NSTimeInterval(NSTimeInterval interval){
        return isfinite(interval) && interval > 0 ? interval : JobsImageRotationDefaultInterval;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsImageRotator
-(JobsRetJobsImageRotatorByCGFloatBlock _Nonnull)byCurrentAngle{
    @jobs_weakify(self)
    return ^__kindof JobsImageRotator * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCurrentAngle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsImageRotator
@end
