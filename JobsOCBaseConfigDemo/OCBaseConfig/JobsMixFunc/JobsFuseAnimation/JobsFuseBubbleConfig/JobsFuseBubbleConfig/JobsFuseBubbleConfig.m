//
//  JobsFuseBubbleConfig.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import "JobsFuseBubbleConfig.h"

@implementation JobsFuseBubbleConfig
+(__kindof JobsFuseBubbleConfig *)config {
    return JobsFuseBubbleConfig.alloc.init;
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
    config.emissionInterval = self.emissionInterval;
    config.riseDistance = self.riseDistance;
    config.horizontalDrift = self.horizontalDrift;
    config.duration = self.duration;
    config.initialScale = self.initialScale;
    config.peakScale = self.peakScale;
    config.endScale = self.endScale;
    config.maximumRotation = self.maximumRotation;
    config.maximumConcurrentCount = self.maximumConcurrentCount;
    return config;
}

-(JobsFuseBubbleConfig *(^)(NSTimeInterval))byEmissionInterval {
    return ^JobsFuseBubbleConfig *(NSTimeInterval data) {
        self.emissionInterval = MAX(0.06, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(CGFloat))byRiseDistance {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.riseDistance = MAX(24, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(CGFloat))byHorizontalDrift {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.horizontalDrift = MAX(0, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(NSTimeInterval))byDuration {
    return ^JobsFuseBubbleConfig *(NSTimeInterval data) {
        self.duration = MAX(0.2, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(CGFloat))byInitialScale {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.initialScale = MAX(0.01, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(CGFloat))byPeakScale {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.peakScale = MAX(0.01, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(CGFloat))byEndScale {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.endScale = MAX(0.01, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(CGFloat))byMaximumRotation {
    return ^JobsFuseBubbleConfig *(CGFloat data) {
        self.maximumRotation = MAX(0, data);
        return self;
    };
}

-(JobsFuseBubbleConfig *(^)(NSInteger))byMaximumConcurrentCount {
    return ^JobsFuseBubbleConfig *(NSInteger data) {
        self.maximumConcurrentCount = MAX(1, data);
        return self;
    };
}

@end
