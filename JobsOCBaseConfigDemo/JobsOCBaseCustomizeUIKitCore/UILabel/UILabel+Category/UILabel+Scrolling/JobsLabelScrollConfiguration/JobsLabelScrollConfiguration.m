//
//  JobsLabelScrollConfiguration.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import "JobsLabelScrollConfiguration.h"

@implementation JobsLabelScrollConfiguration

+(instancetype)continuousConfiguration{
    return [JobsLabelScrollConfiguration.alloc initWithMode:JobsLabelScrollModeContinuous];
}

+(instancetype)pingPongConfiguration{
    return [JobsLabelScrollConfiguration.alloc initWithMode:JobsLabelScrollModePingPong];
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

-(id)copyWithZone:(NSZone *)zone{
    JobsLabelScrollConfiguration *configuration = [[[self class] allocWithZone:zone] initWithMode:self.mode];
    configuration.speed = self.speed;
    configuration.spacing = self.spacing;
    configuration.startDelay = self.startDelay;
    configuration.edgePause = self.edgePause;
    configuration.framesPerSecond = self.framesPerSecond;
    configuration.timerType = self.timerType;
    configuration.respectsReduceMotion = self.respectsReduceMotion;
    return configuration;
}

@end
