//
//  JobsTodayNewsRefreshConfig.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsTodayNewsRefreshConfig.h"

@implementation JobsTodayNewsRefreshConfig
+(__kindof JobsTodayNewsRefreshConfig *)config {
    return JobsTodayNewsRefreshConfig.alloc.init;
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

-(JobsTodayNewsRefreshConfig *(^)(UIColor *))byStrokeColor {
    return ^JobsTodayNewsRefreshConfig *(UIColor *data) {
        self.strokeColor = data ?: RGB_COLOR(255, 75, 75);
        return self;
    };
}

-(JobsTodayNewsRefreshConfig *(^)(CGFloat))byLineWidth {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.lineWidth = isfinite(data) ? MAX(0.5, data) : 1.8;
        return self;
    };
}

-(JobsTodayNewsRefreshConfig *(^)(CGFloat))byTriangleWidth {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.triangleWidth = isfinite(data) ? MAX(4, data) : 15;
        return self;
    };
}

-(JobsTodayNewsRefreshConfig *(^)(CGFloat))byTriangleHeight {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.triangleHeight = isfinite(data) ? MAX(4, data) : 16;
        return self;
    };
}

-(JobsTodayNewsRefreshConfig *(^)(CGFloat))byCenterGap {
    return ^JobsTodayNewsRefreshConfig *(CGFloat data) {
        self.centerGap = isfinite(data) ? MAX(0, data) : 1;
        return self;
    };
}

-(JobsTodayNewsRefreshConfig *(^)(NSTimeInterval))byCycleDuration {
    return ^JobsTodayNewsRefreshConfig *(NSTimeInterval data) {
        self.cycleDuration = isfinite(data) ? MAX(0.3, data) : 0.65;
        return self;
    };
}

-(CGSize)indicatorSize {
    return CGSizeMake(self.triangleWidth * 2 + self.centerGap + self.lineWidth * 2,
                      self.triangleHeight + self.lineWidth * 2);
}

@end
