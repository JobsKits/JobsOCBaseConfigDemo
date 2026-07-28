//
//  JobsOCTimerMgrDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCTimerMgrDemoVC.h"

static NSString *const JobsOCTimerMgrDemoPollingIdentifier = @"jobs.demo.timerMgr.polling";
static NSString *const JobsOCTimerMgrDemoVerifyIdentifier = @"jobs.demo.timerMgr.verifyCode";

@interface JobsOCTimerMgrDemoVC ()

Prop_strong()UILabel *pollingLab;
Prop_strong()UILabel *verifyLab;
Prop_strong()UILabel *statusLab;
Prop_strong()UITextView *tipsTextView;
Prop_strong()NSMutableArray <UIButton *>*btnMutArr;
Prop_strong()NSArray <NSString *>*btnTitleArr;

-(void)setupDemoTimers;
-(void)removeDemoTimers;
-(void)startDemoTimers;
-(void)updateStatusText:(NSString *)text;

@end

@implementation JobsOCTimerMgrDemoVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    [self removeDemoTimers];
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
            data.byText(@"JobsOCTimerMgr".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(JobsLabelColor);
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.pollingLab.byVisible(YES);
    self.verifyLab.byVisible(YES);
    self.statusLab.byVisible(YES);
    self.tipsTextView.byVisible(YES);
    for (UIButton *btn in self.btnMutArr) {
        btn.byVisible(YES);
    }
    [self setupDemoTimers];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeDemoTimers];
}
#pragma mark —— 一些私有方法
-(void)setupDemoTimers{
    [self removeDemoTimers];
    @jobs_weakify(self)
    JobsTimerMgr.shared
        .byUpsertTimer(JobsOCTimerMgrDemoPollingIdentifier,
                       JobsTimerTypeGCD,
                       JobsTimerBackgroundPolicyPauseAndResume,
                       NO,
                       ^(JobsTimer * _Nullable timer) {
            timer.byTimerStyle(TimerStyle_clockwise)
                .byStartTime(0)
                .byTimeInterval(1)
                .byQueue(dispatch_get_main_queue());
        },
                       nil)
        .byOnTick(JobsOCTimerMgrDemoPollingIdentifier, ^(CGFloat time) {
            @jobs_strongify(self)
            self.pollingLab.byText([NSString stringWithFormat:@"轮询 Timer：%.0f 秒".tr,time]);
        })
        .byUpsertTimer(JobsOCTimerMgrDemoVerifyIdentifier,
                       JobsTimerTypeGCD,
                       JobsTimerBackgroundPolicyCancel,
                       NO,
                       ^(JobsTimer * _Nullable timer) {
            timer.byTimerStyle(TimerStyle_anticlockwise)
                .byStartTime(12)
                .byTimeInterval(1)
                .byQueue(dispatch_get_main_queue());
        },
                       nil)
        .byOnTick(JobsOCTimerMgrDemoVerifyIdentifier, ^(CGFloat time) {
            @jobs_strongify(self)
            self.verifyLab.byText([NSString stringWithFormat:@"验证码 Timer：%.0f 秒后结束".tr,time]);
        })
        .byOnFinish(JobsOCTimerMgrDemoVerifyIdentifier, ^(__kindof JobsTimer * _Nullable timer) {
            @jobs_strongify(self)
            self.verifyLab.byText(@"验证码 Timer 已完成".tr);
            [self updateStatusText:@"JobsOCTimerMgr 收到 finish 回调".tr];
        });
    [self updateStatusText:@"已按 identifier 注册 2 个 Timer，等待启动".tr];
}

-(void)removeDemoTimers{
    [JobsTimerMgr.shared stopAndRemove:JobsOCTimerMgrDemoPollingIdentifier];
    [JobsTimerMgr.shared stopAndRemove:JobsOCTimerMgrDemoVerifyIdentifier];
}

-(void)startDemoTimers{
    if (![JobsTimerMgr.shared exists:JobsOCTimerMgrDemoPollingIdentifier] ||
        ![JobsTimerMgr.shared exists:JobsOCTimerMgrDemoVerifyIdentifier]) {
        [self setupDemoTimers];
    }
    JobsTimerMgr.shared
        .byStart(JobsOCTimerMgrDemoPollingIdentifier)
        .byStart(JobsOCTimerMgrDemoVerifyIdentifier);
    [self updateStatusText:@"两个 Timer 已由 JobsOCTimerMgr 统一启动".tr];
}

-(void)updateStatusText:(NSString *)text{
    self.statusLab.byText(text);
}
#pragma mark —— lazyLoad
-(UILabel *)pollingLab{
    if (!_pollingLab) {
        @jobs_weakify(self)
        _pollingLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"轮询 Timer：未启动".tr)
                .byFont(UIFontWeightMediumSize(18))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(20));
                    make.right.equalTo(self.view).offset(-JobsWidth(20));
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(18));
                    make.height.mas_equalTo(JobsWidth(54));
                });
        });
    };return _pollingLab;
}

