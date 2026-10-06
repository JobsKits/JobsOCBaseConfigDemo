//
//  JobsDebugPanelVC.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugPanelVC.h"
#import "JobsDebugPanelManager.h"
#import "JobsDebugEnvironmentsVC.h"
#import "JobsDebugPanelCell.h"

#if DEBUG
typedef __kindof UIViewController *_Nullable (^JobsDebugPanelControllerStyleBlock)(UIUserInterfaceStyle);

// 仅供调试框架使用，控制器 trait 与原生 presentation 一起跟随宿主有效主题。
@interface UIViewController (JobsDebugPanelTheme)
-(JobsDebugPanelControllerStyleBlock _Nonnull)byJobsDebugPanelInterfaceStyle;
@end

@implementation UIViewController (JobsDebugPanelTheme)

-(JobsDebugPanelControllerStyleBlock _Nonnull)byJobsDebugPanelInterfaceStyle {
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(UIUserInterfaceStyle style) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        if (@available(iOS 13.0, *)) {
            self.overrideUserInterfaceStyle = style;
        }
        return self;
    };
}

@end

@interface JobsDebugPanelVC ()

Prop_strong()JobsDebugPanelManager *panel;
Prop_strong()UITableView *tableView;
Prop_strong()UIButton *emptyButton;
Prop_strong()UINavigationBarAppearance *panelNavigationAppearance API_AVAILABLE(ios(13.0));

-(jobsByVoidBlock _Nonnull)applyPanelTheme;

@end

@implementation JobsDebugPanelVC

-(instancetype)initWithPanel:(JobsDebugPanelManager *)panel {
    if (self = [super init]) {
        _panel = panel;
    }
    return self;
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugPanelVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.byTitle([self isKindOfClass:JobsDebugEnvironmentsVC.class] ? @"App 环境切换" : @"调试工具");
        self.view.byBgColor(JobsSystemGroupedBackgroundColor);
        self.tableView.byHidden(NO);
        if (self.navigationController.presentingViewController && self.navigationController.viewControllers.firstObject == self) {
            self.navigationItem.byLeftBarButtonItem(jobsMakeBarButtonItemBySystemItem(UIBarButtonSystemItemClose, self, @selector(closePanel:), nil));
        }
        [self addNotificationName:JobsThemeDidChangeNotification block:^(id weakSelf, id note) {
            @jobs_strongify(self)
            if (self) {
                self.applyPanelTheme();
            }
        }];
        self.applyPanelTheme();
    };
}

-(void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugPanelVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
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
        self.applyPanelTheme();
    };
}

-(void)viewDidAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugPanelVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear {
    @jobs_weakify(self)
    return ^(BOOL animated) {
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewDidAppear:animated];
        [NSNotificationCenter.defaultCenter postNotificationName:JobsDebugPanelVisibilityDidChangeNotification object:self];
    };
}

-(void)viewDidDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugPanelVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear {
    @jobs_weakify(self)
    return ^(BOOL animated) {
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewDidDisappear:animated];
        [NSNotificationCenter.defaultCenter postNotificationName:JobsDebugPanelVisibilityDidChangeNotification object:self];
    };
}

// 读取宿主主题中心的有效主题，而不是当前系统 trait 的黑白状态。
-(jobsByVoidBlock _Nonnull)applyPanelTheme {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.isViewLoaded) {
            return;
        }
        UIColor *background = JobsSystemGroupedBackgroundColor;
        UIColor *navigationBackground = JobsSystemBackgroundColor;
        UIColor *text = JobsLabelColor;
        UIColor *separator = JobsThemeColor(JobsThemeColorKeyBackgroundTertiary);
        self.view.byBgColor(background);
        self
            .byGKNavBackgroundColor(navigationBackground)
            .byGKNavTitleColor(text)
            .byGKNavShadowColor(separator)
            .byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar *navigationBar) {
                if (navigationBar) {
                    navigationBar.byTintColor(text);
                }
            });
        UINavigationBar *navigationBar = self.navigationController.navigationBar;
        if (@available(iOS 13.0, *)) {
            UIUserInterfaceStyle style = JobsThemeCenter.shared.isDarkMode ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
            self.byJobsDebugPanelInterfaceStyle(style);
            self.view.byOverrideUserInterfaceStyle(style);
            UINavigationController *navigation = self.navigationController;
            if (navigation.presentingViewController &&
                [navigation.viewControllers.firstObject isKindOfClass:JobsDebugPanelVC.class]) {
                navigation.byJobsDebugPanelInterfaceStyle(style);
                navigation.view.byOverrideUserInterfaceStyle(style);
            }
            // 包括已显示的 Alert、sheet 和自定义动作页面，切换主题无需重新进入。
            UIViewController *presented = self.presentedViewController ?: self.navigationController.presentedViewController;
            while (presented) {
                presented.byJobsDebugPanelInterfaceStyle(style);
                if (presented.isViewLoaded) {
                    presented.view.byOverrideUserInterfaceStyle(style);
                }
                presented = presented.presentedViewController;
            }
            self->_panelNavigationAppearance = jobsMakeNavigationBarAppearance(^(__kindof UINavigationBarAppearance *appearance) {
                appearance
                    .byTitleTextAttributes(@{NSForegroundColorAttributeName: text})
                    .byLargeTitleTextAttributes(@{NSForegroundColorAttributeName: text})
                    .byConfigureWithOpaqueBackground()
                    .byBackgroundColor(navigationBackground)
                    .byShadowColor(separator);
            });
            if (navigationBar) {
                navigationBar
                    .byStandardAppearance(self.panelNavigationAppearance)
                    .byScrollEdgeAppearance(self.panelNavigationAppearance)
                    .byCompactAppearance(self.panelNavigationAppearance)
                    .byTintColor(text);
                if (@available(iOS 15.0, *)) {
                    navigationBar.byCompactScrollEdgeAppearance(self.panelNavigationAppearance);
                }
            }
        } else {
            if (navigationBar) {
                navigationBar.byBarTintColor(navigationBackground).byTintColor(text);
            }
        }
        if (self->_tableView) {
            self->_tableView.bySeparatorColor(separator).byBgColor(background);
            if (self->_tableView.window) {
                [self->_tableView reloadData];
            }
        }
        if (self->_emptyButton) {
            self->_emptyButton.jobsResetBtnTitleCor(JobsSecondaryLabelColor);
        }
    };
}

