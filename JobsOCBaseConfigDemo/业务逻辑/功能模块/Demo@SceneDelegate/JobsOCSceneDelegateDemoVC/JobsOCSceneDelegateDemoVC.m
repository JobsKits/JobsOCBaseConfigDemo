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
Prop_strong()UILabel *guideLab;
Prop_strong()UILabel *supportLab;
Prop_strong()UILabel *sessionLab;
Prop_strong()UILabel *stateTipLab;
Prop_strong()UILabel *counterLab;
Prop_strong()UILabel *sceneOverviewLab;
Prop_strong()UILabel *actionTipLab;
Prop_strong()UILabel *actionResultLab;
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
        [self showActionResult:@"♻️ 系统已用 NSUserActivity 恢复这个窗口自己的印章数字。"
                         color:JobsSystemGreenColor];
    }
}

#pragma mark —— Setup
-(void)setupContent{
    NSArray <UIView *>*views = @[
        [self sectionTitleLab:@"先看结论"],
        self.introLab,
        self.guideLab,
        [self sectionTitleLab:@"当前窗口身份卡"],
        self.sessionLab,
        self.stateTipLab,
        self.counterLab,
        self.incrementBtn,
        [self sectionTitleLab:@"全部窗口对账板"],
        self.supportLab,
        self.sceneOverviewLab,
        [self sectionTitleLab:@"动手验证多窗口"],
        self.actionTipLab,
        self.actionResultLab,
        self.newSceneBtn,
        self.activateSceneBtn,
        self.refreshBtn,
        self.closeSceneBtn,
        [self sectionTitleLab:@"辅助证据：当前窗口生命周期日志"],
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
            make.height.mas_equalTo(50);
        }];
    }
    [self.sessionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(116);
    }];
    [self.sceneOverviewLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(100);
    }];
    [self.actionResultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(88);
    }];
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
    NSInteger previousCounter = self.counter;
    self.counter += 1;
    [self persistCounter];
    [self refreshSnapshotRequestSystemRefresh:NO];
    [self showActionResult:[NSString stringWithFormat:
        @"✅ 当前窗口 %@ 的独立印章从 %ld 变成 %ld。\n其它窗口的数字没有改变；去对账板直接核对。",
        [JobsOCSceneCoordinator shortIdentifierForSession:self.currentScene.session],
        (long)previousCounter,
        (long)self.counter]
                     color:[self colorForSession:self.currentScene.session]];
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
    UISceneSession *session = self.currentScene.session;
    NSString *identifier = session ?
        [JobsOCSceneCoordinator shortIdentifierForSession:session] :
        @"未绑定";
    self.counterLab
        .byText([NSString stringWithFormat:
            @"%@ 当前窗口 %@\n独立印章：%ld\n只改变这一扇窗口",
            session ? [self symbolForSession:session] : @"⚪️",
            identifier,
            (long)self.counter])
        .byTextCor(session ? [self colorForSession:session] : JobsSecondaryLabelColor);
}

