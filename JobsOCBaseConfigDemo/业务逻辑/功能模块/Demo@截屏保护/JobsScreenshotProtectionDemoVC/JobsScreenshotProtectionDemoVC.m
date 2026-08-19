//
//  JobsScreenshotProtectionDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsScreenshotProtectionDemoVC.h"

@interface JobsScreenshotProtectionDemoVC ()

Prop_strong()JobsScreenshotProtectionView *protectionView;
Prop_strong()JobsScreenshotCapturer *screenshotCapturer;
Prop_strong()UIView *sensitiveCardView;
Prop_strong()UILabel *sensitiveTitleLab;
Prop_strong()UILabel *sensitiveValueLab;
Prop_strong()UILabel *protectionStateLab;
Prop_strong()UIButton *toggleProtectionBtn;
Prop_strong()UIButton *activeCaptureBtn;

-(jobsByVoidBlock _Nonnull)toggleProtection;
-(jobsByVoidBlock _Nonnull)refreshProtectionState;
-(jobsByVoidBlock _Nonnull)captureCurrentScreen;

@end

@implementation JobsScreenshotProtectionDemoVC

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScreenshotProtectionDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"禁止截屏 Demo".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScreenshotProtectionDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.protectionView.byHidden(NO);
        self.sensitiveCardView.byHidden(NO);
        self.sensitiveTitleLab.byHidden(NO);
        self.sensitiveValueLab.byHidden(NO);
        self.protectionStateLab.byHidden(NO);
        self.toggleProtectionBtn.byHidden(NO);
        self.activeCaptureBtn.byHidden(NO);
        self.refreshProtectionState();
    };
}

-(jobsByVoidBlock _Nonnull)toggleProtection{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.protectionView.byProtectionEnabled(!self.protectionView.isProtectionEnabled);
        self.refreshProtectionState();
    };
}

-(jobsByVoidBlock _Nonnull)refreshProtectionState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.protectionView.isProtectionAvailable) {
            self.protectionStateLab.byText(@"当前系统未识别到安全渲染容器，内容按普通视图显示。".jobsTr());
            self.toggleProtectionBtn
                .jobsResetBtnTitle(@"保护不可用".jobsTr())
                .byEnabled(NO);
            return;
        }
        if (self.protectionView.isProtectionEnabled) {
            self.protectionStateLab.byText(@"保护已开启：页面仍可见，但截图中敏感卡片应被系统隐藏。请用真机验证。".jobsTr());
            self.toggleProtectionBtn.jobsResetBtnTitle(@"临时关闭保护".jobsTr());
        }else{
            self.protectionStateLab.byText(@"保护已关闭：截图会包含敏感卡片，仅用于对比效果。".jobsTr());
            self.toggleProtectionBtn.jobsResetBtnTitle(@"重新开启保护".jobsTr());
        }
        if (self.toggleProtectionBtn) self.toggleProtectionBtn.byEnabled(YES);
    };
}

-(jobsByVoidBlock _Nonnull)captureCurrentScreen{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.screenshotCapturer captureAndSaveView:self.view.window ?: self.view
                                 afterScreenUpdates:YES
                                          completion:^(NSError *error) {
            if (error) {
                toastBy(error.localizedDescription);
            }else{
                toastBy(@"主动截屏已保存到相册，请打开相册对比敏感区域".jobsTr());
            }
        }];
    };
}
#pragma mark —— lazyLoad
-(JobsScreenshotCapturer *)screenshotCapturer{
    if (!_screenshotCapturer) {
        _screenshotCapturer = JobsScreenshotCapturer.new;
    };return _screenshotCapturer;
}

-(JobsScreenshotProtectionView *)protectionView{
    if (!_protectionView) {
        _protectionView = JobsScreenshotProtectionView.new;
        _protectionView.byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
                make.left.right.equalTo(self.view).inset(JobsWidth(20));
                make.height.mas_equalTo(JobsWidth(250));
            });
    };return _protectionView;
}

-(UIView *)sensitiveCardView{
    if (!_sensitiveCardView) {
        _sensitiveCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsSystemIndigoColor)
                .byCornerRadius(JobsWidth(22))
                .addOn(self.protectionView.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.protectionView.contentView);
                });
        });
    };return _sensitiveCardView;
}

-(UILabel *)sensitiveTitleLab{
    if (!_sensitiveTitleLab) {
        _sensitiveTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"敏感内容安全区".jobsTr())
                .byFont(UIFontWeightBoldSize(22))
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.sensitiveCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.sensitiveCardView).offset(JobsWidth(42));
                    make.left.right.equalTo(self.sensitiveCardView).inset(JobsWidth(18));
                });
        });
    };return _sensitiveTitleLab;
}

-(UILabel *)sensitiveValueLab{
    if (!_sensitiveValueLab) {
        _sensitiveValueLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"账号：Jobs\n授权码：2026-0721-DEMO".jobsTr())
                .byFont(UIFontMonospacedSystemWeightSemiboldSize(17))
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.sensitiveCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.sensitiveTitleLab.mas_bottom).offset(JobsWidth(28));
                    make.left.right.equalTo(self.sensitiveCardView).inset(JobsWidth(18));
                });
        });
    };return _sensitiveValueLab;
}

-(UILabel *)protectionStateLab{
    if (!_protectionStateLab) {
        _protectionStateLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byFont(UIFontWeightRegularSize(14))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.protectionView.mas_bottom).offset(JobsWidth(20));
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                });
        });
    };return _protectionStateLab;
}

-(UIButton *)toggleProtectionBtn{
    if (!_toggleProtectionBtn) {
        @jobs_weakify(self)
        _toggleProtectionBtn = UIButton.jobsInit();
        _toggleProtectionBtn
            .jobsResetBtnTitle(@"临时关闭保护".jobsTr())
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemBlueColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(10))
            .onClickBy(^(__unused UIButton *button) {
                @jobs_strongify(self)
                self.toggleProtection();
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.protectionStateLab.mas_bottom).offset(JobsWidth(16));
                make.centerX.equalTo(self.view);
                make.width.mas_equalTo(JobsWidth(180));
                make.height.mas_equalTo(JobsWidth(44));
            });
    };return _toggleProtectionBtn;
}

-(UIButton *)activeCaptureBtn{
    if (!_activeCaptureBtn) {
        @jobs_weakify(self)
        _activeCaptureBtn = UIButton.jobsInit();
        _activeCaptureBtn
            .jobsResetBtnTitle(@"点击截屏并保存到相册".jobsTr())
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemBlueColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(10))
            .onClickBy(^(__unused UIButton *button) {
                @jobs_strongify(self)
                self.captureCurrentScreen();
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.toggleProtectionBtn.mas_bottom).offset(JobsWidth(14));
                make.centerX.equalTo(self.view);
                make.width.mas_equalTo(JobsWidth(230));
                make.height.mas_equalTo(JobsWidth(44));
            });
    };return _activeCaptureBtn;
}

@end
