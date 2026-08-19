//
//  JobsDouyinRefreshDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsDouyinRefreshDemoVC.h"

@interface JobsDouyinRefreshDemoVC ()

Prop_strong()UILabel *hintLab;
Prop_strong()UIView *animationCardView;
Prop_strong()JobsDouyinRefreshView *refreshView;
Prop_strong()UILabel *statusLab;
Prop_strong()UIButton *startBtn;
Prop_strong()UIButton *pauseBtn;
Prop_strong()UIButton *stopBtn;
Prop_strong()UIButton *simulateBtn;
Prop_assign()NSUInteger refreshGeneration;

-(UIButton *)makeControlButtonWithTitle:(NSString *)title
                                  color:(UIColor *)color
                                 action:(jobsByBtnBlock)action;
-(jobsByVoidBlock _Nonnull)beginSimulatedRefresh;

@end

@implementation JobsDouyinRefreshDemoVC
-(void)dealloc {
    _refreshView.byStop();
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"抖音双球刷新动画".jobsTr())
                    .byFont(UIFontWeightRegularSize(18))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF5F7FA))
            .byNavBgCor(HEXCOLOR(0xF5F7FA));
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.hintLab.byHidden(NO);
        self.animationCardView.byHidden(NO);
        self.refreshView.byHidden(NO);
        self.statusLab.byHidden(NO);
        self.startBtn.byHidden(NO);
        self.pauseBtn.byHidden(NO);
        self.stopBtn.byHidden(NO);
        self.simulateBtn.byHidden(NO);
    };
}

-(void)viewDidAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.beginSimulatedRefresh();
    };
}

-(void)viewDidDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshDemoVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
        self.refreshGeneration += 1;
        self.refreshView.byStop();
    };
}

#pragma mark —— Action
-(jobsByVoidBlock _Nonnull)startRefreshAnimation {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.refreshGeneration += 1;
        self.statusLab.byText(@"正在刷新…".jobsTr());
        self.refreshView.isAnimating ? self.refreshView.byResume() : self.refreshView.byStart();
    };
}

-(jobsByVoidBlock _Nonnull)pauseRefreshAnimation {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.refreshGeneration += 1;
        self.statusLab.byText(@"刷新已暂停".jobsTr());
        self.refreshView.byPause();
    };
}

-(jobsByVoidBlock _Nonnull)stopRefreshAnimation {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.refreshGeneration += 1;
        self.statusLab.byText(@"刷新已停止".jobsTr());
        self.refreshView.byStop();
    };
}

-(jobsByVoidBlock _Nonnull)beginSimulatedRefresh {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.refreshGeneration += 1;
        NSUInteger generation = self.refreshGeneration;
        self.statusLab.byText(@"正在刷新…".jobsTr());
        self.refreshView.byStart();
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (generation != self.refreshGeneration) return;
            self.statusLab.byText(@"刷新完成，点击按钮可再次演示".jobsTr());
            self.refreshView.byStop();
        });
    };
}

#pragma mark —— LazyLoad
-(UILabel *)hintLab {
    if (!_hintLab) {
        @jobs_weakify(self)
        _hintLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"红、绿双球交叉换位并错峰跳跃；组件可独立用于下拉刷新、加载态或空白页。".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(15))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(36));
                    make.left.right.equalTo(self.view).inset(JobsWidth(28));
                });
        });
    };return _hintLab;
}

-(UIView *)animationCardView {
    if (!_animationCardView) {
        @jobs_weakify(self)
        _animationCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(24))
                        .byShadowColor(HEXCOLOR(0x111827).CGColor)
                        .byShadowOpacity(0.10)
                        .byShadowRadius(JobsWidth(18))
                        .byShadowOffset(CGSizeMake(0, JobsWidth(10)))
                        .byMasksToBounds(NO);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.hintLab.mas_bottom).offset(JobsWidth(36));
                    make.centerX.equalTo(self.view);
                    make.width.mas_equalTo(JobsWidth(240));
                    make.height.mas_equalTo(JobsWidth(176));
                });
        });
    };return _animationCardView;
}

