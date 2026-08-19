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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsSettingGestureVC
@interface JobsSettingGestureVC (JobsPropertyDSLSetterAutogen_58e85fb682)
-(void)setDemoFirstPattern:(NSString * _Nullable)data;
-(void)setFlowState:(JobsSettingGestureFlowState)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsSettingGestureVC

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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSettingGestureVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"手势解锁".jobsTr())
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightRegularSize(16));
            })
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSettingGestureVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.topLineLab.byAlpha(1);
        self.hideLegacyGestureSubviews();
        self.modeControl.byAlpha(1);
        self.hintLabel.byAlpha(1);
        self.demoLockView.byAlpha(1);
        self.clearButton.byAlpha(1);
        self.refreshStateFromStorage();
    };
}
#pragma mark —— 一些公有方法
-(JobsRetCGSizeByVoidBlock _Nonnull)getTopLineLabSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(2));
    };
}
#pragma mark —— 手势流程
-(jobsBySegmentedControlBlock _Nonnull)modeChanged{
    @jobs_weakify(self)
    return ^(UISegmentedControl * sender){
        @jobs_strongify(self)
        if (!self) return;
        self.demoLockView.reset();
        self.byDemoFirstPattern(nil);
        if (sender.jobs_selectedSegmentIndex() == 0) {
            self.byFlowState(JobsSettingGestureFlowStateCreateFirst);
            self.hintLabel.byText(@"绘制新手势（至少 4 个点）".jobsTr());
            self.demoLockView.byHidden(NO);
            return;
        }
        self.byFlowState(JobsSettingGestureFlowStateValidate);
        if ([self hasStoredPattern]()) {
            self.hintLabel.byText(@"请输入手势解锁".jobsTr());
            self.demoLockView.byHidden(NO);
        } else {
            self.hintLabel.byText(@"还没设置手势，先去“设置/重置”".jobsTr());
            self.demoLockView.byHidden(YES);
        }
    };
}

-(void)gestureLockView:(JobsGestureLockView *)lockView didCompletePattern:(NSString *)pattern{
    if (pattern.length < lockView.configuration.minimumPatternLength) {
        self.showErrorAndClear([NSString stringWithFormat:@"至少连接 %lu 个点".jobsTr(),
                                 (unsigned long)lockView.configuration.minimumPatternLength]);
        return;
    }
    switch (self.flowState) {
        /// 处理首次设置手势
        case JobsSettingGestureFlowStateCreateFirst:
            self.byDemoFirstPattern(pattern);
            self.byFlowState(JobsSettingGestureFlowStateConfirmFirst);
            lockView.showValidationResult(JobsGestureLockValidationResultSuccess);
            self.hintLabel.byText(@"请再绘制一次进行确认".jobsTr());
            self.clearGestureTraceAfterDelay();
            break;
        /// 处理二次确认手势
        case JobsSettingGestureFlowStateConfirmFirst:
            if ([self.demoFirstPattern isEqualToString:pattern]) {
                [JobsGestureLockVC saveGesturePassword:pattern forKey:JobsSettingGestureStorageKey];
                lockView.showValidationResult(JobsGestureLockValidationResultSuccess);
                self.hintLabel.byText(@"设置成功 ✅ 现在可以用它解锁了".jobsTr());
                self.byFlowState(JobsSettingGestureFlowStateValidate);
                self.modeControl.bySelectedSegmentIndex(1);
                self.clearGestureTraceAfterDelay();
            } else {
                self.byDemoFirstPattern(nil);
                self.byFlowState(JobsSettingGestureFlowStateCreateFirst);
                self.showErrorAndClear(@"两次不一致，请重新设置".jobsTr());
            }
            break;
        /// 处理验证手势
        case JobsSettingGestureFlowStateValidate:
            if (![self hasStoredPattern]()) {
                self.hintLabel.byText(@"还没设置手势，先去“设置/重置”".jobsTr());
                lockView.reset();
                return;
            }
            if ([JobsGestureLockVC.gesturePasswordForKey(JobsSettingGestureStorageKey) isEqualToString:pattern]) {
                lockView.showValidationResult(JobsGestureLockValidationResultSuccess);
                self.hintLabel.byText(@"解锁成功 ✅".jobsTr());
                self.clearGestureTraceAfterDelay();
            } else {
                self.showErrorAndClear(@"手势错误".jobsTr());
            }
            break;
    }
}

