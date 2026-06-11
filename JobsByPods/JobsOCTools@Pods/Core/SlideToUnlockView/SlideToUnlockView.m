//
//  SlideToUnlockView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SlideToUnlockView.h"

@interface SlideToUnlockView ()

Prop_assign()CGFloat thumbInset;
Prop_assign()CGSize  thumbSize;
Prop_assign()CGFloat panStartProgress;   // < 手势开始时的进度备份
Prop_assign()CGFloat progress;           // < 0 ~ 1，映射滑块位置
Prop_strong()UIView *trackView;
Prop_strong()UILabel *titleLabel;
Prop_strong()UIImageView  *arrow;
Prop_strong()UIView *thumbView;
Prop_strong()MASConstraint *thumbLeadingConstraint;

@end

@implementation SlideToUnlockView
#pragma mark —— Init
-(instancetype)init{
    if(self = [super init]){
        [self commonInit];
    };return self;
}

-(void)commonInit{
    self.byBgColor(UIColor.clearColor);

    self.thumbInset = 4.f;
    self.thumbSize  = CGSizeMake(52.f, 52.f);
    self.progress   = 0.f;

    self.trackView.byVisible(YES);// 轨道
    self.titleLabel.byVisible(YES);// 中央文字
    self.thumbView.byVisible(YES);// 滑块
    self.arrow.byVisible(YES);// 箭头
}
#pragma mark —— Layout
-(void)layoutSubviews {
    [super layoutSubviews];
    self.byUpdateLayoutForProgress(NO);
}
#pragma mark —— 一些公有方法
/// State
-(void)setProgress:(CGFloat)progress {
    CGFloat v = MIN(MAX(progress, 0.f), 1.f);
    if (fabs(_progress - v) < FLT_EPSILON) { return; }
    _progress = v;
    self.byUpdateLayoutForProgress(NO);
}
/// DSL: byOnUnlock 点语法
-(SlideToUnlockView * _Nonnull (^)(jobsByVoidBlock _Nullable))byOnUnlock{
    @jobs_weakify(self)
    return ^SlideToUnlockView * (jobsByVoidBlock handler) {
        @jobs_strongify(self)
        self.onUnlock = handler;
        return self;
    };
}
#pragma mark —— 一些私有方法
/// 更新根据 progress 的布局
-(jobsByBOOLBlock _Nonnull)byUpdateLayoutForProgress{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (self.bounds.size.width <= 0) return;
        CGFloat maxOffset = self.bounds.size.width - self.thumbInset - self.thumbSize.width;
        CGFloat offset = self.thumbInset + maxOffset * self.progress;
        [self.thumbLeadingConstraint setOffset:offset];
        self.titleLabel.byAlpha(1.f - self.progress * 0.8f);

        if (animated) {
            [UIView animateWithDuration:0.2 animations:^{
                @jobs_strongify(self)
                [self layoutIfNeeded];
            }];
        }
    };
}

-(jobsByBOOLBlock _Nonnull)byResetAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        self.progress = 0.f;
        self.byUpdateLayoutForProgress(animated);
    };
}
#pragma mark —— Lazyload
-(UIView *)trackView{
    if (!_trackView) {
        @jobs_weakify(self)
        _trackView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.byBgColor(UIColor.systemGray5Color);
            view.layer.cornerRadius = 28.f;
            view.layer.masksToBounds = YES;
            view.byAddTo(self, ^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });

        });
    };return _trackView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        @jobs_weakify(self)
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"滑动以解锁".tr)
                .byTextCor(UIColor.darkGrayColor)
                .byFont([UIFont systemFontOfSize:16 weight:UIFontWeightMedium])
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 16, 0, 16));
                });
        });
    };return _titleLabel;
}

-(UIView *)thumbView{
    if (!_thumbView) {
        @jobs_weakify(self)
        _thumbView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(UIColor.whiteColor)
                .byUserInteractionEnabled(YES)
                .byLayer(^(CALayer *layer) {
                    layer
                        .byCornerRadius(self.thumbSize.height / 2.f)
                        .byMasksToBounds(YES)/// 和你 Swift 一样
                        .byShadowColor(UIColor.blackColor.CGColor)
                        .byShadowOpacity(0.15f)
                        .byShadowRadius(4.f)
                        .byShadowOffset(CGSizeMake(0, 2));
                })
                .addGesture([jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
                    /// 这里写手势的配置
                }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable pan) {
                    /// 这里写手势的触发
                    @jobs_strongify(self)
                    UIView *container = pan.view.superview;
                    if (!container) return;

                    CGPoint translation = [pan translationInView:container];
                    CGFloat dragWidth = MAX(container.bounds.size.width
                                            - self.thumbInset * 2.f
                                            - self.thumbSize.width,
                                            1.f);

                    switch (pan.state) {
                        case UIGestureRecognizerStateBegan: {
                            self.panStartProgress = self.progress;
                        } break;

                        case UIGestureRecognizerStateChanged: {
                            CGFloat delta = translation.x / dragWidth;
                            self.progress = self.panStartProgress + delta;
                            self.byLayoutIfNeeded();
                        } break;

                        case UIGestureRecognizerStateEnded:
                        case UIGestureRecognizerStateCancelled:
                        case UIGestureRecognizerStateFailed: {
                            if (self.progress > 0.85f) {
                                self.progress = 1.f;
                                self.byUpdateLayoutForProgress(YES);
                                if (self.onUnlock) self.onUnlock();
                                /// 如果希望可重复使用，稍后自动复位
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)),
                                               dispatch_get_main_queue(), ^{
                                    @jobs_strongify(self)
                                    if (self) self.byResetAnimated(YES);
                                });
                            } else {
                                self.byResetAnimated(YES);
                            }
                        } break;

                        default:
                            break;
                    }
                }])
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerY.equalTo(self);
                    make.size.mas_equalTo(self.thumbSize);
                    self.thumbLeadingConstraint = make.leading.equalTo(self).offset(self.thumbInset);
                });
        });
    };return _thumbView;
}

-(UIImageView *)arrow{
    if(!_arrow){
        @jobs_weakify(self)
        _arrow = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.tintColor = UIColor.systemBlueColor;
            imageView.image = [UIImage systemImageNamed:@"chevron.right" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:18 weight:UIImageSymbolWeightBold]];
            imageView.byAddTo(self.thumbView, ^(MASConstraintMaker *make) {
                make.center.equalTo(self.thumbView);
            });

        });
    };return _arrow;
}

@end
