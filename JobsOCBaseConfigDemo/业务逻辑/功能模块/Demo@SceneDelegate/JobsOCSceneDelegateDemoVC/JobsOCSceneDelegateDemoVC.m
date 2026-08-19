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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSceneDelegateDemoVC
@interface JobsOCSceneDelegateDemoVC (JobsPropertyDSLSetterAutogen_14836d84ad)
-(void)setCounter:(NSInteger)data;
-(void)setCurrentScene:(UIWindowScene * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSceneDelegateDemoVC

@implementation JobsOCSceneDelegateDemoVC

-(instancetype)initWithRestorationActivity:(NSUserActivity *)restorationActivity{
    if (self = [super init]) {
        _restorationActivity = restorationActivity;
        _counter = JobsOCSceneCoordinator.restoredCounterFromActivity(restorationActivity);
    };return self;
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSceneDelegateDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.setupContent();
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(sceneCoordinatorDidChange:)
                                                   name:JobsOCSceneCoordinatorDidChangeNotification
                                                 object:nil];
        self.updateCounterLab();
    };
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSceneDelegateDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"SceneDelegate 多场景".jobsTr());
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSceneDelegateDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.bindCurrentSceneIfNeeded();
        self.refreshSnapshotRequestSystemRefresh(NO);
    };
}

-(JobsRetNSUserActivityByVoidBlock _Nonnull)sceneRestorationActivity{
    @jobs_weakify(self)
    return ^NSUserActivity *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (!self.currentScene) return self.restorationActivity;
        return [JobsOCSceneCoordinator updateCounter:self.counter
                                            forScene:self.currentScene];
    };
}

-(jobsByNSUserActivityBlock _Nonnull)restoreSceneInteractionStateWithActivity{
    @jobs_weakify(self)
    return ^(NSUserActivity * activity){
        @jobs_strongify(self)
        if (!self) return;
        if (!JobsOCSceneCoordinator.isDemoActivity(activity)) return;
        self.byCounter(JobsOCSceneCoordinator.restoredCounterFromActivity(activity));
        if (self.isViewLoaded) {
            self.persistCounter();
            self.refreshSnapshotRequestSystemRefresh(NO);
        }
    };
}

#pragma mark —— Setup
-(jobsByVoidBlock _Nonnull)setupContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray <UIView *>*views = @[
            self.sectionTitleLab(@"进程与场景的职责边界"),
            self.introLab,
            self.sectionTitleLab(@"当前运行环境"),
            self.supportLab,
            self.sessionLab,
            self.sectionTitleLab(@"Scene 独立状态与恢复"),
            self.stateTipLab,
            self.counterLab,
            self.incrementBtn,
            self.sectionTitleLab(@"场景会话操作"),
            self.actionTipLab,
            self.newSceneBtn,
            self.activateSceneBtn,
            self.refreshBtn,
            self.closeSceneBtn,
            self.sectionTitleLab(@"当前 Scene 生命周期日志"),
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
    };
}

-(JobsRetLabelByTextBlock _Nonnull)sectionTitleLab{
    @jobs_weakify(self)
    return ^UILabel *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(text.jobsTr())
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightBoldSize(18))
                .byNumberOfLines(1);
        });
    };
}

-(JobsRetLabelByTextBlock _Nonnull)bodyLab{
    @jobs_weakify(self)
    return ^UILabel *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(text.jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byNumberOfLines(0);
        });
    };
}

-(JobsRetLabelByVoidBlock _Nonnull)cardLab{
    @jobs_weakify(self)
    return ^UILabel *{
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

-(UIButton *)buttonByTitle:(NSString *)title
                     color:(UIColor *)color
                    action:(jobsByBtnBlock)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.jobsTr())
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(color)
            .jobsResetBtnCornerRadiusValue(10)
            .onClickBy(action);
    });
}

#pragma mark —— Scene State
-(jobsByVoidBlock _Nonnull)bindCurrentSceneIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIWindowScene *scene = self.view.window.windowScene;
        if (!scene) return;
        self.byCurrentScene(scene);
        self.counter = [JobsOCSceneCoordinator counterForSession:scene.session
                                                       fallback:self.counter];
        self.persistCounter();
    };
}

