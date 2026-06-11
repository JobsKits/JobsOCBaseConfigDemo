//
//  UIBezierPath+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "UIBezierPath+DSL.h"

@implementation UIBezierPath (DSL)

#pragma mark —— Factory
+(JobsRetBezierPathByFrameBlock _Nonnull)byBezierPathWithRect{
    return ^__kindof UIBezierPath *_Nullable(CGRect data){
        return [UIBezierPath bezierPathWithRect:data];
    };
}

+(JobsRetBezierPathByFrameBlock _Nonnull)byBezierPathWithOvalInRect{
    return ^__kindof UIBezierPath *_Nullable(CGRect data){
        return [UIBezierPath bezierPathWithOvalInRect:data];
    };
}

+(JobsRetBezierPathByCGPathRefBlock _Nonnull)byBezierPathWithCGPath{
    return ^__kindof UIBezierPath *_Nullable(CGPathRef _Nullable data){
        return data ? [UIBezierPath bezierPathWithCGPath:data] : UIBezierPath.bezierPath;
    };
}

-(JobsRetBezierPathByCGPointBlock _Nonnull)byMoveToPoint{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGPoint data){
        @jobs_strongify(self)
        [self moveToPoint:data];
        return self;
    };
}

-(JobsRetBezierPathByCGPointBlock _Nonnull)byAddLineToPoint{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGPoint data){
        @jobs_strongify(self)
        [self addLineToPoint:data];
        return self;
    };
}

-(JobsRetBezierPathByAddArcBlock _Nonnull)byAddArcWithCenter{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise){
        @jobs_strongify(self)
        [self addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
        return self;
    };
}

-(JobsRetBezierPathByAddCurveBlock _Nonnull)byAddCurveToPoint{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGPoint endPoint, CGPoint controlPoint1, CGPoint controlPoint2){
        @jobs_strongify(self)
        [self addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        return self;
    };
}

-(JobsRetBezierPathByAddQuadCurveBlock _Nonnull)byAddQuadCurveToPoint{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGPoint endPoint, CGPoint controlPoint){
        @jobs_strongify(self)
        [self addQuadCurveToPoint:endPoint controlPoint:controlPoint];
        return self;
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)byClosePath{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(void){
        @jobs_strongify(self)
        [self closePath];
        return self;
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)byRemoveAllPoints{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(void){
        @jobs_strongify(self)
        [self removeAllPoints];
        return self;
    };
}

-(JobsRetBezierPathByBezierPathBlock _Nonnull)byAppendPath{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(__kindof UIBezierPath *_Nullable data){
        @jobs_strongify(self)
        if (data) [self appendPath:data];
        return self;
    };
}

-(JobsRetBezierPathByCGAffineTransformBlock _Nonnull)byApplyTransform{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGAffineTransform data){
        @jobs_strongify(self)
        [self applyTransform:data];
        return self;
    };
}

#pragma mark —— Short chain aliases
/* JobsOCDSL short chain aliases */
-(JobsRetBezierPathByCGPointBlock _Nonnull)moveTo{
    return self.byMoveToPoint;
}

-(JobsRetBezierPathByCGPointBlock _Nonnull)add{
    return self.byAddLineToPoint;
}

-(JobsRetBezierPathByVoidBlock _Nonnull)close{
    return self.byClosePath;
}

-(JobsRetBezierPathByVoidBlock _Nonnull)removeAll{
    return self.byRemoveAllPoints;
}

-(JobsRetBezierPathByBezierPathBlock _Nonnull)append{
    return self.byAppendPath;
}

-(JobsRetBezierPathByCGAffineTransformBlock _Nonnull)apply{
    return self.byApplyTransform;
}

-(JobsRetBezierPathByVoidBlock _Nonnull)byAddClip{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(void){
        @jobs_strongify(self)
        [self addClip];
        return self;
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)byFill{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(void){
        @jobs_strongify(self)
        [self fill];
        return self;
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)byStroke{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(void){
        @jobs_strongify(self)
        [self stroke];
        return self;
    };
}

-(JobsRetBezierPathByCGPathRefBlock _Nonnull)byCGPath{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGPathRef _Nullable data){
        @jobs_strongify(self)
        self.CGPath = data;
        return self;
    };
}

-(JobsRetBezierPathByCGFloatBlock _Nonnull)byLineWidth{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.lineWidth = data;
        return self;
    };
}

-(JobsRetBezierPathByCGLineCapBlock _Nonnull)byLineCapStyle{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGLineCap data){
        @jobs_strongify(self)
        self.lineCapStyle = data;
        return self;
    };
}

-(JobsRetBezierPathByCGLineJoinBlock _Nonnull)byLineJoinStyle{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGLineJoin data){
        @jobs_strongify(self)
        self.lineJoinStyle = data;
        return self;
    };
}

-(JobsRetBezierPathByCGFloatBlock _Nonnull)byMiterLimit{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.miterLimit = data;
        return self;
    };
}

-(JobsRetBezierPathByCGFloatBlock _Nonnull)byFlatness{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.flatness = data;
        return self;
    };
}

-(JobsRetBezierPathByBOOLBlock _Nonnull)byUsesEvenOddFillRule{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.usesEvenOddFillRule = data;
        return self;
    };
}

-(JobsRetBezierPathByLineDashBlock _Nonnull)byLineDash{
    @jobs_weakify(self)
    return ^__kindof UIBezierPath *_Nullable(NSArray<NSNumber *> *_Nullable pattern, CGFloat phase){
        @jobs_strongify(self)
        NSUInteger count = pattern.count;
        if (!count){
            [self setLineDash:NULL count:0 phase:phase];
            return self;
        }
        CGFloat *lengths = malloc(sizeof(CGFloat) * count);
        if (!lengths) return self;
        for (NSUInteger i = 0; i < count; i++){
            lengths[i] = pattern[i].doubleValue;
        }
        [self setLineDash:lengths count:count phase:phase];
        free(lengths);
        return self;
    };
}

-(JobsRetBOOLByCGPointBlock _Nonnull)byContainsPoint{
    @jobs_weakify(self)
    return ^BOOL(CGPoint data){
        @jobs_strongify(self)
        return [self containsPoint:data];
    };
}

@end
