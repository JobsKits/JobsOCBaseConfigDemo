//
//  JobsDouyinRefreshConfig.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <math.h>

#import "JobsDouyinRefreshConfig.h"

@implementation JobsDouyinRefreshConfig
+(JobsRetJobsDouyinRefreshConfigByVoidBlock _Nonnull)config {
    return ^__kindof JobsDouyinRefreshConfig *{
        return JobsDouyinRefreshConfig.alloc.init;
    };
}

-(instancetype)init {
    if (self = [super init]) {
        _redColor = RGB_COLOR(254, 44, 85);
        _greenColor = RGB_COLOR(37, 244, 238);
        _dotDiameter = 14;
        _horizontalTravel = 24;
        _jumpHeight = 8;
        _cycleDuration = 0.84;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone {
    JobsDouyinRefreshConfig *config = [[JobsDouyinRefreshConfig allocWithZone:zone] init];
    config
        .byRedColor(self.redColor)
        .byGreenColor(self.greenColor)
        .byDotDiameter(self.dotDiameter)
        .byHorizontalTravel(self.horizontalTravel)
        .byJumpHeight(self.jumpHeight)
        .byCycleDuration(self.cycleDuration);
    return config;
}

-(JobsRetJobsDouyinRefreshConfigByUIColorBlock _Nonnull)byRedColor {
    return ^JobsDouyinRefreshConfig *(UIColor *data) {
        self.redColor = data ?: RGB_COLOR(254, 44, 85);
        return self;
    };
}

-(JobsRetJobsDouyinRefreshConfigByUIColorBlock _Nonnull)byGreenColor {
    return ^JobsDouyinRefreshConfig *(UIColor *data) {
        self.greenColor = data ?: RGB_COLOR(37, 244, 238);
        return self;
    };
}

-(JobsRetJobsDouyinRefreshConfigByCGFloatBlock _Nonnull)byDotDiameter {
    return ^JobsDouyinRefreshConfig *(CGFloat data) {
        self.dotDiameter = isfinite(data) ? MAX(2, data) : 14;
        return self;
    };
}

-(JobsRetJobsDouyinRefreshConfigByCGFloatBlock _Nonnull)byHorizontalTravel {
    return ^JobsDouyinRefreshConfig *(CGFloat data) {
        self.horizontalTravel = isfinite(data) ? MAX(2, data) : 24;
        return self;
    };
}

-(JobsRetJobsDouyinRefreshConfigByCGFloatBlock _Nonnull)byJumpHeight {
    return ^JobsDouyinRefreshConfig *(CGFloat data) {
        self.jumpHeight = isfinite(data) ? MAX(0, data) : 8;
        return self;
    };
}

-(JobsRetJobsDouyinRefreshConfigByNSTimeIntervalBlock _Nonnull)byCycleDuration {
    return ^JobsDouyinRefreshConfig *(NSTimeInterval data) {
        self.cycleDuration = isfinite(data) ? MAX(0.36, data) : 0.84;
        return self;
    };
}

-(CGSize)indicatorSize {
    return ((((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshConfig.class, @selector(jobsIndicatorSize)))(self, @selector(jobsIndicatorSize))))();
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIndicatorSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return CGSizeMake(self.horizontalTravel + self.dotDiameter,
                          self.dotDiameter + self.jumpHeight * 2);
    };
}

@end