-(UILabel *)verifyLab{
    if (!_verifyLab) {
        @jobs_weakify(self)
        _verifyLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"验证码 Timer：未启动".tr)
                .byFont(UIFontWeightMediumSize(18))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.height.equalTo(self.pollingLab);
                    make.top.equalTo(self.pollingLab.mas_bottom).offset(JobsWidth(10));
                });
        });
    };return _verifyLab;
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        @jobs_weakify(self)
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"已按 identifier 注册 2 个 Timer，等待启动".tr)
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(20));
                    make.right.equalTo(self.view).offset(-JobsWidth(20));
                    make.top.equalTo(self.verifyLab.mas_bottom).offset(JobsWidth(8));
                });
        });
    };return _statusLab;
}

-(UITextView *)tipsTextView{
    if (!_tipsTextView) {
        @jobs_weakify(self)
        _tipsTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.byText(@"这里演示 JobsOCTimerMgr 的核心用法：用 identifier 注册多个 JobsTimer，再由 Manager 统一 start / pause / resume / stopAndRemove。适合页面内有多个任务、跨组件要按名字控制 timer、或需要统一处理前后台策略的场景。".tr)
                .byTextColor(HEXCOLOR(0x5F6B7A))
                .byFont(UIFontWeightRegularSize(14))
                .byEditable(NO)
                .bySelectable(NO)
                .byTextContainerInset(UIEdgeInsetsMake(JobsWidth(12), JobsWidth(12), JobsWidth(12), JobsWidth(12)))
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(20));
                    make.right.equalTo(self.view).offset(-JobsWidth(20));
                    make.top.equalTo(self.statusLab.mas_bottom).offset(JobsWidth(10));
                    make.height.mas_equalTo(JobsWidth(96));
                });
        });
    };return _tipsTextView;
}

-(NSMutableArray<UIButton *> *)btnMutArr{
    if (!_btnMutArr) {
        @jobs_weakify(self)
        _btnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray<UIButton *> * _Nullable arr) {
            @jobs_strongify(self)
            UIButton *lastBtn = nil;
            for (NSUInteger idx = 0; idx < self.btnTitleArr.count; idx++) {
                UIButton *btn = UIButton.jobsInit()
                    .jobsResetBtnTitle(self.btnTitleArr[idx])
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightRegularSize(15))
                    .jobsResetBtnBgCor(HEXCOLOR(0xAE8330))
                    .jobsResetBtnCornerRadiusValue(JobsWidth(8))
                    .addOn(self.view)
                    .byAdd(^(MASConstraintMaker *make) {
                        make.left.equalTo(self.view).offset(JobsWidth(32));
                        make.right.equalTo(self.view).offset(-JobsWidth(32));
                        make.height.mas_equalTo(JobsWidth(38));
                        if (lastBtn) {
                            make.top.equalTo(lastBtn.mas_bottom).offset(JobsWidth(8));
                        }else{
                            make.top.equalTo(self.tipsTextView.mas_bottom).offset(JobsWidth(12));
                        }
                    });
                btn.tag = idx;
                btn.onClickBy(^(UIButton *data) {
                    @jobs_strongify(self)
                    if (data.tag == 0) {
                        [self startDemoTimers];
                    }else if (data.tag == 1){
                        JobsTimerMgr.shared.byPause(JobsOCTimerMgrDemoPollingIdentifier);
                        [self updateStatusText:@"轮询 Timer 已暂停，验证码 Timer 继续独立运行".tr];
                    }else if (data.tag == 2){
                        JobsTimerMgr.shared.byResume(JobsOCTimerMgrDemoPollingIdentifier);
                        [self updateStatusText:@"轮询 Timer 已恢复".tr];
                    }else if (data.tag == 3){
                        JobsTimerMgr.shared.byStopAndRemove(JobsOCTimerMgrDemoVerifyIdentifier);
                        self.verifyLab.byText(@"验证码 Timer 已移除".tr);
                        [self updateStatusText:@"已按 identifier 移除验证码 Timer".tr];
                    }else{
                        [self removeDemoTimers];
                        self.pollingLab.byText(@"轮询 Timer：已移除".tr);
                        self.verifyLab.byText(@"验证码 Timer：已移除".tr);
                        [self updateStatusText:@"已移除本页注册的全部 Timer".tr];
                    }
                });
                arr.add(btn);
                lastBtn = btn;
            }
        });
    };return _btnMutArr;
}

-(NSArray<NSString *> *)btnTitleArr{
    if (!_btnTitleArr) {
        _btnTitleArr = @[
            @"注册并启动".tr,
            @"暂停轮询".tr,
            @"恢复轮询".tr,
            @"移除验证码".tr,
            @"移除本页全部".tr
        ];
    };return _btnTitleArr;
}

@end
