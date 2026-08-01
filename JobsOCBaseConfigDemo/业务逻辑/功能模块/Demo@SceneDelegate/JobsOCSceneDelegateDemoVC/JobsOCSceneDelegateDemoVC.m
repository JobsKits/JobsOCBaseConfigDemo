//
//  JobsOCSceneDelegateDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

#import "JobsOCSceneDelegateDemoVC.h"

@interface JobsOCSceneDelegateDemoVC ()

Prop_strong()NSUserActivity *restorationActivity;
Prop_weak()UIWindowScene *currentScene;
Prop_assign()NSInteger counter;
Prop_strong()UIScrollView *demoScrollView;
Prop_strong()UIStackView *contentStackView;
Prop_strong()UILabel *introLab;
Prop_strong()UILabel *supportLab;
Prop_strong()UILabel *sessionLab;
Prop_strong()UILabel *stateTipLab;
Prop_strong()UILabel *counterLab;
Prop_strong()UILabel *actionTipLab;
Prop_strong()UILabel *logLab;
Prop_strong()UIButton *incrementBtn;
Prop_strong()UIButton *newSceneBtn;
Prop_strong()UIButton *activateSceneBtn;
Prop_strong()UIButton *refreshBtn;
Prop_strong()UIButton *closeSceneBtn;

@end

@implementation JobsOCSceneDelegateDemoVC

-(instancetype)initWithRestorationActivity:(NSUserActivity *)restorationActivity{
    if (self = [super init]) {
        _restorationActivity = restorationActivity;
        _counter = [JobsOCSceneCoordinator restoredCounterFromActivity:restorationActivity];
    };return self;
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsSystemBackgroundColor);
    [self setupContent];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(sceneCoordinatorDidChange:)
                                               name:JobsOCSceneCoordinatorDidChangeNotification
                                             object:nil];
    [self updateCounterLab];
}

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"SceneDelegate 多场景".tr);
        })
        .byBgCor(JobsSystemBackgroundColor)
        .byNavBgCor(JobsSystemBackgroundColor);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self bindCurrentSceneIfNeeded];
    [self refreshSnapshotRequestSystemRefresh:NO];
}

-(NSUserActivity *)sceneRestorationActivity{
    if (!self.currentScene) return self.restorationActivity;
    return [JobsOCSceneCoordinator updateCounter:self.counter
                                        forScene:self.currentScene];
}

-(void)restoreSceneInteractionStateWithActivity:(NSUserActivity *)activity{
    if (![JobsOCSceneCoordinator isDemoActivity:activity]) return;
    self.counter = [JobsOCSceneCoordinator restoredCounterFromActivity:activity];
    if (self.isViewLoaded) {
        [self persistCounter];
        [self refreshSnapshotRequestSystemRefresh:NO];
    }
}

#pragma mark —— Setup
-(void)setupContent{
    NSArray <UIView *>*views = @[
        [self sectionTitleLab:@"进程与场景的职责边界"],
        self.introLab,
        [self sectionTitleLab:@"当前运行环境"],
        self.supportLab,
        self.sessionLab,
        [self sectionTitleLab:@"Scene 独立状态与恢复"],
        self.stateTipLab,
        self.counterLab,
        self.incrementBtn,
        [self sectionTitleLab:@"场景会话操作"],
        self.actionTipLab,
        self.newSceneBtn,
        self.activateSceneBtn,
        self.refreshBtn,
        self.closeSceneBtn,
        [self sectionTitleLab:@"当前 Scene 生命周期日志"],
        self.logLab
    ];
    for (UIView *view in views) {
        self.contentStackView.byAddArrangedSubview(view);
    }
    for (UIButton *button in @[
        self.incrementBtn,
        self.newSceneBtn,
        self.activateSceneBtn,
        self.refreshBtn,
        self.closeSceneBtn
    ]) {
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(44);
        }];
    }
    [self.logLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(180);
    }];
}

-(UILabel *)sectionTitleLab:(NSString *)text{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(text.tr)
            .byTextCor(JobsLabelColor)
            .byFont(UIFontWeightBoldSize(18))
            .byNumberOfLines(1);
    });
}

-(UILabel *)bodyLab:(NSString *)text{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(text.tr)
            .byTextCor(JobsSecondaryLabelColor)
            .byFont(UIFontWeightRegularSize(14))
            .byNumberOfLines(0);
    });
}

-(UILabel *)cardLab{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byTextCor(JobsLabelColor)
            .byFont([UIFont monospacedSystemFontOfSize:13
                                               weight:UIFontWeightRegular])
            .byNumberOfLines(0)
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(12)
            .byClipsToBounds(YES);
    });
}

-(UIButton *)buttonByTitle:(NSString *)title
                     color:(UIColor *)color
                    action:(jobsByBtnBlock)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(color)
            .jobsResetBtnCornerRadiusValue(10)
            .onClickBy(action);
    });
}

#pragma mark —— Scene State
-(void)bindCurrentSceneIfNeeded{
    UIWindowScene *scene = self.view.window.windowScene;
    if (!scene) return;
    self.currentScene = scene;
    self.counter = [JobsOCSceneCoordinator counterForSession:scene.session
                                                   fallback:self.counter];
    [self persistCounter];
}

