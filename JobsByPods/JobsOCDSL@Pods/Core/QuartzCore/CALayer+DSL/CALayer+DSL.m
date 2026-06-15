//
//  CALayer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月5日，星期五.
//

#import "CALayer+DSL.h"

@implementation CALayer (JobsChain)
-(JobsRetCALayerByCGRectBlock _Nonnull)byBounds{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.bounds = data;
        return self;
    };
}

-(JobsRetCALayerByCGRectBlock _Nonnull)byFrame{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.frame = data;
        return self;
    };
}

-(JobsRetCALayerByCGPointBlock _Nonnull)byPosition{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.position = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byZPosition{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.zPosition = data;
        return self;
    };
}

-(JobsRetCALayerByCGPointBlock _Nonnull)byAnchorPoint{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.anchorPoint = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byAnchorPointZ{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.anchorPointZ = data;
        return self;
    };
}

-(JobsRetCALayerByCATransform3DBlock _Nonnull)byTransform{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CATransform3D data){
        @jobs_strongify(self)
        self.transform = data;
        return self;
    };
}

-(JobsRetCALayerByCATransform3DBlock _Nonnull)bySublayerTransform{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CATransform3D data){
        @jobs_strongify(self)
        self.sublayerTransform = data;
        return self;
    };
}

/// 对 QuartzCore API addSublayer 的二次封装：附着在父图层上
-(JobsRetCALayerByCALayerBlock _Nonnull)addOn{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(__kindof CALayer *_Nullable superlayer){
        @jobs_strongify(self)
        if (superlayer) [superlayer addSublayer:self];
        return self;
    };
}

/// 对 QuartzCore API addSublayer 的二次封装：加入子图层
-(JobsRetCALayerByCALayerBlock _Nonnull)addBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(__kindof CALayer *_Nullable sublayer){
        @jobs_strongify(self)
        if (sublayer) [self addSublayer:sublayer];
        return self;
    };
}

-(JobsRetCALayerByCALayerBlock _Nonnull)byAddSublayer{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(__kindof CALayer *_Nullable data){
        @jobs_strongify(self)
        if (data) [self addSublayer:data];
        return self;
    };
}

-(JobsRetCALayerByArrBlock _Nonnull)bySublayers{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.sublayers = data;
        return self;
    };
}

-(JobsRetCALayerByCALayerBlock _Nonnull)byMask{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(__kindof CALayer *_Nullable data){
        @jobs_strongify(self)
        self.mask = data;
        return self;
    };
}

-(JobsRetCALayerByVoidBlock _Nonnull)byRemoveFromSuperlayer{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(void){
        @jobs_strongify(self)
        [self removeFromSuperlayer];
        return self;
    };
}

-(JobsRetCALayerByCGCorRefBlock _Nonnull)byBgColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetCALayerByCorBlock _Nonnull)byBgColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data.CGColor;
        return self;
    };
}

-(JobsRetCALayerByCGCorRefBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetCALayerByCorBlock _Nonnull)byBackgroundColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data.CGColor;
        return self;
    };
}

-(JobsRetCALayerByIDBlock _Nonnull)byContents{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.contents = data;
        return self;
    };
}

-(JobsRetCALayerByCGRectBlock _Nonnull)byContentsRect{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.contentsRect = data;
        return self;
    };
}

-(JobsRetCALayerByCALayerContentsGravityBlock _Nonnull)byContentsGravity{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayerContentsGravity data){
        @jobs_strongify(self)
        self.contentsGravity = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byContentsScale{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentsScale = data;
        return self;
    };
}

-(JobsRetCALayerByCGRectBlock _Nonnull)byContentsCenter{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.contentsCenter = data;
        return self;
    };
}

-(JobsRetCALayerByCALayerContentsFormatBlock _Nonnull)byContentsFormat{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayerContentsFormat data){
        @jobs_strongify(self)
        self.contentsFormat = data;
        return self;
    };
}

-(JobsRetCALayerByCALayerContentsFilterBlock _Nonnull)byMinificationFilter{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayerContentsFilter data){
        @jobs_strongify(self)
        self.minificationFilter = data;
        return self;
    };
}

-(JobsRetCALayerByCALayerContentsFilterBlock _Nonnull)byMagnificationFilter{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayerContentsFilter data){
        @jobs_strongify(self)
        self.magnificationFilter = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byMinificationFilterBias{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minificationFilterBias = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byNeedsDisplayOnBoundsChange{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.needsDisplayOnBoundsChange = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byDrawsAsynchronously{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.drawsAsynchronously = data;
        return self;
    };
}

-(JobsRetCALayerByVoidBlock _Nonnull)bySetNeedsDisplay{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(void){
        @jobs_strongify(self)
        [self setNeedsDisplay];
        return self;
    };
}

-(JobsRetCALayerByCGRectBlock _Nonnull)bySetNeedsDisplayInRect{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGRect data){
        @jobs_strongify(self)
        [self setNeedsDisplayInRect:data];
        return self;
    };
}

-(JobsRetCALayerByVoidBlock _Nonnull)byDisplayIfNeeded{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(void){
        @jobs_strongify(self)
        [self displayIfNeeded];
        return self;
    };
}

-(JobsRetCALayerByCGContextRefBlock _Nonnull)byDrawInContext{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGContextRef _Nullable data){
        @jobs_strongify(self)
        if (data) [self drawInContext:data];
        return self;
    };
}

