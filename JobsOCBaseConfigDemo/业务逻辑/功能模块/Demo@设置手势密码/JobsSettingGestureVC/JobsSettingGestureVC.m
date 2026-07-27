//
//  JobsSettingGestureVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSettingGestureVC.h"

typedef NS_ENUM(NSUInteger, JobsSettingGestureFlowState) {
    JobsSettingGestureFlowStateCreateFirst,
    JobsSettingGestureFlowStateConfirmFirst,
    JobsSettingGestureFlowStateValidate
};

static NSString *const JobsSettingGestureStorageKey = @"JobsGestureLockDefaultKey";

@interface JobsSettingGestureVC ()

Prop_strong()UILabel *topLineLab;
Prop_strong()UISegmentedControl *modeControl;
Prop_strong()UILabel *hintLabel;
Prop_strong()JobsGestureLockView *demoLockView;
Prop_strong()UIButton *clearButton;
Prop_copy()NSString *demoFirstPattern;
Prop_assign()JobsSettingGestureFlowState flowState;

@end

@implementation JobsSettingGestureVC
- (instancetype)init{
    return [self initWithMode:JobsGestureLockModeCreate
                   storageKey:JobsSettingGestureStorageKey];
}

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(@"手势解锁".tr)
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byFont(UIFontWeightRegularSize(16));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.topLineLab.byAlpha(1);
    [self hideLegacyGestureSubviews];
    self.modeControl.byAlpha(1);
    self.hintLabel.byAlpha(1);
    self.demoLockView.byAlpha(1);
    self.clearButton.byAlpha(1);
    [self refreshStateFromStorage];
}
#pragma mark —— 一些公有方法
-(CGSize)getTopLineLabSize{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(2));
}
#pragma mark —— 手势流程
-(void)modeChanged:(UISegmentedControl *)sender{
    [self.demoLockView reset];
    self.demoFirstPattern = nil;
    if (sender.jobs_selectedSegmentIndex == 0) {
        self.flowState = JobsSettingGestureFlowStateCreateFirst;
        self.hintLabel.byText(@"绘制新手势（至少 4 个点）".tr);
        self.demoLockView.byHidden(NO);
        return;
    }
    self.flowState = JobsSettingGestureFlowStateValidate;
    if ([self hasStoredPattern]) {
        self.hintLabel.byText(@"请输入手势解锁".tr);
        self.demoLockView.byHidden(NO);
    } else {
        self.hintLabel.byText(@"还没设置手势，先去“设置/重置”".tr);
        self.demoLockView.byHidden(YES);
    }
}

-(void)gestureLockView:(JobsGestureLockView *)lockView didCompletePattern:(NSString *)pattern{
    if (pattern.length < lockView.configuration.minimumPatternLength) {
        [self showErrorAndClear:[NSString stringWithFormat:@"至少连接 %lu 个点".tr,
                                 (unsigned long)lockView.configuration.minimumPatternLength]];
        return;
    }
    switch (self.flowState) {
        /// 处理首次设置手势
        case JobsSettingGestureFlowStateCreateFirst:
            self.demoFirstPattern = pattern;
            self.flowState = JobsSettingGestureFlowStateConfirmFirst;
            [lockView showValidationResult:JobsGestureLockValidationResultSuccess];
            self.hintLabel.byText(@"请再绘制一次进行确认".tr);
            [self clearGestureTraceAfterDelay];
            break;
        /// 处理二次确认手势
        case JobsSettingGestureFlowStateConfirmFirst:
            if ([self.demoFirstPattern isEqualToString:pattern]) {
                [JobsGestureLockVC saveGesturePassword:pattern forKey:JobsSettingGestureStorageKey];
                [lockView showValidationResult:JobsGestureLockValidationResultSuccess];
                self.hintLabel.byText(@"设置成功 ✅ 现在可以用它解锁了".tr);
                self.flowState = JobsSettingGestureFlowStateValidate;
                self.modeControl.bySelectedSegmentIndex(1);
                [self clearGestureTraceAfterDelay];
            } else {
                self.demoFirstPattern = nil;
                self.flowState = JobsSettingGestureFlowStateCreateFirst;
                [self showErrorAndClear:@"两次不一致，请重新设置".tr];
            }
            break;
        /// 处理验证手势
        case JobsSettingGestureFlowStateValidate:
            if (![self hasStoredPattern]) {
                self.hintLabel.byText(@"还没设置手势，先去“设置/重置”".tr);
                [lockView reset];
                return;
            }
            if ([[JobsGestureLockVC gesturePasswordForKey:JobsSettingGestureStorageKey] isEqualToString:pattern]) {
                [lockView showValidationResult:JobsGestureLockValidationResultSuccess];
                self.hintLabel.byText(@"解锁成功 ✅".tr);
                [self clearGestureTraceAfterDelay];
            } else {
                [self showErrorAndClear:@"手势错误".tr];
            }
            break;
    }
}

