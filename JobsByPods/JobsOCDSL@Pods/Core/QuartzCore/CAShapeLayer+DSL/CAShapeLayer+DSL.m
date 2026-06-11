//
//  CAShapeLayer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CAShapeLayer+DSL.h"

@implementation CAShapeLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
/// 对 QuartzCore API addSublayer 的二次封装：附着在父图层上
/// 对 QuartzCore API addSublayer 的二次封装：加入子图层
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CAShapeLayer
-(JobsRetCAShapeLayerByCGPathRefBlock _Nonnull)byPath{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGPathRef _Nullable data){
        @jobs_strongify(self)
        self.path = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGColorRefBlock _Nonnull)byStrokeColor{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.strokeColor = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByUIColorBlock _Nonnull)byStrokeColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.strokeColor = data.CGColor;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGColorRefBlock _Nonnull)byFillColor{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.fillColor = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByUIColorBlock _Nonnull)byFillColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.fillColor = data.CGColor;
        return self;
    };
}

-(JobsRetCAShapeLayerByFillRuleBlock _Nonnull)byFillRule{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CAShapeLayerFillRule data){
        @jobs_strongify(self)
        self.fillRule = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byLineWidth{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.lineWidth = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byStrokeStart{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.strokeStart = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byStrokeEnd{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.strokeEnd = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byMiterLimit{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.miterLimit = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByLineCapBlock _Nonnull)byLineCap{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CAShapeLayerLineCap data){
        @jobs_strongify(self)
        self.lineCap = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByLineJoinBlock _Nonnull)byLineJoin{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CAShapeLayerLineJoin data){
        @jobs_strongify(self)
        self.lineJoin = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byLineDashPhase{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.lineDashPhase = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByArrBlock _Nonnull)byLineDashPattern{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.lineDashPattern = data;
        return self;
    };
}

@end