#pragma mark —— Scene Actions
-(void)requestNewScene{
    if (!UIApplication.sharedApplication.supportsMultipleScenes) {
        [self showActionResult:@"⚠️ 当前设备环境不能展示第二个 App 窗口。请换到支持多窗口的 iPad 验证。"
                         color:JobsSystemOrangeColor];
        [self showMessageWithTitle:@"当前环境不支持多窗口"
                           message:@"工程已经声明多场景；请在支持多窗口的 iPad 环境中验证。"];
        return;
    }
    NSString *identifier =
        [JobsOCSceneCoordinator shortIdentifierForSession:self.currentScene.session];
    [self showActionResult:[NSString stringWithFormat:
        @"🚀 已向系统发出新建请求。\n系统会再创建一套 SceneDelegate + UIWindow，新窗口直接进入本页，独立印章从 0 开始；原窗口 %@ 保持不变。",
        identifier]
                     color:JobsSystemGreenColor];
    [JobsOCSceneCoordinator recordEvent:@"点击“新建独立窗口”"
                             forSession:self.currentScene.session];
    @jobs_weakify(self)
    [JobsOCSceneCoordinator requestNewDemoSceneFromSession:self.currentScene.session
                                                completion:^(NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (error) {
                [self showActionResult:[NSString stringWithFormat:
                    @"❌ 系统拒绝新建窗口：%@",error.localizedDescription]
                                 color:JobsSystemRedColor];
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
        [self showActionResult:@"👆 现在只有一个窗口。请先点“② 新建独立窗口”，再回来切换核对。"
                         color:JobsSystemOrangeColor];
        [self showMessageWithTitle:@"没有其它 Scene"
                           message:@"请先新建一个 Scene 窗口。"];
        return;
    }
    NSString *identifier =
        [JobsOCSceneCoordinator shortIdentifierForSession:otherSession];
    [self showActionResult:[NSString stringWithFormat:
        @"↗️ 已请求系统把窗口 %@ 切到前台。\n切过去后看它自己的颜色和印章数字，再切回来对比。",
        identifier]
                     color:[self colorForSession:otherSession]];
    [JobsOCSceneCoordinator recordEvent:[NSString stringWithFormat:
        @"点击“切换到窗口 %@”",identifier]
                             forSession:session];
    @jobs_weakify(self)
    [JobsOCSceneCoordinator requestActivationForSession:otherSession
                                             completion:^(NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (error) {
                [self showActionResult:[NSString stringWithFormat:
                    @"❌ 系统拒绝激活窗口 %@：%@",identifier,error.localizedDescription]
                                 color:JobsSystemRedColor];
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
        [self showActionResult:@"🛑 这是最后一个窗口，Demo 不会把整个 App 一起关掉。先新建第二个窗口再试。"
                         color:JobsSystemOrangeColor];
        [self showMessageWithTitle:@"保留最后一个 Scene"
                           message:@"请先新建另一个 Scene，再关闭当前 Scene。"];
        return;
    }
    NSString *identifier = [JobsOCSceneCoordinator shortIdentifierForSession:session];
    [self showActionResult:[NSString stringWithFormat:
        @"🗑 正在关闭当前窗口 %@。\n成功后这扇窗口会直接消失，其它窗口继续存在。",
        identifier]
                     color:JobsSystemRedColor];
    [JobsOCSceneCoordinator recordEvent:@"点击“关闭当前窗口”"
                             forSession:session];
    @jobs_weakify(self)
    [JobsOCSceneCoordinator requestDestructionForSession:session
                                              completion:^(NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (error) {
                [self showActionResult:[NSString stringWithFormat:
                    @"❌ 系统拒绝关闭窗口 %@：%@",identifier,error.localizedDescription]
                                 color:JobsSystemRedColor];
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
        @"%@ 多窗口能力：%@\n已连接窗口：%ld　系统保留会话：%ld",
        application.supportsMultipleScenes ? @"✅" : @"⚠️",
        application.supportsMultipleScenes ?
            @"已开启，可以创建独立窗口" :
            @"当前设备环境不支持，请换 iPad",
        (long)application.connectedScenes.count,
        (long)application.openSessions.count]);
    UISceneSession *session = self.currentScene.session;
    if (!session) {
        self.sessionLab.byText(@"当前页面尚未绑定 UIWindowScene");
        self.sceneOverviewLab.byText(@"等待窗口会话连接…".tr);
        [self updateButtons];
        return;
    }
    NSString *identifier = [JobsOCSceneCoordinator shortIdentifierForSession:session];
    self.sessionLab
        .byText([NSString stringWithFormat:
            @"\n%@ 你正在操作：窗口 %@\n状态：%@\n它拥有独立 SceneDelegate、UIWindow 和恢复数据\n",
            [self symbolForSession:session],
            identifier,
            [JobsOCSceneCoordinator activationStateText:self.currentScene.activationState]])
        .byTextCor(UIColor.whiteColor)
        .byBgColor([self colorForSession:session]);
    self.sceneOverviewLab.byText([self sceneOverviewText]);
    [self updateCounterLab];
    if (requestSystemRefresh) {
        [application requestSceneSessionRefresh:session];
        [JobsOCSceneCoordinator recordEvent:@"手动刷新窗口对账板与 SceneSession"
                                 forSession:session];
        [self showActionResult:[NSString stringWithFormat:
            @"🔎 对账板已刷新：当前共有 %ld 个窗口会话。\n上方每一行都是一个真实 UISceneSession，不是日志。",
            (long)application.openSessions.count]
                         color:JobsSystemBlueColor];
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
    UISceneSession *otherSession =
        session ? [JobsOCSceneCoordinator otherOpenSessionExcludingSession:session] : nil;
    NSString *currentIdentifier = session ?
        [JobsOCSceneCoordinator shortIdentifierForSession:session] :
        @"未绑定";
    NSString *otherIdentifier = otherSession ?
        [JobsOCSceneCoordinator shortIdentifierForSession:otherSession] :
        @"另一个窗口";
    self.incrementBtn
        .jobsResetBtnTitle(@"① 给当前窗口盖章 +1".tr)
        .byEnabled(session != nil)
        .byAlpha(session ? 1 : .45);
    self.newSceneBtn
        .jobsResetBtnTitle(application.supportsMultipleScenes ?
            @"② 新建独立窗口（从 0 开始）".tr :
            @"② 当前设备不支持多窗口（点我看原因）".tr)
        .byEnabled(YES)
        .byAlpha(1);
    self.activateSceneBtn
        .jobsResetBtnTitle([NSString stringWithFormat:@"③ 切换到 %@",otherIdentifier])
        .byEnabled(session != nil)
        .byAlpha(session ? 1 : .45);
    self.refreshBtn
        .jobsResetBtnTitle(@"立即刷新上方窗口对账板".tr)
        .byEnabled(session != nil)
        .byAlpha(session ? 1 : .45);
    self.closeSceneBtn
        .jobsResetBtnTitle([NSString stringWithFormat:@"关闭当前窗口 %@",currentIdentifier])
        .byEnabled(session != nil)
        .byAlpha(session ? 1 : .45);
}

-(void)sceneCoordinatorDidChange:(NSNotification *)notification{
    [self refreshSnapshotRequestSystemRefresh:NO];
}

-(NSArray <UISceneSession *>*)sortedOpenSessions{
    return [UIApplication.sharedApplication.openSessions.allObjects
        sortedArrayUsingComparator:^NSComparisonResult(UISceneSession *obj1,
                                                        UISceneSession *obj2) {
            return [obj1.persistentIdentifier compare:obj2.persistentIdentifier];
        }];
}

-(nullable UIWindowScene *)windowSceneForSession:(UISceneSession *)session{
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        if ([scene isKindOfClass:UIWindowScene.class] &&
            [scene.session.persistentIdentifier
                isEqualToString:session.persistentIdentifier]) {
            return (UIWindowScene *)scene;
        }
    };return nil;
}

-(UIColor *)colorForSession:(UISceneSession *)session{
    if (!session) return JobsSystemGrayColor;
    NSArray <UIColor *>*colors = @[
        JobsSystemBlueColor,
        JobsSystemGreenColor,
        JobsSystemOrangeColor,
        JobsSystemPinkColor,
        JobsSystemPurpleColor,
        JobsSystemTealColor
    ];
    return colors[session.persistentIdentifier.hash % colors.count];
}

-(NSString *)symbolForSession:(UISceneSession *)session{
    if (!session) return @"⚪️";
    NSArray <NSString *>*symbols = @[@"🔵",@"🟢",@"🟠",@"🔴",@"🟣",@"🟦"];
    return symbols[session.persistentIdentifier.hash % symbols.count];
}

-(NSString *)sceneOverviewText{
    NSArray <UISceneSession *>*sessions = self.sortedOpenSessions;
    if (!sessions.count) return @"还没有可对账的窗口会话。".tr;
    NSMutableArray <NSString *>*lines = NSMutableArray.array;
    [lines addObject:[NSString stringWithFormat:
        @"真实窗口会话：%ld 个（▶︎ 是当前窗口）",(long)sessions.count]];
    for (UISceneSession *session in sessions) {
        BOOL current = [session.persistentIdentifier
            isEqualToString:self.currentScene.session.persistentIdentifier];
        UIWindowScene *windowScene = [self windowSceneForSession:session];
        NSString *state = windowScene ?
            [JobsOCSceneCoordinator activationStateText:windowScene.activationState] :
            @"已断开，等待系统恢复";
        NSInteger counter = [JobsOCSceneCoordinator counterForSession:session
                                                             fallback:0];
        [lines addObject:[NSString stringWithFormat:
            @"%@ %@ 窗口 %@｜独立印章 %ld｜%@",
            current ? @"▶︎" : @"　",
            [self symbolForSession:session],
            [JobsOCSceneCoordinator shortIdentifierForSession:session],
            (long)counter,
            state]];
    };return [lines componentsJoinedByString:@"\n"];
}

-(void)showActionResult:(NSString *)message
                  color:(UIColor *)color{
    self.actionResultLab
        .byText([NSString stringWithFormat:@"本次操作看这里\n%@",message])
        .byTextCor(UIColor.whiteColor)
        .byBgColor(color)
        .byAlpha(.28);
    UIView.jobsAnimate(.22,
        ^{
        self.actionResultLab.byAlpha(1);
    });
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
            @"一个 App 进程里可以同时有多扇窗口。AppDelegate 只管整个进程；每扇窗口都有自己的一套 UIScene、SceneDelegate、UIWindow、状态和生命周期。"];
    };return _introLab;
}

-(UILabel *)guideLab{
    if (!_guideLab) {
        _guideLab = self.cardLab
            .byText(@"三步看懂：\n① 给当前窗口多盖几个印章\n② 新建窗口，确认新窗口从 0 开始\n③ 两边盖出不同数字，再切换窗口对账".tr);
    };return _guideLab;
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
            @"下面不是 App 总计数，而是当前窗口的“独立印章”。它让状态隔离变得肉眼可见：新窗口从 0 开始，旧窗口数字不变；系统重连时再用 NSUserActivity 恢复。"];
    };return _stateTipLab;
}

-(UILabel *)counterLab{
    if (!_counterLab) {
        _counterLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(JobsSystemBlueColor)
                .byFont([UIFont monospacedDigitSystemFontOfSize:32
                                                        weight:UIFontWeightBold])
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0);
        });
    };return _counterLab;
}

