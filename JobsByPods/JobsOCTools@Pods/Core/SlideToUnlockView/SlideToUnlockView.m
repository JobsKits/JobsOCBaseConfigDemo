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
Prop_assign()CGFloat progress;
-(JobsRetSlideToUnlockViewByCGFloatBlock _Nonnull)byProgress;
           // < 0 ~ 1，映射滑块位置
Prop_strong()UIView *trackView;
Prop_strong()UILabel *titleLabel;
Prop_strong()UIImageView  *arrow;
Prop_strong()UIView *thumbView;
Prop_strong()MASConstraint *thumbLeadingConstraint;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN SlideToUnlockView
@interface SlideToUnlockView (JobsPropertyDSLSetterAutogen_db15de5857)
-(void)setPanStartProgress:(CGFloat)data;
-(void)setThumbInset:(CGFloat)data;
-(void)setThumbLeadingConstraint:(MASConstraint * _Nullable)data;
-(void)setThumbSize:(CGSize)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END SlideToUnlockView

@implementation SlideToUnlockView
-(JobsRetSlideToUnlockViewByCGFloatBlock _Nonnull)byProgress{
    @jobs_weakify(self)
    return ^__kindof SlideToUnlockView *_Nullable(CGFloat progress){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setProgress:progress];
        return self;
    };
}

#pragma mark —— Init
-(instancetype)init{
    if(self = [super init]){
        self.commonInit();
    };return self;
}

-(jobsByVoidBlock _Nonnull)commonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byBgColor(UIColor.clearColor);
        self.byThumbInset(4.f);
        self.byThumbSize(CGSizeMake(52.f, 52.f));
        self.byProgress(0.f);
        self.trackView.byVisible(YES);// 轨道
        self.titleLabel.byVisible(YES);// 中央文字
        self.thumbView.byVisible(YES);// 滑块
        self.arrow.byVisible(YES);// 箭头
    };
}
#pragma mark —— Layout
-(void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(SlideToUnlockView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.byUpdateLayoutForProgress(NO);
    };
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
-(JobsRetSlideToUnlockViewByjobsByVoidBlockBlock _Nonnull)byOnUnlock{
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
        self.byProgress(0.f);
        self.byUpdateLayoutForProgress(animated);
    };
}
#pragma mark —— Lazyload
-(UIView *)trackView{
    if (!_trackView) {
        @jobs_weakify(self)
        _trackView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(UIColor.systemGray5Color)
                .byLayer(^(CALayer *layer) {
                    layer
                        .byCornerRadius(28.f)
                        .byMasksToBounds(YES);
                })
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
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
                .byText(@"滑动以解锁".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightMediumSize(16))
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
            .byBgColor(JobsSecondarySystemBackgroundColor)
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
                .addGesture((jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
                    /// 这里写手势的配置
                })).GestureActionBy(^(__kindof UIGestureRecognizer * _Nullable pan) {
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
                        /// 处理 UIGestureRecognizerStateBegan 分支
                        case UIGestureRecognizerStateBegan: {
                            self.byPanStartProgress(self.progress);
                        } break;
                        /// 处理 UIGestureRecognizerStateChanged 分支
                        case UIGestureRecognizerStateChanged: {
                            CGFloat delta = translation.x / dragWidth;
                            self.byProgress(self.panStartProgress + delta);
                            self.byLayoutIfNeeded();
                        } break;
                        /// 处理 UIGestureRecognizerStateEnded 分支
                        case UIGestureRecognizerStateEnded:
                        /// 处理 UIGestureRecognizerStateCancelled 分支
                        case UIGestureRecognizerStateCancelled:
                        /// 处理 UIGestureRecognizerStateFailed 分支
                        case UIGestureRecognizerStateFailed: {
                            if (self.progress > 0.85f) {
                                self.byProgress(1.f);
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
                        /// 未匹配已知分支时执行兜底处理
                        default:
                            break;
                    }
                }))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerY.equalTo(self);
                    make.size.mas_equalTo(self.thumbSize);
                    self.byThumbLeadingConstraint(make.leading.equalTo(self).offset(self.thumbInset));
                });
        });
    };return _thumbView;
}

-(UIImageView *)arrow{
    if(!_arrow){
        @jobs_weakify(self)
        _arrow = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage([@"chevron.right".sys_img imageWithConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:18 weight:UIImageSymbolWeightBold]])
                .byTintColor(UIColor.systemBlueColor)
                .addOn(self.thumbView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.center.equalTo(self.thumbView);
                });
        });
    };return _arrow;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN SlideToUnlockView
-(JobsRetSlideToUnlockViewByCGFloatBlock _Nonnull)byPanStartProgress{
    @jobs_weakify(self)
    return ^__kindof SlideToUnlockView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setPanStartProgress:data];
        return self;
    };
}

-(JobsRetSlideToUnlockViewByCGFloatBlock _Nonnull)byThumbInset{
    @jobs_weakify(self)
    return ^__kindof SlideToUnlockView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setThumbInset:data];
        return self;
    };
}

-(JobsRetSlideToUnlockViewByCGSizeBlock _Nonnull)byThumbSize{
    @jobs_weakify(self)
    return ^__kindof SlideToUnlockView * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setThumbSize:data];
        return self;
    };
}

-(JobsRetSlideToUnlockViewByMASConstraintBlock _Nonnull)byThumbLeadingConstraint{
    @jobs_weakify(self)
    return ^__kindof SlideToUnlockView * _Nullable(MASConstraint * _Nullable data){
        @jobs_strongify(self)
        [self setThumbLeadingConstraint:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END SlideToUnlockView
@end