-(JobsDouyinRefreshView *)refreshView {
    if (!_refreshView) {
        JobsDouyinRefreshConfig *config = JobsDouyinRefreshConfig.config()
            .byDotDiameter(JobsWidth(18))
            .byHorizontalTravel(JobsWidth(32))
            .byJumpHeight(JobsWidth(11))
            .byCycleDuration(0.84);
        @jobs_weakify(self)
        _refreshView = [[JobsDouyinRefreshView alloc] initWithConfig:config];
        _refreshView
            .addOn(self.animationCardView)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.center.equalTo(self.animationCardView);
            });
    };return _refreshView;
}

-(UILabel *)statusLab {
    if (!_statusLab) {
        @jobs_weakify(self)
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"正在刷新…".jobsTr())
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(14))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .addOn(self.animationCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.refreshView.mas_bottom).offset(JobsWidth(22));
                    make.left.right.equalTo(self.animationCardView).inset(JobsWidth(20));
                });
        });
    };return _statusLab;
}

-(UIButton *)startBtn {
    if (!_startBtn) {
        @jobs_weakify(self)
        _startBtn = [self makeControlButtonWithTitle:@"开始 / 继续"
                                              color:JobsGreenColor
                                             action:^(__kindof UIButton * _Nullable button) {
            weak_self.startRefreshAnimation();
        }];
        _startBtn
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.equalTo(self.animationCardView.mas_bottom).offset(JobsWidth(32));
                make.left.equalTo(self.view).offset(JobsWidth(28));
                make.height.mas_equalTo(JobsWidth(46));
            });
    };return _startBtn;
}

-(UIButton *)pauseBtn {
    if (!_pauseBtn) {
        @jobs_weakify(self)
        _pauseBtn = [self makeControlButtonWithTitle:@"暂停"
                                              color:JobsOrangeColor
                                             action:^(__kindof UIButton * _Nullable button) {
            weak_self.pauseRefreshAnimation();
        }];
        _pauseBtn
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.width.height.equalTo(self.startBtn);
                make.left.equalTo(self.startBtn.mas_right).offset(JobsWidth(12));
            });
    };return _pauseBtn;
}

-(UIButton *)stopBtn {
    if (!_stopBtn) {
        @jobs_weakify(self)
        _stopBtn = [self makeControlButtonWithTitle:@"停止"
                                             color:JobsRedColor
                                            action:^(__kindof UIButton * _Nullable button) {
            weak_self.stopRefreshAnimation();
        }];
        _stopBtn
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.width.height.equalTo(self.startBtn);
                make.left.equalTo(self.pauseBtn.mas_right).offset(JobsWidth(12));
                make.right.equalTo(self.view).offset(-JobsWidth(28));
                make.width.equalTo(self.pauseBtn);
            });
    };return _stopBtn;
}

-(UIButton *)simulateBtn {
    if (!_simulateBtn) {
        @jobs_weakify(self)
        _simulateBtn = [self makeControlButtonWithTitle:@"模拟一次 2 秒刷新"
                                                 color:JobsBlueColor
                                                action:^(__kindof UIButton * _Nullable button) {
            weak_self.beginSimulatedRefresh();
        }];
        _simulateBtn
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.equalTo(self.startBtn.mas_bottom).offset(JobsWidth(16));
                make.left.right.equalTo(self.view).inset(JobsWidth(28));
                make.height.mas_equalTo(JobsWidth(48));
            });
    };return _simulateBtn;
}

-(UIButton *)makeControlButtonWithTitle:(NSString *)title
                                  color:(UIColor *)color
                                 action:(jobsByBtnBlock)action {
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.jobsTr())
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
            .jobsResetBtnBgCor(color)
            .onClickBy(action)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(10))
                    .byMasksToBounds(YES);
            });
    });
}

@end