-(jobsByVoidBlock _Nonnull)incrementCounter{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.counter += 1;
        self.persistCounter();
        self.refreshSnapshotRequestSystemRefresh(NO);
    };
}

-(jobsByVoidBlock _Nonnull)persistCounter{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.currentScene) {
            self.updateCounterLab();
            return;
        }
        [JobsOCSceneCoordinator updateCounter:self.counter
                                     forScene:self.currentScene];
        self.currentScene.title = [NSString stringWithFormat:@"Scene Demo · %@",
            JobsOCSceneCoordinator.shortIdentifierForSession(self.currentScene.session)];
        self.updateCounterLab();
    };
}

-(jobsByVoidBlock _Nonnull)updateCounterLab{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.counterLab.byText([NSString stringWithFormat:@"当前 Scene 计数：%ld",
            (long)self.counter]);
    };
}

#pragma mark —— Scene Actions
-(jobsByVoidBlock _Nonnull)requestNewScene{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!UIApplication.sharedApplication.supportsMultipleScenes) {
            @"当前环境不支持多窗口，请在支持多窗口的 iPad 上验证".jobsTr().toast();
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
                self.refreshSnapshotRequestSystemRefresh(NO);
            });
        }];
    };
}

-(jobsByVoidBlock _Nonnull)activateOtherScene{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!UIApplication.sharedApplication.supportsMultipleScenes) {
            @"当前环境不支持多窗口，请在支持多窗口的 iPad 上验证".jobsTr().toast();
            return;
        }
        UISceneSession *session = self.currentScene.session;
        if (!session) {
            @"当前页面尚未绑定 Scene，暂时无法激活其它窗口".jobsTr().toast();
            return;
        }
        UISceneSession *otherSession =
            JobsOCSceneCoordinator.otherOpenSessionExcludingSession(session);
        if (!otherSession) {
            @"没有其它 Scene，请先新建一个 Scene 窗口".jobsTr().toast();
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
                self.refreshSnapshotRequestSystemRefresh(NO);
            });
        }];
    };
}

-(jobsByVoidBlock _Nonnull)closeCurrentScene{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!UIApplication.sharedApplication.supportsMultipleScenes) {
            @"当前环境不支持多窗口，无法关闭独立 Scene".jobsTr().toast();
            return;
        }
        UISceneSession *session = self.currentScene.session;
        if (!session) {
            @"当前页面尚未绑定 Scene，暂时无法关闭".jobsTr().toast();
            return;
        }
        if (UIApplication.sharedApplication.openSessions.count <= 1) {
            @"这是最后一个 Scene，请先新建另一个 Scene 再关闭".jobsTr().toast();
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
    };
}

-(jobsByBOOLBlock _Nonnull)refreshSnapshotRequestSystemRefresh{
    @jobs_weakify(self)
    return ^(BOOL requestSystemRefresh){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isViewLoaded) return;
        if (requestSystemRefresh && !self.currentScene) {
            @"当前页面尚未绑定 Scene，暂时无法刷新会话快照".jobsTr().toast();
            return;
        }
        UIApplication *application = UIApplication.sharedApplication;
        self.supportLab.byText([NSString stringWithFormat:
            @"supportsMultipleScenes：%@\nconnectedScenes：%ld\nopenSessions：%ld",
            application.supportsMultipleScenes ? @"YES" : @"NO",
            (long)application.connectedScenes.count,
            (long)application.openSessions.count]);
        UISceneSession *session = self.currentScene.session;
        if (!session) {
            self.sessionLab.byText(@"当前页面尚未绑定 UIWindowScene");
            self.updateButtons();
            return;
        }
        self.sessionLab.byText([NSString stringWithFormat:
            @"session：%@\nrole：%@\nactivationState：%@",
            JobsOCSceneCoordinator.shortIdentifierForSession(session),
            session.role,
            JobsOCSceneCoordinator.activationStateText(self.currentScene.activationState)]);
        if (requestSystemRefresh) {
            [application requestSceneSessionRefresh:session];
            [JobsOCSceneCoordinator recordEvent:@"请求系统刷新 SceneSession"
                                     forSession:session];
            @"会话快照已刷新".jobsTr().toast();
        }
        NSArray <NSString *>*events = JobsOCSceneCoordinator.eventsForSession(session);
        self.logLab.byText(events.count ?
            [events componentsJoinedByString:@"\n"] :
            @"等待 Scene 生命周期事件…".jobsTr());
        self.updateButtons();
    };
}