-(jobsByBtnBlock _Nonnull)didTapClearButton{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        self.demoLockView.reset();
        if (self.flowState == JobsSettingGestureFlowStateConfirmFirst) {
            self.byDemoFirstPattern(nil);
            self.byFlowState(JobsSettingGestureFlowStateCreateFirst);
            self.hintLabel.byText(@"请重新设置手势（至少 4 个点）".jobsTr());
            return;
        }
        if ([self hasStoredPattern]()) {
            self.byFlowState(JobsSettingGestureFlowStateValidate);
            self.hintLabel.byText(@"请输入手势解锁".jobsTr());
        } else {
            self.byFlowState(JobsSettingGestureFlowStateCreateFirst);
            self.modeControl.bySelectedSegmentIndex(0);
            self.hintLabel.byText(@"请先设置手势（至少 4 个点）".jobsTr());
        }
        self.demoLockView.byHidden(NO);
    };
}

-(jobsByVoidBlock _Nonnull)refreshStateFromStorage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byDemoFirstPattern(nil);
        self.demoLockView.byHidden(NO);
        self.demoLockView.reset();
        if ([self hasStoredPattern]()) {
            self.byFlowState(JobsSettingGestureFlowStateValidate);
            self.modeControl.bySelectedSegmentIndex(1);
            self.hintLabel.byText(@"请输入手势解锁".jobsTr());
        } else {
            self.byFlowState(JobsSettingGestureFlowStateCreateFirst);
            self.modeControl.bySelectedSegmentIndex(0);
            self.hintLabel.byText(@"请先设置手势（至少 4 个点）".jobsTr());
        }
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)hasStoredPattern{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return JobsGestureLockVC.gesturePasswordForKey(JobsSettingGestureStorageKey).length > 0;
    };
}

-(jobsByStrBlock _Nonnull)showErrorAndClear{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        self.demoLockView.showValidationResult(JobsGestureLockValidationResultFailure);
        self.hintLabel.byText(text);
        toastBy(text);
        self.clearGestureTraceAfterDelay();
    };
}

-(jobsByVoidBlock _Nonnull)clearGestureTraceAfterDelay{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.65 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.demoLockView.reset();
        });
    };
}
#pragma mark —— 私有方法
-(jobsByVoidBlock _Nonnull)hideLegacyGestureSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
    };
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
        _modeControl = jobsMakeSegmentedControl(@[@"设置/重置".jobsTr(), @"验证".jobsTr()], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(1)
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    weak_self.modeChanged((UISegmentedControl *)control);
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
        _demoLockView = [JobsGestureLockView.alloc initWithConfiguration:JobsGestureLockConfiguration.defaultConfiguration()]
            .byDelegate(self)
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
                .jobsResetBtnTitle(@"清除/重来".jobsTr())
                .jobsResetBtnTitleCor(JobsSystemBlueColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(16))
                .jobsResetBtnBgCor(JobsSystemGreenColor)
                .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                .onClickBy(^(__kindof UIButton * _Nullable sender) {
                    weak_self.didTapClearButton(sender);
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsSettingGestureVC
-(JobsRetJobsSettingGestureVCByJobsSettingGestureFlowStateBlock _Nonnull)byFlowState{
    @jobs_weakify(self)
    return ^__kindof JobsSettingGestureVC * _Nullable(JobsSettingGestureFlowState data){
        @jobs_strongify(self)
        [self setFlowState:data];
        return self;
    };
}

-(JobsRetJobsSettingGestureVCByNSStringBlock _Nonnull)byDemoFirstPattern{
    @jobs_weakify(self)
    return ^__kindof JobsSettingGestureVC * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setDemoFirstPattern:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsSettingGestureVC
@end