-(JobsRetCALayerByCGContextRefBlock _Nonnull)byRenderInContext{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGContextRef _Nullable data){
        @jobs_strongify(self)
        if (data) [self renderInContext:data];
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.opacity = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byOpacity{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.opacity = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byHidden{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidden = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byDoubleSided{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.doubleSided = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byGeometryFlipped{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.geometryFlipped = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.cornerRadius = data;
        return self;
    };
}

-(JobsRetCALayerByCACornerMaskBlock _Nonnull)byMaskedCorners{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CACornerMask data){
        @jobs_strongify(self)
        self.maskedCorners = data;
        return self;
    };
}

-(JobsRetCALayerByCALayerCornerCurveBlock _Nonnull)byCornerCurve{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayerCornerCurve data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)){
                    self.cornerCurve = data;
                }
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetCALayerByCGCorRefBlock _Nonnull)byBorderColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.borderColor = data;
        return self;
    };
}

-(JobsRetCALayerByCorBlock _Nonnull)byBorderColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.borderColor = data.CGColor;
        return self;
    };
}

-(JobsRetCALayerByCGCorRefBlock _Nonnull)byShadowColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.shadowColor = data;
        return self;
    };
}

-(JobsRetCALayerByCorBlock _Nonnull)byShadowColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.shadowColor = data.CGColor;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byShadowOpacity{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.shadowOpacity = data;
        return self;
    };
}

-(JobsRetCALayerByCGSizeBlock _Nonnull)byShadowOffset{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.shadowOffset = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byShadowRadius{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.shadowRadius = data;
        return self;
    };
}

-(JobsRetCALayerByCGPathRefBlock _Nonnull)byShadowPath{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGPathRef _Nullable data){
        @jobs_strongify(self)
        self.shadowPath = data;
        return self;
    };
}

-(JobsRetCALayerByIDBlock _Nonnull)byCompositingFilter{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.compositingFilter = data;
        return self;
    };
}

-(JobsRetCALayerByArrBlock _Nonnull)byFilters{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.filters = data;
        return self;
    };
}

-(JobsRetCALayerByArrBlock _Nonnull)byBackgroundFilters{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.backgroundFilters = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byShouldRasterize{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.shouldRasterize = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byRasterizationScale{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rasterizationScale = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byAllowsGroupOpacity{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsGroupOpacity = data;
        return self;
    };
}

-(JobsRetCALayerByCAEdgeAntialiasingMaskBlock _Nonnull)byEdgeAntialiasingMask{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CAEdgeAntialiasingMask data){
        @jobs_strongify(self)
        self.edgeAntialiasingMask = data;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)byAllowsEdgeAntialiasing{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsEdgeAntialiasing = data;
        return self;
    };
}

-(JobsRetCALayerByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(id<CALayerDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetCALayerByNSDictionaryBlock _Nonnull)byActions{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.actions = data;
        return self;
    };
}

-(JobsRetCALayerByNSDictionaryBlock _Nonnull)byStyle{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.style = data;
        return self;
    };
}

-(JobsRetCALayerByStringBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(JobsRetCALayerByVoidBlock _Nonnull)bySetNeedsLayout{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(void){
        @jobs_strongify(self)
        [self setNeedsLayout];
        return self;
    };
}

-(JobsRetCALayerByVoidBlock _Nonnull)byLayoutIfNeeded{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(void){
        @jobs_strongify(self)
        [self layoutIfNeeded];
        return self;
    };
}

-(JobsRetCALayerByCAAnimationKeyBlock _Nonnull)byAddAnimation{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key){
        @jobs_strongify(self)
        if (animation) [self addAnimation:animation forKey:key];
        return self;
    };
}

-(JobsRetCALayerByStringBlock _Nonnull)byRemoveAnimationForKey{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (data) [self removeAnimationForKey:data];
        return self;
    };
}

-(JobsRetCALayerByVoidBlock _Nonnull)byRemoveAllAnimations{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(void){
        @jobs_strongify(self)
        [self removeAllAnimations];
        return self;
    };
}

-(JobsRetCAActionByStringBlock _Nonnull)byActionForKey{
    @jobs_weakify(self)
    return ^id<CAAction> _Nullable(NSString *_Nullable key){
        @jobs_strongify(self)
        return key ? [self actionForKey:key] : nil;
    };
}

-(JobsRetBOOLByPointBlock _Nonnull)byContainsPoint{
    @jobs_weakify(self)
    return ^BOOL(CGPoint data){
        @jobs_strongify(self)
        return [self containsPoint:data];
    };
}

@end
