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
#pragma mark —— 警示框
- (jobsByVoidBlock _Nonnull)showWarn {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.layer.addSublayer(self.warnLayer);
        /// 2秒后(异步)移除动画
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                     (int64_t)(2.0 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.warnLayer.remove();
        });
    };
}
#pragma mark —— 改变光标起始位置
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
    JobsRetCGRectByCGRectBlock action = ((JobsRetCGRectByCGRectBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HQTextField.class, @selector(jobsTextRectForBounds)))(self, @selector(jobsTextRectForBounds));
    return action ? action(bounds) : (CGRect){0};
}

-(JobsRetCGRectByCGRectBlock _Nonnull)jobsTextRectForBounds{
    @jobs_weakify(self)
    return ^CGRect(CGRect bounds){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        return jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsX(bounds.origin.x + JobsWidth(10))
                .byJobsY(bounds.origin.y)
                .byJobsWidth(bounds.size.width - JobsWidth(25))
                .byJobsHeight(bounds.size.height);
        });
    };
}
/// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
- (CGRect)editingRectForBounds:(CGRect)bounds{
    JobsRetCGRectByCGRectBlock action = ((JobsRetCGRectByCGRectBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HQTextField.class, @selector(jobsEditingRectForBounds)))(self, @selector(jobsEditingRectForBounds));
    return action ? action(bounds) : (CGRect){0};
}

-(JobsRetCGRectByCGRectBlock _Nonnull)jobsEditingRectForBounds{
    @jobs_weakify(self)
    return ^CGRect(CGRect bounds){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        return jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsX(bounds.origin.x + JobsWidth(10))
                .byJobsY(bounds.origin.y)
                .byJobsWidth(bounds.size.width - JobsWidth(25))
                .byJobsHeight(bounds.size.height);
        });;
    };
}
#pragma mark —— lazyLoad
-(CAShapeLayer *)warnLayer{
    if (!_warnLayer) {
        @jobs_weakify(self)
        _warnLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer *_Nullable data) {
            @jobs_strongify(self)
            data.byPath(UIBezierPath.byBezierPathWithRoundedRect(self.warnLayer.bounds, 0).CGPath)
                .byLineWidth(6. / UIScreen.mainScreen.scale)
                .byLineDashPattern(nil)
                .byFillColor(JobsClearColor.CGColor)
                .byStrokeColor(JobsRedColor.CGColor)
                .byFrame(self.bounds);// 大小和文本框一致
            [data addAnimation:self.opacityAnimation forKey:@"opacity"];
        });
    };return _warnLayer;
}

-(CABasicAnimation *)opacityAnimation{
    if (!_opacityAnimation) {
        _opacityAnimation = jobsMakeCABasicAnimationBy(@"opacity");
        _opacityAnimation
            .byFromValue(@(1.0))
            .byToValue(@(0.0f))
            .byRepeatCount(5)
            .byRepeatDuration(2)
            .byAutoreverses(YES);
    };return _opacityAnimation;
}

@end
