//
//  GDFadeView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GDFadeView.h"

@interface GDFadeView ()

Prop_strong()UILabel *backLabel;
Prop_strong()UILabel *frontLabel;
Prop_strong()CAGradientLayer *cagradientLayer;

@end

@implementation GDFadeView
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GDFadeView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)setFrame:(CGRect)frame{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GDFadeView.class, @selector(jobsSetFrame)))(self, @selector(jobsSetFrame));
    if (action) action(frame);
}

-(jobsByFrameBlock _Nonnull)jobsSetFrame{
    @jobs_weakify(self)
    return ^(CGRect frame){
        @jobs_strongify(self)
        if (!self) return;
        [super setFrame:frame];
        self.backLabel.byAlpha(1);
        self.frontLabel.byAlpha(1);
        self.createMask();
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)createMask{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.cagradientLayer.byFrame(self.bounds);
        self.cagradientLayer.colors = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add((id)JobsClearColor.CGColor)
                .add((id)JobsRedColor.CGColor)
                .add((id)JobsClearColor.CGColor);
        });
        self.cagradientLayer.locations = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(@(0.25))
                .add(@(0.5))
                .add(@(0.75));
        });
        self.cagradientLayer.byStartPoint(CGPointZero);
        self.cagradientLayer.byEndPoint(CGPointMake(1, 0));
        self.frontLabel.layer.byMask(self.cagradientLayer);
        self.cagradientLayer.byPosition(CGPointMake(-self.bounds.size.width/4.0,self.bounds.size.height/2.0));
    };
}

-(JobsRetViewByTimeIntervalBlock _Nonnull)iPhoneFadeWithDuration{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSTimeInterval duration){
        @jobs_strongify(self)
        return self.frontLabel.byLayer(^(CALayer *layer) {
            layer.mask.byAddAnimation(jobsMakeCABasicAnimation(^(__kindof CABasicAnimation * _Nullable animation) {
                @jobs_strongify(self)
                animation
                    .byFromValue(@(0))
                    .byToValue(@(self.bounds.size.width + self.bounds.size.width / 2.0))
                    .byKeyPath(@"transform.translation.x")
                    .byDuration(duration)
                    .byRepeatCount(MAXFLOAT)
                    .byRemovedOnCompletion(NO)
                    .byFillMode(kCAFillModeForwards);
            }), nil);
        });
    };
}
#pragma mark —— Set方法
-(void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    _backLabel.byTextCor(backColor);
}

-(void)setForeColor:(UIColor *)foreColor{
    _foreColor = foreColor;
    _frontLabel.byTextCor(foreColor);
}

-(void)setFont:(UIFont *)font{
    _font = font;
    _backLabel.byFont(font);
    _frontLabel.byFont(font);
}

-(void)setAlignment:(NSTextAlignment)alignment{
    _alignment = alignment;
    _backLabel.byTextAlignment(alignment);
    _frontLabel.byTextAlignment(alignment);
}

-(void)setText:(NSString *)text{
    _text = text;
    _backLabel.byText(text);
    _frontLabel.byText(text);
}
#pragma mark —— lazyLoad
-(UILabel *)backLabel{
    if (!_backLabel) {
        @jobs_weakify(self)
        _backLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFrame(self.bounds)
                .addOn(self);
        });
    };return _backLabel;
}

-(UILabel *)frontLabel{
    if (!_frontLabel) {
        @jobs_weakify(self)
        _frontLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFrame(self.bounds)
                .addOn(self);
        });
    };return _frontLabel;
}

-(CAGradientLayer *)cagradientLayer{
    if (!_cagradientLayer) {
        _cagradientLayer = jobsMakeCAGradientLayer(^(__kindof CALayer * _Nullable layer) {
        });
    };return _cagradientLayer;
}

@end
