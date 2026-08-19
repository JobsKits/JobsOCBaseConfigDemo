//
//  UIView+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".jobsCor()).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable layerBorderCor) {
        @jobs_strongify(self)
        self.layer.byBorderColor(layerBorderCor.CGColor);
        return self;
    };
}
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".jobsCor()).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth) {
        @jobs_strongify(self)
        self.layer.byBorderWidth(borderWidth);
        return self;
    };
}
/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float cornerRadiusValue) {
        @jobs_strongify(self)
        self.layer.byCornerRadius(cornerRadiusValue);
        self.layer.byMasksToBounds(YES);
        return self;
    };
}
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
    self.layer.byMask(jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
        @jobs_strongify(self)
        data
            .byPath(maskPath.CGPath)
            .byFrame(self.bounds);
    }));
}

-(JobsRetViewByGestureRecognizer _Nonnull)addGesture{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIGestureRecognizer *_Nonnull gesture) {
        @jobs_strongify(self)
        if(gesture) self.addGestureRecognizer(gesture);
        return self;
    };
}

-(JobsRetGestureByGesture _Nonnull)addGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        if(gesture) [self addGestureRecognizer:gesture];
        return gesture;
    };
}
#pragma mark —— UI刷新（调用系统底层方法）
#pragma mark —— Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
JobsKey(_masonryBlock)
@dynamic masonryBlock;
-(void)setMasonryBlock:(jobsByMASConstraintMakerBlock)masonryBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_masonryBlock, masonryBlock)
}

@end
