//
//  JobsViewPushDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月22日，星期一.
//

#import "JobsViewPushDemoVC.h"

@interface JobsViewPushDemoPanel : UIView

Prop_copy(nullable)jobsByVoidBlock closeHandler;
Prop_strong()UILabel *titleLabel;
Prop_strong()BaseButton *closeButton;

-(JobsRetIDByVoidBlocks _Nonnull)byCloseHandler;

@end

@interface JobsViewPushDemoVC ()

Prop_strong()UISegmentedControl *directionControl;
Prop_strong()UILabel *ratioLabel;
Prop_strong()UISlider *ratioSlider;
Prop_strong()BaseButton *pushButton;

@end

@implementation JobsViewPushDemoVC
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsViewPushDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"JobsViewPush".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(UIColor.systemBackgroundColor)
            .byNavBgCor(UIColor.systemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsViewPushDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(UIColor.systemBackgroundColor);
        self.directionControl.byAlpha(1);
        self.ratioLabel.byAlpha(1);
        self.ratioSlider.byAlpha(1);
        self.pushButton.byAlpha(1);
    };
}

-(JobsRetJobsViewPushDirectionByVoidBlock _Nonnull)selectedDirection{
    @jobs_weakify(self)
    return ^JobsViewPushDirection{
        @jobs_strongify(self)
        if (!self) return (JobsViewPushDirection){0};
        switch (self.directionControl.jobs_selectedSegmentIndex()) {
            /// 处理 数值 0 分支
            case 0: return JobsViewPushDirectionTop;
            /// 处理 数值 1 分支
            case 1: return JobsViewPushDirectionBottom;
            /// 处理 数值 2 分支
            case 2: return JobsViewPushDirectionLeft;
            /// 未匹配已知分支时执行兜底处理
            default: return JobsViewPushDirectionRight;
        }
    };
}

-(jobsBySliderBlock _Nonnull)ratioChanged{
    @jobs_weakify(self)
    return ^(UISlider * slider){
        @jobs_strongify(self)
        if (!self) return;
        self.ratioLabel.byText([NSString stringWithFormat:@"覆盖比例：%.0f%%", slider.value * 100]);
    };
}

-(jobsByVoidBlock _Nonnull)pushDemoView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsViewPushDemoPanel *panel = JobsViewPushDemoPanel.new;
        JobsViewPushConfiguration *configuration = ((((JobsViewPushConfiguration *)JobsViewPushConfiguration.defaultConfiguration())).byDirection(self.selectedDirection())).byPresentedRatio(self.ratioSlider.value);
        [self.view jobsPushView:panel
                  configuration:configuration
                     completion:nil];
        @jobs_weakify(self)
        panel.byCloseHandler(^{
            @jobs_strongify(self)
            [self.view jobsDismissPushedViewAnimated:YES completion:nil];
        });
    };
}
#pragma mark —— lazyLoad
-(UISegmentedControl *)directionControl{
    if (!_directionControl) {
        _directionControl = jobsMakeSegmentedControl(@[@"上", @"下", @"左", @"右"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(3)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(36));
                });
        });
    };return _directionControl;
}

-(UILabel *)ratioLabel{
    if (!_ratioLabel) {
        _ratioLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"覆盖比例：65%".jobsTr())
                .byFont(UIFontWeightSemiboldSize(16))
                .byTextCor(UIColor.labelColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.directionControl.mas_bottom).offset(JobsWidth(28));
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                });
        });
    };return _ratioLabel;
}

-(UISlider *)ratioSlider{
    if (!_ratioSlider) {
        @jobs_weakify(self)
        _ratioSlider = jobsMakeSlider(^(__kindof UISlider * _Nullable slider) {
            @jobs_strongify(self)
            slider
                .byMinimumValue(0.25f)
                .byMaximumValue(1)
                .byValue(0.65f)
                .onJobsChange(^(__kindof UIControl * _Nullable ctrl) {
                    @jobs_strongify(self)
                    self.ratioChanged((UISlider *)ctrl);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.ratioLabel.mas_bottom).offset(JobsWidth(12));
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                });
        });
    };return _ratioSlider;
}

-(BaseButton *)pushButton{
    if (!_pushButton) {
        @jobs_weakify(self)
        _pushButton = BaseButton.jobsInit()
            .bgColorBy(UIColor.systemBlueColor)
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(18))
            .jobsResetBtnTitle(@"Push BView")
            .jobsResetBtnCornerRadiusValue(JobsWidth(12))
            .onClickBy(^(__kindof UIButton * _Nonnull sender) {
                @jobs_strongify(self)
                self.pushDemoView();
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.ratioSlider.mas_bottom).offset(JobsWidth(44));
                make.left.right.equalTo(self.view).inset(JobsWidth(24));
                make.height.mas_equalTo(JobsWidth(52));
            });
    };return _pushButton;
}

@end

@implementation JobsViewPushDemoPanel
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(UIColor.systemIndigoColor);
        self.titleLabel.byAlpha(1);
        self.closeButton.byAlpha(1);
    };return self;
}

-(JobsRetIDByVoidBlocks _Nonnull)byCloseHandler{
    @jobs_weakify(self)
    return ^id(jobsByVoidBlock closeHandler){
        @jobs_strongify(self)
        if (!self) return nil;
        self.closeHandler = closeHandler;
        return self;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"BView")
                .byFont(UIFontWeightBlackSize(32))
                .byTextCor(UIColor.whiteColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.center.equalTo(self);
                });
        });
    };return _titleLabel;
}

-(BaseButton *)closeButton{
    if (!_closeButton) {
        @jobs_weakify(self)
        _closeButton = BaseButton.jobsInit()
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
            .jobsResetBtnTitle(@"主动退出".jobsTr())
            .jobsResetBtnCornerRadiusValue(JobsWidth(10))
            .jobsResetBtnLayerBorderWidth(JobsWidth(1))
            .jobsResetBtnLayerBorderCor(UIColor.whiteColor)
            .onClickBy(^(__kindof UIButton * _Nonnull sender) {
                @jobs_strongify(self)
                if (self.closeHandler) self.closeHandler();
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLabel.mas_bottom).offset(JobsWidth(28));
                make.centerX.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(44)));
            });
    };return _closeButton;
}

@end