// 面板继承 UIViewController，返回动作不依赖宿主业务基类的 jobsBackBlock。
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

-(BOOL)isEnvironmentPage {
    return [self isKindOfClass:JobsDebugEnvironmentsVC.class];
}

-(void)closePanel:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = self.isEnvironmentPage ? self.panel.environments.count : 1 + self.panel.actions.count;
    tableView.byBackgroundView(count ? nil : self.emptyButton);
    return count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsDebugPanelCell"];
    if (!cell) {
        cell = JobsDebugPanelCell.new;
        cell.bySelectedBackgroundView(jobsMakeView(^(__kindof UIView *view) {
            view.byBgColor(JobsThemeColor(JobsThemeColorKeyBackgroundTertiary));
        }));
    }
    NSString *title = @"";
    NSString *detail = @"";
    UIImage *image = nil;
    UITableViewCellAccessoryType accessory = UITableViewCellAccessoryDisclosureIndicator;
    if (self.isEnvironmentPage) {
        JobsDebugEnvironment *environment = self.panel.environments[indexPath.row];
        title = environment.title;
        detail = environment.baseURL;
        accessory = [environment.identifier isEqualToString:self.panel.currentEnvironment.identifier] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    } else if (indexPath.row == 0) {
        title = @"App 环境切换";
        detail = self.panel.currentEnvironment.title ?: @"尚未配置环境";
    } else {
        JobsDebugAction *action = self.panel.actions[indexPath.row - 1];
        title = action.title;
        image = action.image;
    }
    cell
        .byAccessoryType(accessory)
        .byTextLabel(^(UILabel *label) {
            label.byText(title).byTextColor(JobsLabelColor).byNumberOfLines(0);
        })
        .byDetailTextLabel(^(UILabel *label) {
            label.byText(detail).byTextColor(JobsSecondaryLabelColor).byNumberOfLines(0);
        })
        .byCellImageView(^(UIImageView *view) {
            view.byImage(image);
        })
        .byBgColor(JobsSecondarySystemGroupedBackgroundColor)
        .byTintColor(JobsLabelColor);
    cell.contentView.byBgColor(JobsSecondarySystemGroupedBackgroundColor);
    UIView *selectedBackground = cell.selectedBackgroundView;
    if (selectedBackground) {
        selectedBackground.byBgColor(JobsThemeColor(JobsThemeColorKeyBackgroundTertiary));
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.isEnvironmentPage) {
        self.panel.selectEnvironment(self.panel.environments[indexPath.row]);
        [tableView reloadData];
    } else if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[JobsDebugEnvironmentsVC alloc] initWithPanel:self.panel] animated:YES];
    } else {
        JobsDebugAction *action = self.panel.actions[indexPath.row - 1];
        if (action.handler) {
            action.handler(self);
            self.applyPanelTheme();
        }
    }
}

-(UITableView *)tableView {
    if (!_tableView) {
        // 宿主自绘导航栏不计入 UIKit safe area，需要单独留出标题栏高度。
        CGFloat hiddenBarHeight = self.navigationController.navigationBarHidden ? CGRectGetHeight(self.navigationController.navigationBar.frame) : 0;
        if (self.navigationController.navigationBarHidden && hiddenBarHeight <= 0) {
            hiddenBarHeight = 44;
        }
        _tableView = jobsMakeTableViewByInsetGrouped(^(UITableView *table) {
            table
                .byDataSource(self)
                .byDelegate(self)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(64)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byAccessibilityIdentifier(@"JobsDebugPanelTable")
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(hiddenBarHeight);
                    make.left.right.equalTo(self.view);
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
                });
        });
    }
    return _tableView;
}

-(UIButton *)emptyButton {
    if (!_emptyButton) {
        @jobs_weakify(self)
        _emptyButton = BaseButton.jobsInit()
            .jobsResetBtnTitle(@"暂无有效环境\n请在 AppDelegate 配置 HTTP/HTTPS URL\n点击重新加载")
            .jobsResetBtnTitleCor(JobsSecondaryLabelColor)
            .byTitleLabel(^(UILabel *label) {
                label.byNumberOfLines(0).byTextAlignment(NSTextAlignmentCenter);
            })
            .onClickBy(^(UIButton *sender) {
                @jobs_strongify(self)
                if (self) {
                    [self.tableView reloadData];
                }
            });
    }
    return _emptyButton;
}

@end
#endif
