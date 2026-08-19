//
//  JobsTodayNewsRefreshConfig.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsTodayNewsRefreshConfig.h"

@implementation JobsTodayNewsRefreshConfig
+(JobsRetJobsTodayNewsRefreshConfigByVoidBlock _Nonnull)config {
    return ^__kindof JobsTodayNewsRefreshConfig *{
        return JobsTodayNewsRefreshConfig.alloc.init;
    };
}

-(instancetype)init {
    if (self = [super init]) {
        _strokeColor = RGB_COLOR(255, 75, 75);
        _lineWidth = 1.8;
        _triangleWidth = 15;
        _triangleHeight = 16;
        _centerGap = 1;
        _cycleDuration = 0.65;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone {
    JobsTodayNewsRefreshConfig *config = [[JobsTodayNewsRefreshConfig allocWithZone:zone] init];
    config.byStrokeColor(self.strokeColor)
        .byLineWidth(self.lineWidth)
        .byTriangleWidth(self.triangleWidth)
        .byTriangleHeight(self.triangleHeight)
        .byCenterGap(self.centerGap)
        .byCycleDuration(self.cycleDuration);
    return config;
}

-(JobsRetJobsTodayNewsRefreshConfigByUIColorBlock _Nonnull)byStrokeColor {
    return ^JobsTodayNewsRefreshConfig *(UIColor *data) {
        self.strokeColor = data ?: RGB_COLOR(255, 75, 75);
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byLineWidth {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.lineWidth = isfinite(data) ? MAX(0.5, data) : 1.8;
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byTriangleWidth {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.triangleWidth = isfinite(data) ? MAX(4, data) : 15;
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byTriangleHeight {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.triangleHeight = isfinite(data) ? MAX(4, data) : 16;
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byCenterGap {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.centerGap = isfinite(data) ? MAX(0, data) : 1;
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshConfigByNSTimeIntervalBlock _Nonnull)byCycleDuration {
    return ^JobsTodayNewsRefreshConfig *(NSTimeInterval data) {
        self.cycleDuration = isfinite(data) ? MAX(0.3, data) : 0.65;
        return self;
    };
}

-(CGSize)indicatorSize {
    return ((((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTodayNewsRefreshConfig.class, @selector(jobsIndicatorSize)))(self, @selector(jobsIndicatorSize))))();
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIndicatorSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return CGSizeMake(self.triangleWidth * 2 + self.centerGap + self.lineWidth * 2,
                          self.triangleHeight + self.lineWidth * 2);
    };
}

@end
