//
//  UIView+Extra.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)

-(JobsRetViewByViewBlock _Nonnull)addSubview{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if(!subView) return nil;
        [self addSubview:subView];
        if(subView.masonryBlock){
            [subView mas_makeConstraints:subView.masonryBlock];
            self.refresh();
        }return subView;
    };
}

-(jobsByVoidBlock _Nonnull)refresh{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsLayout];
        [self layoutIfNeeded];
    };
}

/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable layerBorderCor) {
        @jobs_strongify(self)
        self.layer.borderColor = layerBorderCor.CGColor;
        return self;
    };
}

/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth) {
        @jobs_strongify(self)
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float cornerRadiusValue) {
        @jobs_strongify(self)
        self.layer.cornerRadius = cornerRadiusValue;
        self.layer.masksToBounds = YES;
        return self;
    };
}

/// 指定圆切角
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = CAShapeLayer.layer;
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

-(JobsRetViewByGestureRecognizer _Nonnull)addGesture{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIGestureRecognizer *_Nonnull gesture) {
        @jobs_strongify(self)
        if(gesture) self.addGestureRecognizer(gesture);
        return self;
    };
}

-(JobsReturnGestureByGesture _Nonnull)addGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        if(gesture) [self addGestureRecognizer:gesture];
        return gesture;
    };
}

#pragma mark —— Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
JobsKey(_masonryBlock)
@dynamic masonryBlock;
-(jobsByMASConstraintMakerBlock)masonryBlock{
    return Jobs_getAssociatedObject(_masonryBlock);
}

-(void)setMasonryBlock:(jobsByMASConstraintMakerBlock)masonryBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_masonryBlock, masonryBlock)
}

#pragma mark —— Prop_assign()CGFloat jobsVisible;
/// 需要特别注意的是：这个地方的jobsVisible不能属性化，否则在某些情况下会出现异常（只会走子类方法不会走分类方法）
JobsKey(_jobsVisible)
-(CGFloat)jobsVisible{
    BOOL JobsVisible = [Jobs_getAssociatedObject(_jobsVisible) floatValue];
    return JobsVisible;
}

-(void)setJobsVisible:(CGFloat)jobsVisible{
    self.hidden = !jobsVisible;
    self.alpha = jobsVisible;
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsVisible, @(jobsVisible))
}

@end