-(void)incrementCounter{
    self.counter += 1;
    [self persistCounter];
    [self refreshSnapshotRequestSystemRefresh:NO];
}

-(void)persistCounter{
    if (!self.currentScene) {
        [self updateCounterLab];
        return;
    }
    [JobsOCSceneCoordinator updateCounter:self.counter
                                 forScene:self.currentScene];
    self.currentScene.title = [NSString stringWithFormat:@"Scene Demo · %@",
        [JobsOCSceneCoordinator shortIdentifierForSession:self.currentScene.session]];
    [self updateCounterLab];
}

-(void)updateCounterLab{
    self.counterLab.byText([NSString stringWithFormat:@"当前 Scene 计数：%ld",
        (long)self.counter]);
}

#pragma mark —— Scene Actions
-(void)requestNewScene{
    if (!UIApplication.sharedApplication.supportsMultipleScenes) {
        [self showMessageWithTitle:@"当前环境不支持多窗口"
                           message:@"工程已经声明多场景；请在支持多窗口的 iPad 环境中验证。"];
        return;
    }
    @jobs_weakify(self)
    [JobsOCSceneCoordinator requestNewDemoSceneFromSession:self.currentScene.session
                                                completion:^(NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (error) {
                [self showMessageWithTitle:@"新建 Scene 失败"
                                   message:error.localizedDescription];
            }
            [self refreshSnapshotRequestSystemRefresh:NO];
        });
    }];
}

-(void)activateOtherScene{
    UISceneSession *session = self.currentScene.session;
    UISceneSession *otherSession =
        [JobsOCSceneCoordinator otherOpenSessionExcludingSession:session];
    if (!otherSession) {
        [self showMessageWithTitle:@"没有其它 Scene"
                           message:@"请先新建一个 Scene 窗口。"];
        return;
    }
    @jobs_weakify(self)
    [JobsOCSceneCoordinator requestActivationForSession:otherSession
                                             completion:^(NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (error) {
                [self showMessageWithTitle:@"激活 Scene 失败"
                                   message:error.localizedDescription];
            }
            [self refreshSnapshotRequestSystemRefresh:NO];
        });
    }];
}

-(void)closeCurrentScene{
    UISceneSession *session = self.currentScene.session;
    if (!session) return;
    if (UIApplication.sharedApplication.openSessions.count <= 1) {
        [self showMessageWithTitle:@"保留最后一个 Scene"
                           message:@"请先新建另一个 Scene，再关闭当前 Scene。"];
        return;
    }
    @jobs_weakify(self)
    [JobsOCSceneCoordinator requestDestructionForSession:session
                                              completion:^(NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (error) {
                [self showMessageWithTitle:@"关闭 Scene 失败"
                                   message:error.localizedDescription];
            }
        });
    }];
}

-(void)refreshSnapshotRequestSystemRefresh:(BOOL)requestSystemRefresh{
    if (!self.isViewLoaded) return;
    UIApplication *application = UIApplication.sharedApplication;
    self.supportLab.byText([NSString stringWithFormat:
        @"supportsMultipleScenes：%@\nconnectedScenes：%ld\nopenSessions：%ld",
        application.supportsMultipleScenes ? @"YES" : @"NO",
        (long)application.connectedScenes.count,
        (long)application.openSessions.count]);
    UISceneSession *session = self.currentScene.session;
    if (!session) {
        self.sessionLab.byText(@"当前页面尚未绑定 UIWindowScene");
        [self updateButtons];
        return;
    }
    self.sessionLab.byText([NSString stringWithFormat:
        @"session：%@\nrole：%@\nactivationState：%@",
        [JobsOCSceneCoordinator shortIdentifierForSession:session],
        session.role,
        [JobsOCSceneCoordinator activationStateText:self.currentScene.activationState]]);
    if (requestSystemRefresh) {
        [application requestSceneSessionRefresh:session];
        [JobsOCSceneCoordinator recordEvent:@"请求系统刷新 SceneSession"
                                 forSession:session];
    }
    NSArray <NSString *>*events = [JobsOCSceneCoordinator eventsForSession:session];
    self.logLab.byText(events.count ?
        [events componentsJoinedByString:@"\n"] :
        @"等待 Scene 生命周期事件…".tr);
    [self updateButtons];
}

-(void)updateButtons{
    UIApplication *application = UIApplication.sharedApplication;
    UISceneSession *session = self.currentScene.session;
    self.newSceneBtn.byEnabled(application.supportsMultipleScenes);
    self.activateSceneBtn.byEnabled(
        session && [JobsOCSceneCoordinator otherOpenSessionExcludingSession:session]
    );
    self.closeSceneBtn.byEnabled(
        session && application.openSessions.count > 1
    );
    self.incrementBtn.byEnabled(session != nil);
    self.refreshBtn.byEnabled(session != nil);
}

-(void)sceneCoordinatorDidChange:(NSNotification *)notification{
    NSString *identifier =
        notification.userInfo[JobsOCSceneCoordinatorSessionIdentifierUserInfoKey];
    if (![identifier isEqualToString:self.currentScene.session.persistentIdentifier]) return;
    [self refreshSnapshotRequestSystemRefresh:NO];
}

