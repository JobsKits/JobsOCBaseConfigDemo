//
//  JobsLabelScrollConfiguration.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import "JobsLabelScrollConfiguration.h"

@implementation JobsLabelScrollConfiguration

+(JobsRetIDByVoidBlock _Nonnull)continuousConfiguration{
    return ^id{
        return [JobsLabelScrollConfiguration.alloc initWithMode:JobsLabelScrollModeContinuous];
    };
}

+(JobsRetIDByVoidBlock _Nonnull)pingPongConfiguration{
    return ^id{
        return [JobsLabelScrollConfiguration.alloc initWithMode:JobsLabelScrollModePingPong];
    };
}

-(instancetype)init{
    return [self initWithMode:JobsLabelScrollModeContinuous];
}

-(instancetype)initWithMode:(JobsLabelScrollMode)mode{
    if (self = [super init]) {
        _mode = mode;
        _speed = mode == JobsLabelScrollModeContinuous ? 36 : 28;
        _spacing = mode == JobsLabelScrollModeContinuous ? 40 : 0;
        _startDelay = 0.8;
        _edgePause = mode == JobsLabelScrollModePingPong ? 0.8 : 0;
        _framesPerSecond = 60;
        _timerType = JobsTimerTypeDisplayLink;
        _respectsReduceMotion = YES;
    };return self;
}

-(void)setSpeed:(CGFloat)speed{
    _speed = MAX(0, speed);
}

-(void)setSpacing:(CGFloat)spacing{
    _spacing = MAX(0, spacing);
}

-(void)setStartDelay:(NSTimeInterval)startDelay{
    _startDelay = MAX(0, startDelay);
}

-(void)setEdgePause:(NSTimeInterval)edgePause{
    _edgePause = MAX(0, edgePause);
}

-(void)setFramesPerSecond:(NSInteger)framesPerSecond{
    _framesPerSecond = MIN(MAX(1, framesPerSecond), 120);
}

-(JobsRetJobsLabelScrollConfigurationByNSUIntegerBlock _Nonnull)byMode{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(NSUInteger mode){
        @jobs_strongify(self)
        self.mode = (JobsLabelScrollMode)mode;
        return self;
    };
}

-(JobsRetJobsLabelScrollConfigurationByCGFloatBlock _Nonnull)bySpeed{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(CGFloat speed){
        @jobs_strongify(self)
        self.speed = speed;
        return self;
    };
}

-(JobsRetJobsLabelScrollConfigurationByCGFloatBlock _Nonnull)bySpacing{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(CGFloat spacing){
        @jobs_strongify(self)
        self.spacing = spacing;
        return self;
    };
}

-(JobsRetJobsLabelScrollConfigurationByNSTimeIntervalBlock _Nonnull)byStartDelay{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(NSTimeInterval startDelay){
        @jobs_strongify(self)
        self.startDelay = startDelay;
        return self;
    };
}

-(JobsRetJobsLabelScrollConfigurationByNSTimeIntervalBlock _Nonnull)byEdgePause{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(NSTimeInterval edgePause){
        @jobs_strongify(self)
        self.edgePause = edgePause;
        return self;
    };
}

-(JobsRetJobsLabelScrollConfigurationByNSIntegerBlock _Nonnull)byFramesPerSecond{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(NSInteger framesPerSecond){
        @jobs_strongify(self)
        self.framesPerSecond = framesPerSecond;
        return self;
    };
}

-(JobsRetJobsLabelScrollConfigurationByNSUIntegerBlock _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(NSUInteger timerType){
        @jobs_strongify(self)
        self.timerType = (JobsTimerType)timerType;
        return self;
    };
}

-(JobsRetJobsLabelScrollConfigurationByBOOLBlock _Nonnull)byRespectsReduceMotion{
    @jobs_weakify(self)
    return ^JobsLabelScrollConfiguration *(BOOL respectsReduceMotion){
        @jobs_strongify(self)
        self.respectsReduceMotion = respectsReduceMotion;
        return self;
    };
}

-(id)copyWithZone:(NSZone *)zone{
    JobsLabelScrollConfiguration *configuration = [[[self class] allocWithZone:zone] initWithMode:self.mode];
    return configuration
        .bySpeed(self.speed)
        .bySpacing(self.spacing)
        .byStartDelay(self.startDelay)
        .byEdgePause(self.edgePause)
        .byFramesPerSecond(self.framesPerSecond)
        .byTimerType(self.timerType)
        .byRespectsReduceMotion(self.respectsReduceMotion);
}

@end
