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

-(instancetype)byCloseHandler:(nullable jobsByVoidBlock)closeHandler;

@end

@interface JobsViewPushDemoVC ()

Prop_strong()UISegmentedControl *directionControl;
Prop_strong()UILabel *ratioLabel;
Prop_strong()UISlider *ratioSlider;
Prop_strong()BaseButton *pushButton;

@end

@implementation JobsViewPushDemoVC

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"JobsViewPush".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(UIColor.systemBackgroundColor)
        .byNavBgCor(UIColor.systemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(UIColor.systemBackgroundColor);
    self.directionControl.byAlpha(1);
    self.ratioLabel.byAlpha(1);
    self.ratioSlider.byAlpha(1);
    self.pushButton.byAlpha(1);
}

-(JobsViewPushDirection)selectedDirection{
    switch (self.directionControl.selectedSegmentIndex) {
        case 0: return JobsViewPushDirectionTop;
        case 1: return JobsViewPushDirectionBottom;
        case 2: return JobsViewPushDirectionLeft;
        default: return JobsViewPushDirectionRight;
    }
}

-(void)ratioChanged:(UISlider *)slider{
    self.ratioLabel.byText([NSString stringWithFormat:@"覆盖比例：%.0f%%", slider.value * 100]);
}

-(void)pushDemoView{
    JobsViewPushDemoPanel *panel = JobsViewPushDemoPanel.new;
    JobsViewPushConfiguration *configuration = [[JobsViewPushConfiguration.defaultConfiguration
                                                 byDirection:self.selectedDirection]
                                                 byPresentedRatio:self.ratioSlider.value];
    [self.view jobsPushView:panel
              configuration:configuration
                 completion:nil];
    @jobs_weakify(self)
    [panel byCloseHandler:^{
        @jobs_strongify(self)
        [self.view jobsDismissPushedViewAnimated:YES completion:nil];
    }];
}
#pragma mark —— lazyLoad
-(UISegmentedControl *)directionControl{
    if (!_directionControl) {
        _directionControl = [[UISegmentedControl alloc] initWithItems:@[@"上", @"下", @"左", @"右"]];
        _directionControl.selectedSegmentIndex = 3;
        _directionControl.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
            make.left.right.equalTo(self.view).inset(JobsWidth(24));
            make.height.mas_equalTo(JobsWidth(36));
        });
    };return _directionControl;
}

-(UILabel *)ratioLabel{
    if (!_ratioLabel) {
        _ratioLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"覆盖比例：65%".tr)
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
                    [self ratioChanged:(UISlider *)ctrl];
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
                [self pushDemoView];
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

-(instancetype)byCloseHandler:(jobsByVoidBlock)closeHandler{
    self.closeHandler = closeHandler;
    return self;
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
            .jobsResetBtnTitle(@"主动退出".tr)
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