-(jobsByVoidBlock _Nonnull)updateButtons{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UISceneSession *session = self.currentScene.session;
        if (self.incrementBtn) self.incrementBtn.byEnabled(session != nil);
        if (self.newSceneBtn) self.newSceneBtn.byEnabled(YES);
        if (self.activateSceneBtn) self.activateSceneBtn.byEnabled(YES);
        if (self.refreshBtn) self.refreshBtn.byEnabled(YES);
        if (self.closeSceneBtn) self.closeSceneBtn.byEnabled(YES);
    };
}

-(void)sceneCoordinatorDidChange:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSceneDelegateDemoVC.class, @selector(jobsSceneCoordinatorDidChange)))(self, @selector(jobsSceneCoordinatorDidChange));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsSceneCoordinatorDidChange{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        NSString *identifier =
            notification.userInfo[JobsOCSceneCoordinatorSessionIdentifierUserInfoKey];
        if (![identifier isEqualToString:self.currentScene.session.persistentIdentifier]) return;
        self.refreshSnapshotRequestSystemRefresh(NO);
    };
}

-(void)showMessageWithTitle:(NSString *)title
                    message:(NSString *)message{
    UIAlertController *alert = [UIAlertController
        alertControllerWithTitle:title.jobsTr()
                         message:message.jobsTr()
                  preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了".jobsTr()
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
        _introLab = self.bodyLab(@"AppDelegate 管进程级能力；每个窗口会话各有自己的 UIScene、SceneDelegate、UIWindow 和生命周期。");
    };return _introLab;
}

-(UILabel *)supportLab{
    if (!_supportLab) {
        _supportLab = self.cardLab();
    };return _supportLab;
}

-(UILabel *)sessionLab{
    if (!_sessionLab) {
        _sessionLab = self.cardLab();
    };return _sessionLab;
}

-(UILabel *)stateTipLab{
    if (!_stateTipLab) {
        _stateTipLab = self.bodyLab(@"这个计数只属于当前 Scene。新建窗口从 0 开始；系统重连该会话时通过 NSUserActivity 恢复。");
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
        _actionTipLab = self.bodyLab(@"多窗口能力由 Info.plist 声明和当前设备环境共同决定。iPad 最适合验证；操作按钮始终可点，不支持时会通过 Toast 说明原因。");
    };return _actionTipLab;
}

-(UILabel *)logLab{
    if (!_logLab) {
        _logLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"等待 Scene 生命周期事件…".jobsTr())
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
            self.incrementCounter();
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
            self.requestNewScene();
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
            self.activateOtherScene();
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
            self.refreshSnapshotRequestSystemRefresh(YES);
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
            self.closeCurrentScene();
        }];
    };return _closeSceneBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSceneDelegateDemoVC
-(JobsRetJobsOCSceneDelegateDemoVCByNSIntegerBlock _Nonnull)byCounter{
    @jobs_weakify(self)
    return ^__kindof JobsOCSceneDelegateDemoVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCounter:data];
        return self;
    };
}

-(JobsRetJobsOCSceneDelegateDemoVCByUIWindowSceneBlock _Nonnull)byCurrentScene{
    @jobs_weakify(self)
    return ^__kindof JobsOCSceneDelegateDemoVC * _Nullable(UIWindowScene * _Nullable data){
        @jobs_strongify(self)
        [self setCurrentScene:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSceneDelegateDemoVC
@end
