//
//  XLBubbleTransition.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "XLBubbleTransition.h"

@interface XLBubbleTransition ()

Prop_strong()id<UIViewControllerContextTransitioning> transitionContext;
Prop_strong()CAShapeLayer *maskLayer;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN XLBubbleTransition
@interface XLBubbleTransition (JobsPropertyDSLSetterAutogen_b516a3b137)
-(void)setAnchorRect:(CGRect)data;
-(void)setMaskLayer:(CAShapeLayer * _Nullable)data;
-(void)setTransitionContext:(id<UIViewControllerContextTransitioning> _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END XLBubbleTransition

@implementation XLBubbleTransition
#pragma mark —— 初始化方法
+(JobsRetIDByFrameBlock _Nonnull)transitionWithAnchorRect{
    return ^id(CGRect anchorRect){
        XLBubbleTransition *transition = XLBubbleTransition.new;
        transition.byAnchorRect(anchorRect);
        return transition;
    };
}
#pragma mark —— 转场动画代理方法
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.35f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    if (self.transitionType == XLBubbleTransitionTypeShow) {
        self.showBubbleMaskAnimationTo(transitionContext);
        self.showScaleAnimationTo(transitionContext);
    }else if (self.transitionType == XLBubbleTransitionTypeHide){
        self.hideBubbleMaskAnimationTo(transitionContext);
        self.hideScaleAnimationTo(transitionContext);
    }
}
#pragma mark —— 显示/隐藏方法
//显示圆形放大动画
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)showBubbleMaskAnimationTo{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
        self.byTransitionContext(transitionContext);
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        UIView *contView = [transitionContext containerView];
        [contView addSubview:fromView];
        [contView addSubview:toView];
        // 创建一个 CAShapeLayer 来负责展示圆形遮盖
        CAShapeLayer *maskLayer = CAShapeLayer.layer;
        // toView.layer.mask = maskLayer;
        maskLayer.byBounds(fromView.layer.bounds);
        maskLayer.byPosition(fromView.layer.position);
        maskLayer.byFillColor(toView.backgroundColor.CGColor);
        [fromView.layer addSublayer:maskLayer];
        self.byMaskLayer(maskLayer);
        // 开始的圆环
        UIBezierPath *startPath =  [UIBezierPath bezierPathWithOvalInRect:self.anchorRect];
        // 结束圆环
        CGFloat radius = [self radiusOfBubbleInView:toView startPoint:CGPointMake(CGRectGetMidX(self.anchorRect), CGRectGetMidY(self.anchorRect))];
        UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.anchorRect,
                                                                                     - radius,
                                                                                     - radius)];
        // 圆形放大的动画
        // 将它的 path 指定为最终的 path 来避免在动画完成后会回弹
        maskLayer.byPath(finalPath.CGPath);
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.byFromValue((__bridge id)(startPath.CGPath));
        maskLayerAnimation.byToValue((__bridge id)((finalPath.CGPath)));
        maskLayerAnimation.byDuration([self transitionDuration:transitionContext]);
        maskLayerAnimation.byTimingFunction([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        maskLayerAnimation.byDelegate(self);
        [maskLayer addAnimation:maskLayerAnimation
                         forKey:@"path"];
    };
}
//显示---位置和缩放效果
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)showScaleAnimationTo{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        //位移动画
        toView.layer.position = CGPointMake(CGRectGetMidX(toView.bounds),
                                            CGRectGetMidY(toView.bounds));
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        positionAnimation.byFromValue([NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.anchorRect), CGRectGetMidY(self.anchorRect))]);
        positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(toView.bounds),
                                                                          CGRectGetMidY(toView.bounds))];
        positionAnimation.byDuration([self transitionDuration:transitionContext]);
        positionAnimation.byTimingFunction([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        [toView.layer addAnimation:positionAnimation forKey:@"position"];
        //缩放动画
        toView.byTransform(CGAffineTransformMakeScale(1, 1));
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.byFromValue(@(0));
        scaleAnimation.byToValue(@(1));
        scaleAnimation.byDuration([self transitionDuration:transitionContext]);
        scaleAnimation.byTimingFunction([CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        [toView.layer addAnimation:scaleAnimation forKey:@"scale"];
    };
}
//隐藏--圆形放大动画
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)hideBubbleMaskAnimationTo{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
        self.byTransitionContext(transitionContext);
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        UIView *contView = [transitionContext containerView];
        [contView addSubview:toView];
        [contView addSubview:fromView];
        //创建一个 CAShapeLayer 来负责展示圆形遮盖
        CAShapeLayer *maskLayer = CAShapeLayer.layer;
        maskLayer.byBounds(toView.layer.bounds);
        maskLayer.byPosition(toView.layer.position);
        maskLayer.byFillColor(fromView.backgroundColor.CGColor);
        //    fromView.layer.mask = maskLayer;
        [toView.layer addSublayer:maskLayer];
        self.byMaskLayer(maskLayer);
        //结束圆环
        CGFloat radius = [self radiusOfBubbleInView:toView
                                         startPoint:CGPointMake(CGRectGetMidX(self.anchorRect),
                                                                CGRectGetMidY(self.anchorRect))];
        //开始的圆环
        UIBezierPath *startPath =  [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.anchorRect,
                                                                                      - radius,
                                                                                      - radius)];
        UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:self.anchorRect];
        //放大动画
        //将它的 path 指定为最终的 path 来避免在动画完成后会回弹
        maskLayer.byPath(finalPath.CGPath);
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.byFromValue((__bridge id)(startPath.CGPath));
        maskLayerAnimation.byToValue((__bridge id)((finalPath.CGPath)));
        maskLayerAnimation.byDuration([self transitionDuration:transitionContext]);
        maskLayerAnimation.byTimingFunction([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        [maskLayer addAnimation:maskLayerAnimation
                         forKey:@"path"];
    };
}
//隐藏---位置和缩放效果
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)hideScaleAnimationTo{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        //位移动画
        fromView.layer.byPosition(CGPointMake(CGRectGetMidX(self.anchorRect), CGRectGetMidY(self.anchorRect)));
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        positionAnimation.byFromValue([NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(fromView.bounds), CGRectGetMidY(fromView.bounds))]);
        positionAnimation.byToValue([NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.anchorRect), CGRectGetMidY(self.anchorRect))]);
        positionAnimation.byDuration([self transitionDuration:transitionContext]);
        positionAnimation.byTimingFunction([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        positionAnimation.byDelegate(self);
        [fromView.layer addAnimation:positionAnimation forKey:@"position"];
        //缩放动画
        fromView.byTransform(CGAffineTransformMakeScale(0.0, 0.0));
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.byFromValue(@(1));
        scaleAnimation.byToValue(@(0));
        scaleAnimation.byDuration([self transitionDuration:transitionContext]);
        scaleAnimation.byTimingFunction([CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        [fromView.layer addAnimation:scaleAnimation forKey:@"scale"];
    };
}
/// 遍历view的四个角 获取最长的半径
-(CGFloat)radiusOfBubbleInView:(UIView*)view
                    startPoint:(CGPoint)startPoint{
    /// 获取四个角所在的点
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(view.bounds.size.width, 0);
    CGPoint point3 = CGPointMake(0 ,view.bounds.size.height);
    CGPoint point4 = CGPointMake(view.bounds.size.width,view.bounds.size.height);
    NSArray *pointArrar = @[[NSValue valueWithCGPoint:point1],
                            [NSValue valueWithCGPoint:point2],
                            [NSValue valueWithCGPoint:point3],
                            [NSValue valueWithCGPoint:point4]];
    /// 做一个冒泡排序获得最长的半径
    CGFloat radius = 0;
    for (NSValue *value in pointArrar) {
        CGPoint point = [value CGPointValue];
        CGFloat apartX = point.x - startPoint.x;
        CGFloat apartY = point.y - startPoint.y;
        CGFloat realRadius = sqrt(apartX*apartX + apartY*apartY);
        if (radius <= realRadius) {
            radius = realRadius;
        }
    };return radius;
}

- (void)animationDidStop:(CAAnimation *)anim
                finished:(BOOL)flag{
    /// 通知上下文 动画结束
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
    /// 移除遮罩layer
    [self.maskLayer removeFromSuperlayer];
    self.byMaskLayer(nil);
    _transitionContext = nil;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN XLBubbleTransition
-(JobsRetXLBubbleTransitionByCAShapeLayerBlock _Nonnull)byMaskLayer{
    @jobs_weakify(self)
    return ^__kindof XLBubbleTransition * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setMaskLayer:data];
        return self;
    };
}

-(JobsRetXLBubbleTransitionByCGRectBlock _Nonnull)byAnchorRect{
    @jobs_weakify(self)
    return ^__kindof XLBubbleTransition * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setAnchorRect:data];
        return self;
    };
}

-(JobsRetXLBubbleTransitionByIDUIViewControllerContextTransitioningBlock _Nonnull)byTransitionContext{
    @jobs_weakify(self)
    return ^__kindof XLBubbleTransition * _Nullable(id<UIViewControllerContextTransitioning> _Nullable data){
        @jobs_strongify(self)
        [self setTransitionContext:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END XLBubbleTransition
@end