-(void)showMessageWithTitle:(NSString *)title
                    message:(NSString *)message{
    UIAlertController *alert = [UIAlertController
        alertControllerWithTitle:title.tr
                         message:message.tr
                  preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了".tr
                                             style:UIAlertActionStyleDefault
                                           handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark —— LazyLoad
-(UIScrollView *)demoScrollView{
    if (!_demoScrollView) {
        @jobs_weakify(self)
        _demoScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byAlwaysBounceVertical(YES)
                .byShowsVerticalScrollIndicator(NO)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    };return _demoScrollView;
}

-(UIStackView *)contentStackView{
    if (!_contentStackView) {
        @jobs_weakify(self)
        _contentStackView = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
            stackView
                .byAxis(UILayoutConstraintAxisVertical)
                .byAlignment(UIStackViewAlignmentFill)
                .byDistribution(UIStackViewDistributionFill)
                .bySpacing(14)
                .addOn(self.demoScrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self.demoScrollView).inset(16);
                    make.width.equalTo(self.demoScrollView).offset(-32);
                });
        });
    };return _contentStackView;
}

-(UILabel *)introLab{
    if (!_introLab) {
        _introLab = [self bodyLab:
            @"AppDelegate 管进程级能力；每个窗口会话各有自己的 UIScene、SceneDelegate、UIWindow 和生命周期。"];
    };return _introLab;
}

-(UILabel *)supportLab{
    if (!_supportLab) {
        _supportLab = self.cardLab;
    };return _supportLab;
}

-(UILabel *)sessionLab{
    if (!_sessionLab) {
        _sessionLab = self.cardLab;
    };return _sessionLab;
}

-(UILabel *)stateTipLab{
    if (!_stateTipLab) {
        _stateTipLab = [self bodyLab:
            @"这个计数只属于当前 Scene。新建窗口从 0 开始；系统重连该会话时通过 NSUserActivity 恢复。"];
    };return _stateTipLab;
}

-(UILabel *)counterLab{
    if (!_counterLab) {
        _counterLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(JobsSystemBlueColor)
                .byFont([UIFont monospacedDigitSystemFontOfSize:28
                                                        weight:UIFontWeightBold])
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1);
        });
    };return _counterLab;
}

-(UILabel *)actionTipLab{
    if (!_actionTipLab) {
        _actionTipLab = [self bodyLab:
            @"多窗口能力由 Info.plist 声明和当前设备环境共同决定。iPad 最适合验证；不支持时按钮会禁用并说明原因。"];
    };return _actionTipLab;
}

-(UILabel *)logLab{
    if (!_logLab) {
        _logLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"等待 Scene 生命周期事件…".tr)
                .byTextCor(JobsSecondaryLabelColor)
                .byFont([UIFont monospacedSystemFontOfSize:12
                                                   weight:UIFontWeightRegular])
                .byNumberOfLines(0)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(12)
                .byClipsToBounds(YES);
        });
    };return _logLab;
}

-(UIButton *)incrementBtn{
    if (!_incrementBtn) {
        @jobs_weakify(self)
        _incrementBtn = [self buttonByTitle:@"当前 Scene +1"
                                      color:JobsSystemBlueColor
                                     action:^(__kindof UIButton * _Nullable sender) {
            @jobs_strongify(self)
            [self incrementCounter];
        }];
    };return _incrementBtn;
}

-(UIButton *)newSceneBtn{
    if (!_newSceneBtn) {
        @jobs_weakify(self)
        _newSceneBtn = [self buttonByTitle:@"新建 Scene 窗口"
                                     color:JobsSystemGreenColor
                                    action:^(__kindof UIButton * _Nullable sender) {
            @jobs_strongify(self)
            [self requestNewScene];
        }];
    };return _newSceneBtn;
}

-(UIButton *)activateSceneBtn{
    if (!_activateSceneBtn) {
        @jobs_weakify(self)
        _activateSceneBtn = [self buttonByTitle:@"激活另一个 Scene"
                                          color:JobsSystemOrangeColor
                                         action:^(__kindof UIButton * _Nullable sender) {
            @jobs_strongify(self)
            [self activateOtherScene];
        }];
    };return _activateSceneBtn;
}

-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        @jobs_weakify(self)
        _refreshBtn = [self buttonByTitle:@"刷新会话快照"
                                    color:JobsSystemGrayColor
                                   action:^(__kindof UIButton * _Nullable sender) {
            @jobs_strongify(self)
            [self refreshSnapshotRequestSystemRefresh:YES];
        }];
    };return _refreshBtn;
}

-(UIButton *)closeSceneBtn{
    if (!_closeSceneBtn) {
        @jobs_weakify(self)
        _closeSceneBtn = [self buttonByTitle:@"关闭当前 Scene"
                                       color:JobsSystemRedColor
                                      action:^(__kindof UIButton * _Nullable sender) {
            @jobs_strongify(self)
            [self closeCurrentScene];
        }];
    };return _closeSceneBtn;
}

@end
