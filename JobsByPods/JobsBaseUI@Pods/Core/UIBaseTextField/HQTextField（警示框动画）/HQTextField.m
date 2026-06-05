//
//  HQTextField.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "HQTextField.h"
#import <JobsBaseUI/CALayer+Extra.h>

@interface HQTextField ()

Prop_strong()CAShapeLayer *warnLayer;
Prop_strong()CABasicAnimation *opacityAnimation;

@end

@implementation HQTextField
#pragma mark -- 警示框
- (void)showWarn {
    self.layer.addSublayer(self.warnLayer);
    /// 2秒后(异步)移除动画
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(2.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        self.warnLayer.remove();
    });
}
#pragma mark -- 改变光标起始位置
// 控制placeHolder的位置，左右缩20，但是光标位置不变
/*
 - (CGRect)placeholderRectForBounds:(CGRect)bounds
 {
 CGRect inset = CGRectMake(bounds.origin.x+100, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
 return inset;
 }
 */
/// 修改文本展示区域，一般跟editingRectForBounds一起重写
- (CGRect)textRectForBounds:(CGRect)bounds{
    return jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.byJobsX(bounds.origin.x + JobsWidth(10))
            .byJobsY(bounds.origin.y)
            .byJobsWidth(bounds.size.width - JobsWidth(25))
            .byJobsHeight(bounds.size.height);
    });
}
/// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.byJobsX(bounds.origin.x + JobsWidth(10))
            .byJobsY(bounds.origin.y)
            .byJobsWidth(bounds.size.width - JobsWidth(25))
            .byJobsHeight(bounds.size.height);
    });;
}
#pragma mark —— lazyLoad
-(CAShapeLayer *)warnLayer{
    if (!_warnLayer) {
        @jobs_weakify(self)
        _warnLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer *_Nullable data) {
            @jobs_strongify(self)
            data.frame = self.bounds;// 大小和文本框一致
            data.path = [UIBezierPath bezierPathWithRoundedRect:self.warnLayer.bounds
                                                   cornerRadius:0].CGPath;// 画线 非圆角
            data.lineWidth = 6. / UIScreen.mainScreen.scale;// 线宽
            data.lineDashPattern = nil;// 设置为实线
            data.fillColor = JobsClearColor.CGColor;// 填充颜色透明色
            data.strokeColor = JobsRedColor.CGColor;// 边框颜色为红色
            [data addAnimation:self.opacityAnimation forKey:@"opacity"];
        });
    }return _warnLayer;
}

-(CABasicAnimation *)opacityAnimation{
    if (!_opacityAnimation) {
        _opacityAnimation = jobsMakeCABasicAnimationBy(@"opacity");
        _opacityAnimation.fromValue = @(1.0);
        _opacityAnimation.toValue = @(0.0f);
        _opacityAnimation.repeatCount = 5;
        _opacityAnimation.repeatDuration = 2;
        _opacityAnimation.autoreverses = YES;
    }return _opacityAnimation;
}

@end
