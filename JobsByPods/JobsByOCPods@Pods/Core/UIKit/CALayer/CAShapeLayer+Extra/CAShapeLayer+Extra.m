//
//  CAShapeLayer+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CAShapeLayer+Extra.h"

@implementation CAShapeLayer (Extra)
#pragma mark —— 迎合链式语法而做的封装
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)lineWidthBy{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLineWidth:data];
        return self;
    };
}

-(JobsRetCAShapeLayerByCorBlock _Nonnull)strokeColorBy{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setStrokeColor:data.CGColor];
        return self;
    };
}

-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)strokeColorByCGColorRef{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGColorRef data){
        @jobs_strongify(self)
        [self setStrokeColor:data];
        return self;
    };
}

-(JobsRetCAShapeLayerByBezierPathBlock _Nonnull)pathByBezierPath{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIBezierPath *_Nullable data){
        @jobs_strongify(self)
        [self setPath:data.CGPath];
        return self;
    };
}

-(JobsRetCAShapeLayerByCGPathRefBlock _Nonnull)pathByPathRef{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGPathRef data){
        @jobs_strongify(self)
        [self setPath:data];
        return self;
    };
}

-(JobsRetCAShapeLayerByCorBlock _Nonnull)fillColorBy{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setFillColor:data.CGColor];
        return self;
    };
}

-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)fillColorByGColorRef{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGColorRef data){
        @jobs_strongify(self)
        [self setFillColor:data];
        return self;
    };
}

@end
