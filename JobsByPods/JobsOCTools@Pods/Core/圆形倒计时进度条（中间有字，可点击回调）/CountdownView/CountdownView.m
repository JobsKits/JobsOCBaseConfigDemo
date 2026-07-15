//
//  CountdownView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CountdownView.h"

@interface CountdownView ()

Prop_strong()CAShapeLayer *shapeLayer;
Prop_strong()CABasicAnimation *animation;

@end

@implementation CountdownView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.time = 3;// 倒计时的时间
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [self.layer addSublayer:self.shapeLayer];
    self.label.byAlpha(1);
    self.addGesture([jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
        ///  这里写手势的配置
    }) gestureActionBy:^{
        /// 这里写手势的触发
        if (self.blockTapAction) self.blockTapAction();
    }]);
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(self.time * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        if (self.blockAnimationFinishedAction) self.blockAnimationFinishedAction();
    });
}

-(void)setTime:(NSInteger)time{
    if (time) {
        _time = time;
    }else _time = 3;
}
#pragma mark —— SET 方法
-(void)setStr:(NSString *)str{
    self.label.byText(str ? : @"跳过".tr);
    [self.label sizeToFit];// 刷新视图，否则label.frame为0
}

-(void)setFont:(UIFont *)font{
    self.label.byFont(font ? : UIFontWeightRegularSize(JobsWidth(12)));
}

-(void)setTextColor:(UIColor *)textColor{
    self.label.byTextCor(textColor ? : RGBA_COLOR(0.27f * 255.0, 0.27f * 255.0, 0.27f * 255.0, 1.00f));
}
#pragma mark —— lazyLoad
-(CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        @jobs_weakify(self)
        _shapeLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
            @jobs_strongify(self)
            data.fillColor = JobsClearColor.CGColor;
            data.strokeColor = jobsMakeCor(^(__kindof JobsCorModel * _Nullable data) {
                data.byRed(0.02f)
                    .byGreen(0.69f)
                    .byBlue(1.00f)
                    .byAlpha(1.00f);
            }).CGColor;
            data.lineWidth = 1.0f;
            CGFloat w = CGRectGetWidth(self.frame);
            CGFloat h = CGRectGetHeight(self.frame);
            data.path = UIBezierPath.byBezierPathWithArcCenter(CGPointMake(w/2, h/2),
                                                               MIN(w, h)/2,
                                                               -M_PI_2,
                                                               3 * M_PI_2,
                                                               YES).CGPath;
            [data addAnimation:self.animation forKey:nil];
        });
    };return _shapeLayer;
}

-(CABasicAnimation *)animation{
    if (!_animation) {
        _animation = jobsMakeCABasicAnimationBy(@"strokeStart");
        _animation
            .byFromValue(@(0.f))
            .byToValue(@(1.f))
            .byDuration(self.time)
            .byRemovedOnCompletion(NO)
            .byFillMode(kCAFillModeBoth);
    };return _animation;
}
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.str)
                .byFont(self.font)
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(self.textColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
    };return _label;
}

@end
