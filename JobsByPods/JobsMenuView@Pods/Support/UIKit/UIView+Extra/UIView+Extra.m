//
//  UIView+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/23.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii{
    // 设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    /// 得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    @jobs_weakify(self)
    self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
        @jobs_strongify(self)
        data.byFrame(self.bounds);
        data.path = maskPath.CGPath;
    });
}

@end
