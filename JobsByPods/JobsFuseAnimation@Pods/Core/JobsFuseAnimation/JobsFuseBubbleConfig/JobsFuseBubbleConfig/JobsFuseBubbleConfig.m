//
//  JobsFuseBubbleConfig.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import "JobsFuseBubbleConfig.h"

@implementation JobsFuseBubbleConfig
+(JobsRetJobsFuseBubbleConfigByVoidBlock _Nonnull)config {
    return ^__kindof JobsFuseBubbleConfig *{
        return JobsFuseBubbleConfig.alloc.init;
    };
}

-(instancetype)init {
    if (self = [super init]) {
        _emissionInterval = 0.16;
        _riseDistance = 180;
        _horizontalDrift = 54;
        _duration = 0.9;
        _initialScale = 0.58;
        _peakScale = 1.08;
        _endScale = 0.84;
        _maximumRotation = M_PI / 10.0;
        _maximumConcurrentCount = 12;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone {
    JobsFuseBubbleConfig *config = [[JobsFuseBubbleConfig allocWithZone:zone] init];
    config.byEmissionInterval(self.emissionInterval);
    config.byRiseDistance(self.riseDistance);
    config.byHorizontalDrift(self.horizontalDrift);
    config.byDuration(self.duration);
    config.byInitialScale(self.initialScale);
    config.byPeakScale(self.peakScale);
    config.byEndScale(self.endScale);
    config.byMaximumRotation(self.maximumRotation);
    config.byMaximumConcurrentCount(self.maximumConcurrentCount);
    return config;
}

-(JobsRetJobsFuseBubbleConfigByNSTimeIntervalBlock _Nonnull)byEmissionInterval {
    return ^JobsFuseBubbleConfig *(NSTimeInterval data) {
        self.emissionInterval = MAX(0.06, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byRiseDistance {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.riseDistance = MAX(24, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byHorizontalDrift {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.horizontalDrift = MAX(0, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByNSTimeIntervalBlock _Nonnull)byDuration {
    return ^JobsFuseBubbleConfig *(NSTimeInterval data) {
        self.duration = MAX(0.2, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byInitialScale {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.initialScale = MAX(0.01, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byPeakScale {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.peakScale = MAX(0.01, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byEndScale {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.endScale = MAX(0.01, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByCGFloatBlock _Nonnull)byMaximumRotation {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.maximumRotation = MAX(0, data);
        return self;
    };
}

-(JobsRetJobsFuseBubbleConfigByNSIntegerBlock _Nonnull)byMaximumConcurrentCount {
    return ^JobsFuseBubbleConfig *(NSInteger data) {
        self.maximumConcurrentCount = MAX(1, data);
        return self;
    };
}

@end