-(UILabel *)sceneOverviewLab{
    if (!_sceneOverviewLab) {
        _sceneOverviewLab = self.cardLab;
    };return _sceneOverviewLab;
}

-(UILabel *)actionTipLab{
    if (!_actionTipLab) {
        _actionTipLab = [self bodyLab:
            @"按 ① → ② → ③ 操作。每次点击都会先在下面给出肉眼可见的结果；系统日志只放在最后做辅助。iPad 的分屏或台前调度最适合验证。"];
    };return _actionTipLab;
}

-(UILabel *)actionResultLab{
    if (!_actionResultLab) {
        _actionResultLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"本次操作看这里\n等待你按 ① → ② → ③ 开始验证".tr)
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightSemiboldSize(14))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .byBgColor(JobsSystemIndigoColor)
                .byCornerRadius(12)
                .byClipsToBounds(YES);
        });
    };return _actionResultLab;
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
        _incrementBtn = [self buttonByTitle:@"① 给当前窗口盖章 +1"
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
        _newSceneBtn = [self buttonByTitle:@"② 新建独立窗口（从 0 开始）"
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
        _activateSceneBtn = [self buttonByTitle:@"③ 切换到另一个窗口"
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
        _refreshBtn = [self buttonByTitle:@"立即刷新上方窗口对账板"
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
