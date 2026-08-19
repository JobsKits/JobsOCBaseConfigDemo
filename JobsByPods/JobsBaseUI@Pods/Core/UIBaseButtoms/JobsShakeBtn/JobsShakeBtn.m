//
//  JobsShakeBtn.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsShakeBtn.h"

#import <JobsMakes/JobsMakes.h>
#import <JobsBaseUI/UIView+Measure.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/NSMutableArray+Extra.h>
#import <JobsBaseUI/UIButton+UI.h>
#import <JobsBaseUI/NSObject+Extra.h>

@interface JobsShakeBtn ()
/// UI
Prop_strong()UIView *coverView; // 遮盖，在抖动时出现
Prop_strong()UITapGestureRecognizer *iconBtnTap;
Prop_strong()CAKeyframeAnimation *anim;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsShakeBtn
@interface JobsShakeBtn (JobsPropertyDSLSetterAutogen_295aecb30f)
-(void)setShaking:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsShakeBtn

@implementation JobsShakeBtn
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShakeBtn.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        // 调整位置
        self.imageView.byX(0);
        self.imageView.byY(0);
        self.imageView.byWidth(self.width);
        self.imageView.byHeight(self.width);
        self.titleLabel.byX(0);
        self.titleLabel.byWidth(self.width);
        if (self.width >= self.height) {
            self.titleLabel.byHeight(20);
            self.titleLabel.byY(self.height - self.titleLabel.height);
        } else {
            self.titleLabel.byY(self.imageView.height);
            self.titleLabel.byHeight(self.height - self.titleLabel.y);
        }
        self.titleLabel.byTextAlignment(NSTextAlignmentCenter);
        [self bringSubviewToFront:_iconBtn];
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.jobsResetBtnImage(JobsLoadBundleImage(@"bundle",@"Others",nil,@"加号.png"));
        self.addLongPressGestureRecognizer();
        self.iconBtn.byHidden(YES);
    };
}
#pragma mark —— 一些私有方法
/// 添加长按手势
- (jobsByVoidBlock _Nonnull)addLongPressGestureRecognizer {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byNumberOfTouchesRequired(1);
        self.byNumberOfTapsRequired(1);
        self.byMinimumPressDuration(0.1);
        self.byAllowableMovement(1);
        self.byUserInteractionEnabled(YES);
        self.byWeak_target(self);
        @jobs_weakify(self)
        self.longPressGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                                UITapGestureRecognizer *_Nullable arg) {
            @jobs_strongify(self)
            if (![self.imageView.image isEqual:JobsLoadBundleImage(nil,@"Others",nil,@"加号.png")]) {
                if (self.shaking) return nil;
                self.byShaking(YES);
            };return nil;
        });self.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
    };
}
/// 是否执行动画
- (void)setShaking:(BOOL)shaking {
    if (shaking) {
        [self.layer addAnimation:self.anim
                          forKey:@"shake"];
        self.coverView.byHidden(NO);
        self.iconBtn.byHidden(NO);
    } else {
        [self.layer removeAllAnimations];
        self.coverView.byHidden(YES);
        self.iconBtn.byHidden(YES);
    }
}
/// 点击右上角按钮
- (void)iconClick{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShakeBtn.class, @selector(jobsIconClick)))(self, @selector(jobsIconClick));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsIconClick{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if(self.objBlock)self.objBlock(self);
    };
}
#pragma mark —— lazyLoad
- (UIImageView *)iconBtn {
    if (!_iconBtn) {
        _iconBtn = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(@"del_Photo".img)
                .byAbleRespose(YES)
                .byUserInteractionEnabled(YES)
                .byAddGestureRecognizer(self.iconBtnTap)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(20,20));
                    make.top.equalTo(self).offset(-20 / 2);
                    make.right.equalTo(self).offset(20 / 2);
                });
        });
    };return _iconBtn;
}
/// 抖动动画
-(CAKeyframeAnimation *)anim{
    if (!_anim) {
    #define Angle2Radian(angle) ((angle) / 180.0 * M_PI)
        _anim = CAKeyframeAnimation.animation;
        _anim.byKeyPath(@"transform.rotation");
        _anim.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data
                .add(@(Angle2Radian(-5)))
                .add(@(Angle2Radian(5)))
                .add(@(Angle2Radian(-5)));
        });
        _anim.byDuration(0.25);
        // 动画次数设置为最大
        _anim.byRepeatCount(MAXFLOAT);
        // 保持动画执行完毕后的状态
        _anim.byRemovedOnCompletion(NO);
        _anim.byFillMode(kCAFillModeForwards);
    };return _anim;
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsClearColor)
                .byHidden(YES)
                .addOn(self)
                .byFrame(self.bounds);
        });
        {
            _coverView.byNumberOfTouchesRequired(1);
            _coverView.byNumberOfTapsRequired(1);
            _coverView.byMinimumPressDuration(0.1);
            _coverView.byAllowableMovement(1);
            _coverView.byUserInteractionEnabled(YES);
            _coverView.byWeak_target(self);
            @jobs_weakify(self)
            _coverView.tapGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                                    UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                self.byShaking(NO);
                return nil;
            });
            _coverView.tapGR.byEnabled(YES);
        }
    };return _coverView;
}

-(UITapGestureRecognizer *)iconBtnTap{
    if (!_iconBtnTap) {
        _iconBtnTap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(iconClick)];
    };return _iconBtnTap;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsShakeBtn
-(JobsRetJobsShakeBtnByBOOLBlock _Nonnull)byShaking{
    @jobs_weakify(self)
    return ^__kindof JobsShakeBtn * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShaking:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsShakeBtn
@end
