//
//  JobsScreenshotTipsDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsScreenshotTipsDemoVC.h"

@interface JobsScreenshotTipsDemoVC ()

Prop_strong()JobsScreenshotObserver *screenshotObserver;
Prop_strong()JobsScreenshotCapturer *screenshotCapturer;
Prop_assign()NSUInteger systemScreenshotCount;
Prop_assign()NSUInteger activeScreenshotCount;
Prop_strong()UIView *statusCardView;
Prop_strong()UILabel *statusIconLab;
Prop_strong()UILabel *statusTitleLab;
Prop_strong()UILabel *statusDetailLab;
Prop_strong()UILabel *guideLab;
Prop_strong()UIButton *activeCaptureBtn;

-(jobsByVoidBlock _Nonnull)handleScreenshot;
-(jobsByVoidBlock _Nonnull)captureCurrentScreen;
-(jobsByVoidBlock _Nonnull)refreshScreenshotCount;

@end

@implementation JobsScreenshotTipsDemoVC

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScreenshotTipsDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"截屏 Tips".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScreenshotTipsDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.statusCardView.byHidden(NO);
        self.statusIconLab.byHidden(NO);
        self.statusTitleLab.byHidden(NO);
        self.statusDetailLab.byHidden(NO);
        self.guideLab.byHidden(NO);
        self.activeCaptureBtn.byHidden(NO);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScreenshotTipsDemoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        @jobs_weakify(self)
        self.screenshotObserver.startWithHandler(^{
            @jobs_strongify(self)
            self.handleScreenshot();
        });
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScreenshotTipsDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        if (self.screenshotObserver) self.screenshotObserver.jobsStop();
    };
}

-(jobsByVoidBlock _Nonnull)handleScreenshot{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.systemScreenshotCount += 1;
        self.statusTitleLab.byText(@"已检测到截屏".jobsTr());
        self.refreshScreenshotCount();
        toastBy(@"截屏完成：Tips 已触发".jobsTr());
    };
}

-(jobsByVoidBlock _Nonnull)captureCurrentScreen{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        [self.screenshotCapturer captureAndSaveView:self.view.window ?: self.view
                                 afterScreenUpdates:YES
                                          completion:^(NSError *error) {
            @jobs_strongify(self)
            if (error) {
                self.statusTitleLab.byText(@"主动截屏失败".jobsTr());
                toastBy(error.localizedDescription);
            }else{
                self.activeScreenshotCount += 1;
                self.statusTitleLab.byText(@"已主动截屏并保存".jobsTr());
                self.refreshScreenshotCount();
                toastBy(@"主动截屏已保存到系统相册".jobsTr());
            }
        }];
    };
}

-(jobsByVoidBlock _Nonnull)refreshScreenshotCount{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.statusDetailLab.byText(([NSString stringWithFormat:@"系统截屏 %lu 次 · 按钮截屏 %lu 次",
                                     (unsigned long)self.systemScreenshotCount,
                                     (unsigned long)self.activeScreenshotCount]).jobsTr());
    };
}
#pragma mark —— lazyLoad
-(JobsScreenshotObserver *)screenshotObserver{
    if (!_screenshotObserver) {
        _screenshotObserver = JobsScreenshotObserver.new;
    };return _screenshotObserver;
}

-(JobsScreenshotCapturer *)screenshotCapturer{
    if (!_screenshotCapturer) {
        _screenshotCapturer = JobsScreenshotCapturer.new;
    };return _screenshotCapturer;
}

-(UIView *)statusCardView{
    if (!_statusCardView) {
        _statusCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(20))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(28));
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                });
        });
    };return _statusCardView;
}

-(UILabel *)statusIconLab{
    if (!_statusIconLab) {
        _statusIconLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"📸")
                .byFont(UIFontSystemFontOfSize(42))
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.statusCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.statusCardView).offset(JobsWidth(26));
                    make.centerX.equalTo(self.statusCardView);
                });
        });
    };return _statusIconLab;
}

-(UILabel *)statusTitleLab{
    if (!_statusTitleLab) {
        _statusTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"等待截屏操作".jobsTr())
                .byFont(UIFontWeightSemiboldSize(21))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.statusCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.statusIconLab.mas_bottom).offset(JobsWidth(14));
                    make.left.right.equalTo(self.statusCardView).inset(JobsWidth(18));
                });
        });
    };return _statusTitleLab;
}

-(UILabel *)statusDetailLab{
    if (!_statusDetailLab) {
        _statusDetailLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"系统截屏 0 次 · 按钮截屏 0 次".jobsTr())
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.statusCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.statusTitleLab.mas_bottom).offset(JobsWidth(8));
                    make.left.right.equalTo(self.statusCardView).inset(JobsWidth(18));
                    make.bottom.equalTo(self.statusCardView).inset(JobsWidth(26));
                });
        });
    };return _statusDetailLab;
}

-(UILabel *)guideLab{
    if (!_guideLab) {
        _guideLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"真机可同时按下侧边键与音量加键；也可以点击下方按钮主动截取当前页面并保存到相册。程序主动截屏不会触发系统截屏通知，因此这里分开计数。".jobsTr())
                .byFont(UIFontWeightRegularSize(14))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.statusCardView.mas_bottom).offset(JobsWidth(20));
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                });
        });
    };return _guideLab;
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
                make.top.equalTo(self.guideLab.mas_bottom).offset(JobsWidth(18));
                make.centerX.equalTo(self.view);
                make.width.mas_equalTo(JobsWidth(230));
                make.height.mas_equalTo(JobsWidth(44));
            });
    };return _activeCaptureBtn;
}

@end
