//
//  NSString+CALayer.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+CALayer.h"

@implementation NSString (CALayer)
/// OC字符串的文本改变方向
/// @param aView 文本的控件
/// @param aRect 控件的尺寸
/// @param aFont 文字的字号
/// @param aColor 文字的颜色
/// @param directionStr  文字显示的方向
-(CAShapeLayer *_Nonnull)animateOnView:(__kindof UIView *_Nonnull)aView
                                atRect:(CGRect)aRect
                               forFont:(UIFont *)aFont
                             withColor:(UIColor *_Nonnull)aColor
                          andDirection:(JobsDirectionType)directionStr{
    /// 创建文字路径
    UIBezierPath *path = [UIBezierPath bezierPathWithText:self
                                                     font:aFont
                                         andWithDirection:directionStr];
    /// 创建路径图层
    return jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
        layer
            .byPath(path.CGPath)
            .byStrokeColor(aColor.CGColor)
            .byFillColor(aColor.CGColor)
            .byLineWidth(1.0f)
            .byLineJoin(kCALineJoinBevel)
            .byFrame(aRect)
            .byBounds(CGPathGetBoundingBox(path.CGPath))
            .byGeometryFlipped(NO);
        aView.layer.addSublayer(layer);
    });
}

@end
