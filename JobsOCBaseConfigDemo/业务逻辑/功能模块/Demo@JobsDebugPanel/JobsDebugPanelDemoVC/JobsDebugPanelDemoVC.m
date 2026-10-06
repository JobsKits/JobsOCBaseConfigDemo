//
//  JobsDebugPanelDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugPanelDemoVC.h"

#if DEBUG
@interface JobsDebugPanelDemoVC ()

Prop_strong()UITableView *demoTable;
Prop_strong(nullable)JobsDebugPanelProbeRequest *probe;
Prop_strong(nullable)id environmentObserver;
Prop_copy()NSString *result;
-(jobsByVoidBlock _Nonnull)runProbe;
-(jobsByVoidBlock _Nonnull)applyDemoTheme;

@end

@implementation JobsDebugPanelDemoVC

-(void)dealloc {
    [_probe stop];
    if (_environmentObserver) {
        [NSNotificationCenter.defaultCenter removeObserver:_environmentObserver];
    }
}

// Demo 按真实导航栈返回，不依赖宿主 pushOrPresent 的默认状态。
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent {
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable sender) {
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        UINavigationController *navigation = self.navigationController;
        if (navigation.viewControllers.count > 1) {
            [navigation popViewControllerAnimated:YES];
        } else if (navigation.presentingViewController) {
            [navigation dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugPanelDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewDidLoad];
        self.byTitle(@"调试工具与环境切换");
        self.view.byBgColor(JobsSystemGroupedBackgroundColor);
        self->_result = @"本地演示数据：请求成功后展示服务器 JSON";
        self.demoTable.byHidden(NO);
        self->_environmentObserver = [NSNotificationCenter.defaultCenter addObserverForName:JobsDebugEnvironmentDidChangeNotification object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification *note) {
            @jobs_strongify(self)
            if (self) {
                self.runProbe();
            }
        }];
        [self addNotificationName:JobsThemeDidChangeNotification block:^(id weakSelf, id note) {
            @jobs_strongify(self)
            if (self) {
                self.applyDemoTheme();
            }
        }];
        self.applyDemoTheme();
        self.runProbe();
    };
}

-(void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugPanelDemoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear {
    @jobs_weakify(self)
    return ^(BOOL animated) {
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewWillAppear:animated];
        self.applyDemoTheme();
    };
}

-(jobsByVoidBlock _Nonnull)applyDemoTheme {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.isViewLoaded) {
            return;
        }
        if (@available(iOS 13.0, *)) {
            self.view.byOverrideUserInterfaceStyle(JobsThemeCenter.shared.isDarkMode ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight);
        }
        self.view.byBgColor(JobsSystemGroupedBackgroundColor);
        if (self->_demoTable) {
            self->_demoTable
                .bySeparatorColor(JobsThemeColor(JobsThemeColorKeyBackgroundTertiary))
                .byTintColor(JobsLabelColor)
                .byBgColor(JobsSystemGroupedBackgroundColor);
            if (self->_demoTable.window) {
                [self->_demoTable reloadData];
            }
        }
    };
}

-(jobsByVoidBlock _Nonnull)runProbe {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [self.probe stop];
        self->_probe = JobsDebugPanelProbeRequest.new;
        self->_result = @"本地演示数据（正在请求服务器）";
        if (self.view.window) {
            [self.demoTable reloadData];
        }
        NSString *requestedURL = This.jobsBaseUrl();
        [self.probe startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            @jobs_strongify(self)
            if (!self || request != self.probe) {
                return;
            }
            if ([request.responseJSONObject isKindOfClass:NSDictionary.class]) {
                self->_result = [NSString stringWithFormat:@"服务器数据 · %@/get\n%@", requestedURL, request.responseJSONObject];
            } else {
                self->_result = @"响应无法解析，继续显示本地演示数据";
            }
            [self.demoTable reloadData];
        } failure:^(__kindof YTKBaseRequest *request) {
            @jobs_strongify(self)
            if (!self || request != self.probe) {
                return;
            }
            self->_result = [NSString stringWithFormat:@"本地演示数据 · %@/get\n服务器不可达或超时，点击重新请求可恢复真数据。", requestedURL];
            [self.demoTable reloadData];
        }];
    };
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsDebugDemoCell"];
    if (!cell) {
        cell = UITableViewCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
        cell.bySelectedBackgroundView(jobsMakeView(^(UIView *view) {
            view.byBgColor(JobsThemeColor(JobsThemeColorKeyBackgroundTertiary));
        }));
    }
    NSArray<NSString *> *titles = @[@"当前网络环境", @"打开调试工具", @"重新请求当前环境", @"请求结果"];
    JobsDebugEnvironment *environment = JobsDebugPanelManager.sharedPanel.currentEnvironment;
    NSArray<NSString *> *details = @[
        [NSString stringWithFormat:@"%@\n%@", environment.title ?: @"未配置", This.jobsBaseUrl()],
        @"Push 一级功能列表，再进入环境选择；自定义功能按配置顺序展示",
        @"GET /get · 3 秒超时 · 失败保留本地演示数据",
        self.result ?: @""
    ];
    cell
        .byAccessoryType(indexPath.row < 3 ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone)
        .byTextLabel(^(UILabel *label) {
            label.byText(titles[indexPath.row]).byTextColor(JobsLabelColor).byNumberOfLines(0);
        })
        .byDetailTextLabel(^(UILabel *label) {
            label.byText(details[indexPath.row]).byTextColor(JobsSecondaryLabelColor).byNumberOfLines(0);
        })
        .byContentView(^(UIView *view) {
            view.byBgColor(JobsSecondarySystemGroupedBackgroundColor);
        })
        .byBgColor(JobsSecondarySystemGroupedBackgroundColor)
        .byTintColor(JobsLabelColor);
    UIView *selectedBackground = cell.selectedBackgroundView;
    if (selectedBackground) {
        selectedBackground.byBgColor(JobsThemeColor(JobsThemeColorKeyBackgroundTertiary));
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"圆按钮再次点击关闭调试流程并返回原页面；长按只隐藏到本次进程结束；重启 App 自动恢复。环境选择在 Debug 中保存，Release 不加载调试入口。";
}

-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:UITableViewHeaderFooterView.class]) {
        UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
        UILabel *label = footer.textLabel;
        if (label) {
            label.byTextColor(JobsSecondaryLabelColor);
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < 2) {
        JobsDebugPanelManager.sharedPanel.showFrom(self);
    } else if (indexPath.row == 2) {
        self.runProbe();
    }
}

-(UITableView *)demoTable {
    if (!_demoTable) {
        CGFloat hiddenBarHeight = self.navigationController.navigationBarHidden ? CGRectGetHeight(self.navigationController.navigationBar.frame) : 0;
        if (self.navigationController.navigationBarHidden && hiddenBarHeight <= 0) {
            hiddenBarHeight = 44;
        }
        _demoTable = jobsMakeTableViewByInsetGrouped(^(UITableView *table) {
            table
                .byDataSource(self)
                .byDelegate(self)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(88)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byAccessibilityIdentifier(@"JobsDebugPanelDemoTable")
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(hiddenBarHeight);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    }
    return _demoTable;
}

@end
#endif

