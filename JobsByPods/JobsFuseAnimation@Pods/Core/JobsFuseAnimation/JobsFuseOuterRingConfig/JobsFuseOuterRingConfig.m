//
//  JobsFuseOuterRingConfig.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsFuseOuterRingConfig.h"

@implementation JobsFuseOuterRingConfig
+(__kindof JobsFuseOuterRingConfig *)config {
    return JobsFuseOuterRingConfig.alloc.init;
}

-(instancetype)init {
    if (self = [super init]) {
        _lineWidth = 4.0;
        _strokeColor = UIColor.whiteColor;
        _trackColor = [UIColor.whiteColor colorWithAlphaComponent:0.22];
        _fillColor = UIColor.clearColor;
        _fromOpacity = 1.0;
        _toOpacity = 1.0;
        _growDuration = 1.2;
        _timerInterval = 1.0 / 60.0;
        _repeatsWhileHolding = NO;
        _retreatDuration = 0.28;
        _fadeOutDuration = 0.08;
        _inset = 1.0;
        _startsFromTop = YES;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone {
    JobsFuseOuterRingConfig *config = [[JobsFuseOuterRingConfig allocWithZone:zone] init];
    config.lineWidth = self.lineWidth;
    config.strokeColor = self.strokeColor;
    config.trackColor = self.trackColor;
    config.fillColor = self.fillColor;
    config.fromOpacity = self.fromOpacity;
    config.toOpacity = self.toOpacity;
    config.growDuration = self.growDuration;
    config.timerInterval = self.timerInterval;
    config.repeatsWhileHolding = self.repeatsWhileHolding;
    config.retreatDuration = self.retreatDuration;
    config.fadeOutDuration = self.fadeOutDuration;
    config.inset = self.inset;
    config.startsFromTop = self.startsFromTop;
    return config;
}

-(JobsFuseOuterRingConfig *(^)(CGFloat))byLineWidth {
    return ^JobsFuseOuterRingConfig *(CGFloat data) {
        self.lineWidth = MAX(0.5, data);
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(UIColor *))byStrokeColor {
    return ^JobsFuseOuterRingConfig *(UIColor *data) {
        self.strokeColor = data ?: UIColor.whiteColor;
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(UIColor *_Nullable))byTrackColor {
    return ^JobsFuseOuterRingConfig *(UIColor *_Nullable data) {
        self.trackColor = data;
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(UIColor *))byFillColor {
    return ^JobsFuseOuterRingConfig *(UIColor *data) {
        self.fillColor = data ?: UIColor.clearColor;
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(CGFloat))byFromOpacity {
    return ^JobsFuseOuterRingConfig *(CGFloat data) {
        self.fromOpacity = data;
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(CGFloat))byToOpacity {
    return ^JobsFuseOuterRingConfig *(CGFloat data) {
        self.toOpacity = data;
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(NSTimeInterval))byGrowDuration {
    return ^JobsFuseOuterRingConfig *(NSTimeInterval data) {
        self.growDuration = MAX(0.001, data);
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(NSTimeInterval))byTimerInterval {
    return ^JobsFuseOuterRingConfig *(NSTimeInterval data) {
        self.timerInterval = MAX(0.001, data);
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(BOOL))byRepeatsWhileHolding {
    return ^JobsFuseOuterRingConfig *(BOOL data) {
        self.repeatsWhileHolding = data;
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(NSTimeInterval))byRetreatDuration {
    return ^JobsFuseOuterRingConfig *(NSTimeInterval data) {
        self.retreatDuration = MAX(0, data);
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(NSTimeInterval))byFadeOutDuration {
    return ^JobsFuseOuterRingConfig *(NSTimeInterval data) {
        self.fadeOutDuration = MAX(0, data);
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(CGFloat))byInset {
    return ^JobsFuseOuterRingConfig *(CGFloat data) {
        self.inset = MAX(0, data);
        return self;
    };
}

-(JobsFuseOuterRingConfig *(^)(BOOL))byStartsFromTop {
    return ^JobsFuseOuterRingConfig *(BOOL data) {
        self.startsFromTop = data;
        return self;
    };
}

@end