-(void)didTapClearButton:(UIButton *)sender{
    [self.demoLockView reset];
    if (self.flowState == JobsSettingGestureFlowStateConfirmFirst) {
        self.demoFirstPattern = nil;
        self.flowState = JobsSettingGestureFlowStateCreateFirst;
        self.hintLabel.byText(@"请重新设置手势（至少 4 个点）".tr);
        return;
    }
    if ([self hasStoredPattern]) {
        self.flowState = JobsSettingGestureFlowStateValidate;
        self.hintLabel.byText(@"请输入手势解锁".tr);
    } else {
        self.flowState = JobsSettingGestureFlowStateCreateFirst;
        self.modeControl.bySelectedSegmentIndex(0);
        self.hintLabel.byText(@"请先设置手势（至少 4 个点）".tr);
    }
    self.demoLockView.byHidden(NO);
}

-(void)refreshStateFromStorage{
    self.demoFirstPattern = nil;
    self.demoLockView.byHidden(NO);
    [self.demoLockView reset];
    if ([self hasStoredPattern]) {
        self.flowState = JobsSettingGestureFlowStateValidate;
        self.modeControl.bySelectedSegmentIndex(1);
        self.hintLabel.byText(@"请输入手势解锁".tr);
    } else {
        self.flowState = JobsSettingGestureFlowStateCreateFirst;
        self.modeControl.bySelectedSegmentIndex(0);
        self.hintLabel.byText(@"请先设置手势（至少 4 个点）".tr);
    }
}

-(BOOL)hasStoredPattern{
    return [JobsGestureLockVC gesturePasswordForKey:JobsSettingGestureStorageKey].length > 0;
}

-(void)showErrorAndClear:(NSString *)text{
    [self.demoLockView showValidationResult:JobsGestureLockValidationResultFailure];
    self.hintLabel.byText(text);
    toastBy(text);
    [self clearGestureTraceAfterDelay];
}

-(void)clearGestureTraceAfterDelay{
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.65 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        [self.demoLockView reset];
    });
}
#pragma mark —— 私有方法
-(void)hideLegacyGestureSubviews{
    NSArray<NSString *> *legacyViewKeys = @[
        @"avatarView",
        @"nameLabel",
        @"indicatorView",
        @"statusLabel",
        @"lockView",
        @"otherAccountButton",
        @"resetButton",
        @"forgotButton"
    ];
    for (NSString *key in legacyViewKeys) {
        UIView *legacyView = [self valueForKey:key];
        legacyView.byHidden(YES);
    }
}

-(jobsByCGFloatBlock _Nonnull)makeNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        id<AppToolsProtocol> appToolsSelf = (id<AppToolsProtocol>)self;
        appToolsSelf.setGKNav(nil);
        appToolsSelf.setGKNavBackBtn(nil);
        if(self.leftBarButtonItems.count) self.byGKNavLeftBarButtonItems(self.leftBarButtonItems);
        if(self.rightBarButtonItems.count) self.byGKNavRightBarButtonItems(self.rightBarButtonItems);
        self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
            navigationBar
                .byHidden(!data)
                .byAlpha(data);
        });
    };
}
#pragma mark —— lazyLoad
-(UILabel *)topLineLab{
    if (!_topLineLab) {
        @jobs_weakify(self)
        _topLineLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byBgColor(HEXCOLOR(0xF8DA87))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.height.mas_equalTo(JobsWidth(2));
                });
        });
    };return _topLineLab;
}

-(UISegmentedControl *)modeControl{
    if (!_modeControl) {
        @jobs_weakify(self)
        _modeControl = jobsMakeSegmentedControl(@[@"设置/重置".tr, @"验证".tr], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(1)
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    [weak_self modeChanged:(UISegmentedControl *)control];
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.topLineLab.mas_bottom).offset(JobsWidth(10));
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.height.mas_equalTo(JobsWidth(34));
                });
        });
    };return _modeControl;
}

-(UILabel *)hintLabel{
    if (!_hintLabel) {
        _hintLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(15))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.modeControl.mas_bottom).offset(JobsWidth(14));
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                });
        });
    };return _hintLabel;
}

-(JobsGestureLockView *)demoLockView{
    if (!_demoLockView) {
        _demoLockView = [JobsGestureLockView.alloc initWithConfiguration:JobsGestureLockConfiguration.defaultConfiguration];
        _demoLockView.delegate = self;
        _demoLockView
            .byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.hintLabel.mas_bottom).offset(JobsWidth(16));
                make.left.right.equalTo(self.view).inset(JobsWidth(25));
                make.height.equalTo(self.demoLockView.mas_width);
            });
    };return _demoLockView;
}

-(UIButton *)clearButton{
    if (!_clearButton) {
        @jobs_weakify(self)
        _clearButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"清除/重来".tr)
                .jobsResetBtnTitleCor(JobsSystemBlueColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(16))
                .jobsResetBtnBgCor(JobsSystemGreenColor)
                .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                .onClickBy(^(__kindof UIButton * _Nullable sender) {
                    [weak_self didTapClearButton:sender];
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.demoLockView.mas_bottom).offset(JobsWidth(16));
                    make.centerX.equalTo(self.view);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(136), JobsWidth(44)));
                    make.bottom.lessThanOrEqualTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(12));
                });
        });
    };return _clearButton;
}

@end
