//
//  JobsUserInfoVC.m
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsUserInfoVC.h"

/// 页面与卡片成对跟随 App 有效主题，保持三端相同的明暗层次。
NS_INLINE UIColor *JobsUserInfoPageColor(void) {
    return JobsThemeCenter.shared.isDarkMode ? HEXCOLOR(0x000000) : HEXCOLOR(0xF2F2F7);
}

NS_INLINE UIColor *JobsUserInfoCardColor(void) {
    return JobsThemeCenter.shared.isDarkMode ? HEXCOLOR(0x1C1C1E) : HEXCOLOR(0xFFFFFF);
}

@interface JobsUserInfoVC ()

Prop_strong()NSArray<UIViewModel *> *userInfoItems;
Prop_strong()NSArray<JobsDeviceInfoItem *> *deviceInfoItems;
Prop_strong()NSArray<UIView *> *sectionHeaderViews;
Prop_strong()NSArray<UIButton *> *sectionHeaderButtons;
Prop_strong()NSArray<UILabel *> *sectionTitleLabels;
Prop_strong()NSArray<UILabel *> *sectionCountLabels;
Prop_strong()NSArray<UILabel *> *sectionActionLabels;
Prop_strong()NSArray<UIImageView *> *sectionChevronViews;
Prop_strong()NSMutableIndexSet *collapsedSections;
Prop_strong()UIView *infoSurfaceView;
Prop_strong()JobsDeviceCollectionClient *collectionClient;
Prop_strong()NSArray<JobsDeviceInfoItem *> *collectionItems;
Prop_strong()UIView *collectionPanel;
Prop_strong()UILabel *collectionStatusLabel;
Prop_strong()NSArray<UIButton *> *collectionButtons;
Prop_strong()NSTimer *collectionTimer;
Prop_copy()NSString *collectionStatusKey;
Prop_assign()BOOL collectionVisible;
Prop_assign()BOOL collectionDeletionUnconfirmed;

-(JobsRetStrByStrBlock _Nonnull)collectionText;
-(jobsByVoidBlock _Nonnull)refreshCollection;
-(jobsByVoidBlock _Nonnull)renderCollection;
-(jobsByVoidBlock _Nonnull)startCollection;
-(jobsByVoidBlock _Nonnull)openCollectionPage;
-(jobsByVoidBlock _Nonnull)scheduleCollectionRefresh;

-(jobsByVoidBlock _Nonnull)reloadInfo;
-(jobsByLabelBlock _Nonnull)bindSecondaryTextColor;
-(jobsByNSIntegerBlock _Nonnull)toggleSection;
-(jobsByNSIntegerBlock _Nonnull)refreshSectionHeader;

@end

@implementation JobsUserInfoVC

-(void)loadView {
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.byViewModel((UIViewModel *)self.requestParams);
        if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
            self.byPushOrPresent(self.viewModel.pushOrPresent);
        }
    }
    self.viewModel
        .byTextModelBlock(^(__kindof UITextModel * _Nullable model) {
            model.byText(@"用户与设备信息".jobsTr()).byTextCor(JobsLabelColor);
        })
        .byBgCor(JobsUserInfoPageColor())
        .byNavBgCor(JobsSystemBackgroundColor)
        .byNavBgImage(nil);
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsUserInfoPageColor());
    self.tableView.byShow(self);
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(collectionDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(collectionWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(collectionLanguageDidChange:) name:语言切换 object:nil];
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"JobsDeviceCollection.language"];
    self.collectionStatusKey = @"idle";
    self.renderCollection();
    [JobsThemeCenter.shared bindObject:self
                                 slot:@"jobs.userInfo.theme"
                                apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
        JobsUserInfoVC *controller = (JobsUserInfoVC *)object;
        if (controller->_infoSurfaceView) {
            controller->_infoSurfaceView.byBgColor(JobsUserInfoPageColor());
        }
        if (controller->_tableView) {
            controller->_tableView.byBgColor(JobsUserInfoPageColor());
        }
        for (NSInteger section = 0; section < 3; section++) {
            controller.refreshSectionHeader(section);
        }
        controller->_collectionPanel.byBgColor(JobsUserInfoPageColor());
        controller->_collectionStatusLabel.byTextCor([center.resolvedColorForKey(JobsThemeColorKeyTextSecondary) colorWithAlphaComponent:1]);
        for (UIButton *button in controller->_collectionButtons) {
            button.jobsResetBtnTitleCor(JobsLabelColor).jobsResetBtnBgCor(JobsUserInfoCardColor());
        }
        if (controller.isViewLoaded && controller.view.window) {

            [controller.tableView reloadData];
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.reloadInfo();
}

-(void)collectionLanguageDidChange:(NSNotification *)notification {
    self.viewModel.byTextModelBlock(^(__kindof UITextModel *model) {
        model.byText(@"用户与设备信息".jobsTr());
    });
    self.reloadInfo();
    self.renderCollection();
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.collectionVisible = YES;
    self.refreshCollection();
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.collectionVisible = NO;
    [self.collectionTimer invalidate];
    self.collectionTimer = nil;
    self.collectionClient.cancelPendingRequest();
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
    [_collectionTimer invalidate];
    if (_collectionClient) {
        _collectionClient.cancelPendingRequest();
    }
}

-(void)collectionDidBecomeActive:(NSNotification *)notification {
    if (self.collectionVisible && self.view.window) {
        self.refreshCollection();
    }
}

-(void)collectionWillResignActive:(NSNotification *)notification {
    [self.collectionTimer invalidate];
    self.collectionTimer = nil;
    self.collectionClient.cancelPendingRequest();
}

#pragma mark —— 数据与分组
-(jobsByVoidBlock _Nonnull)reloadInfo {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSObject *userInfo = self.viewModel.requestParams;
        NSArray<NSString *> *properties = userInfo ? userInfo.propertyList() : @[];
        self.userInfoItems = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable items) {
            for (NSString *propertyInfo in properties) {
                NSString *name = [propertyInfo componentsSeparatedByString:@":"].firstObject;
                id value = userInfo.valueForKey(name);
                NSString *text = [value isKindOfClass:NSString.class] ? value : (value ? [value description] : @"nil");
                items.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable model) {
                    model.textModel.byText(name);
                    model.subTextModel.byText(text);
                }));
            }
        });
        self.deviceInfoItems = JobsDeviceDescription.currentItems();
        if (self->_tableView) {
            [self.tableView reloadData];
        }
    };
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.collapsedSections containsIndex:section]) {
        return 0;
    }
    return section == 0 ? MAX(1, self.userInfoItems.count) : (section == 1 ? self.deviceInfoItems.count : MAX(1, self.collectionItems.count));
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.refreshSectionHeader(section);
    return self.sectionHeaderViews[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    UIFont *font = [UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(17)];
    return MAX(56, ceil(font.lineHeight) + 24);
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 2 || [self.collapsedSections containsIndex:section]) {
        return nil;
    }
    return section == 0
        ? @"轻点任意信息项即可复制。空值保留为 nil。".jobsTr()
        : @"轻点复制；受限项仅复制系统说明。设备名称可能由 iOS 限制为 iPhone / iPad。".jobsTr();
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        CGFloat width = MAX(1, CGRectGetWidth(tableView.bounds) - 32);
        CGFloat textWidth = MAX(1, width - 24);
        NSString *text = self.collectionStatusLabel.text ?: @"";
        UIFont *font = self.collectionStatusLabel.font;
        CGRect bounds = [text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName:font}
                                          context:nil];
        CGFloat buttonHeight = MAX(48, ceil([UIFontMetrics.defaultMetrics scaledValueForValue:48]));
        return ceil(CGRectGetHeight(bounds)) + buttonHeight * 4 + 72;
    }
    if ([self.collapsedSections containsIndex:section]) {
        return 16;
    }

    CGFloat width = MAX(1, CGRectGetWidth(tableView.bounds) - 64);
    UIFont *font = [UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(13)];
    CGRect bounds = [[self tableView:tableView titleForFooterInSection:section]
        boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
        attributes:@{NSFontAttributeName:font}
        context:nil];
    return ceil(CGRectGetHeight(bounds)) + 24;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL empty = (indexPath.section == 0 && !self.userInfoItems.count) || (indexPath.section == 2 && !self.collectionItems.count);
    if (indexPath.section == 2) {
        JobsDeviceInfoItem *item = self.collectionItems.count ? self.collectionItems[indexPath.row] : nil;
        UITableViewCell *cell = UITableViewCell.cellStyleSubtitleByTableView(tableView);
        cell.byTextLabel(^(__kindof UILabel *label) {
                label.byText(item ? item.title : self.collectionText(@"empty"))
                    .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(16)])
                    .byNumberOfLines(0)
                    .byTextCor(JobsLabelColor);
            })
            .byDetailTextLabel(^(__kindof UILabel *label) {
                label.byText(item ? item.value : self.collectionText(@"refresh"))
                    .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(14)])
                    .byNumberOfLines(0);
                self.bindSecondaryTextColor(label);
            })
            .byBackgroundConfiguration(jobsMakeClearConfiguration(^(__kindof UIBackgroundConfiguration *configuration) {
                configuration.byBackgroundColor(JobsUserInfoCardColor());
            }))
            .byBgColor(JobsUserInfoCardColor())
            .byAccessibilityIdentifier(@"jobs.deviceCollection.result");
        cell.contentView.byBgColor(JobsUserInfoCardColor());
        return cell;
    }
    NSString *title = empty ? @"暂无用户信息".jobsTr() : (indexPath.section == 0
        ? self.userInfoItems[indexPath.row].textModel.text : self.deviceInfoItems[indexPath.row].title);
    NSString *value = empty ? @"轻点重新加载".jobsTr() : (indexPath.section == 0
        ? self.userInfoItems[indexPath.row].subTextModel.text : self.deviceInfoItems[indexPath.row].value);
    UITableViewCell *cell = UITableViewCell.cellStyleSubtitleByTableView(tableView);
    cell
        .byAutomaticallyUpdatesBackgroundConfiguration(NO)
        .byBackgroundConfiguration(jobsMakeClearConfiguration(^(__kindof UIBackgroundConfiguration * _Nullable configuration) {
            configuration.byBackgroundColor(JobsUserInfoCardColor()).byCornerRadius(0);
        }))
        .byAccessoryType(UITableViewCellAccessoryNone)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault)
        .bySeparatorInset(UIEdgeInsetsMake(0, 16, 0, 16))
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(title)
                .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(16)])
                .byAdjustsFontForContentSizeCategory(YES)
                .byNumberOfLines(0)
                .byTextCor(JobsLabelColor);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(value)
                .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(14)])
                .byAdjustsFontForContentSizeCategory(YES)
                .byNumberOfLines(0);
            self.bindSecondaryTextColor(label);
        })
        .byBgColor(JobsUserInfoCardColor())
        .byAccessibilityIdentifier([NSString stringWithFormat:@"jobs.%@.%ld", indexPath.section == 0 ? @"userInfo" : @"deviceInfo", (long)indexPath.row]);
    cell.contentView.byBgColor(JobsUserInfoCardColor());
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL last = indexPath.row == [self tableView:tableView numberOfRowsInSection:indexPath.section] - 1;
    cell.byCornerRadius(last ? 12 : 0).byClipsToBounds(YES);
    cell.layer.byMaskedCorners(last ? kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner : 0);
}

-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:UITableViewHeaderFooterView.class]) {
        UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
        footer.textLabel
            .byNumberOfLines(0)
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(13)])
            .byAdjustsFontForContentSizeCategory(YES);
        self.bindSecondaryTextColor(footer.textLabel);
        footer.contentView.byBgColor(JobsClearColor);
    }
}

-(jobsByLabelBlock _Nonnull)bindSecondaryTextColor {
    return ^(__kindof UILabel * _Nullable label) {
        if (!label) {
            return;
        }
        [JobsThemeCenter.shared bindObject:label
                                     slot:@"jobs.userInfo.secondaryText"
                                    apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
            ((UILabel *)object).byTextCor([center.resolvedColorForKey(JobsThemeColorKeyTextSecondary) colorWithAlphaComponent:1]);
        }];
    };
}

-(jobsByNSIntegerBlock _Nonnull)toggleSection {
    @jobs_weakify(self)
    return ^(NSInteger section) {
        @jobs_strongify(self)
        if (!self || section < 0 || section > 2) {
            return;
        }
        // 状态、分组头与行布局原子更新，避免显式或隐式动画绘出接缝中间态。
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [UIView performWithoutAnimation:^{
            if ([self.collapsedSections containsIndex:section]) {
                [self.collapsedSections removeIndex:section];
            } else {
                [self.collapsedSections addIndex:section];
            }
            self.refreshSectionHeader(section);
            if (self.isViewLoaded && self.view.window) {
                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
                self.tableView.byLayoutIfNeeded();
            }
        }];
        [CATransaction commit];
    };
}

-(jobsByNSIntegerBlock _Nonnull)refreshSectionHeader {
    @jobs_weakify(self)
    return ^(NSInteger section) {
        @jobs_strongify(self)
        if (!self || section < 0 || section > 2) {
            return;
        }
        // 先完成三个数组的创建，再配置它们，避免懒加载互相重入。
        (void)self.sectionHeaderViews;
        BOOL collapsed = [self.collapsedSections containsIndex:section];
        NSString *title = section == 0 ? @"用户信息".jobsTr() : (section == 1 ? @"本机信息".jobsTr() : self.collectionText(@"section"));
        NSString *action = section == 2 ? self.collectionText(collapsed ? @"expand" : @"collapse") : (collapsed ? @"展开".jobsTr() : @"收起".jobsTr());
        NSUInteger count = section == 0 ? self.userInfoItems.count : (section == 1 ? self.deviceInfoItems.count : self.collectionItems.count);
        self.sectionTitleLabels[section].byText(title).byTextCor(JobsLabelColor);
        self.sectionCountLabels[section].byText([NSString stringWithFormat:section == 2 ? self.collectionText(@"count") : @"%lu 项", (unsigned long)count]);
        self.bindSecondaryTextColor(self.sectionCountLabels[section]);
        self.sectionActionLabels[section].byText(action);
        self.sectionChevronViews[section].byImage((collapsed ? @"chevron.down" : @"chevron.up").sys_img);
        self.bindSecondaryTextColor(self.sectionActionLabels[section]);
        CACornerMask corners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
        if (collapsed) {
            corners |= kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
        }
        self.sectionHeaderViews[section].byBgColor(JobsUserInfoCardColor()).byLayer(^(__kindof CALayer * _Nullable layer) {
            layer.byMaskedCorners(corners);
        });
        self.sectionHeaderButtons[section]
            .byAccessibilityLabel([NSString stringWithFormat:section == 2 ? self.collectionText(@"header") : @"%@，%lu 项，%@，轻点%@", title, (unsigned long)count, section == 2 ? self.collectionText(collapsed ? @"collapsed" : @"expanded") : (collapsed ? @"已折叠" : @"已展开"), action]);
    };
}

#pragma mark —— 懒加载
@synthesize tableView = _tableView;
-(BaseTableView *)tableView {
    if (!_tableView) {
        _tableView = jobsMakeBaseTableViewByGrouped(^(__kindof BaseTableView * _Nullable tableView) {
            tableView
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(76)
                .byEstimatedSectionHeaderHeight(56)
                .byEstimatedSectionFooterHeight(56)
                .bySeparatorColor(JobsSeparatorColor)
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(JobsUserInfoPageColor())
                .byAccessibilityIdentifier(@"jobs.userInfo.table");
        });
        _tableView.dataLink(self);
        _tableView.addOn(self.infoSurfaceView).byAdd(^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.infoSurfaceView);
            make.leading.equalTo(self.infoSurfaceView).offset(16);
            make.trailing.equalTo(self.infoSurfaceView).offset(-16);
        });
    }
    return _tableView;
}

-(UIView *)infoSurfaceView {
    if (!_infoSurfaceView) {
        _infoSurfaceView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            // 根背景由公共导航管理；分组底色放在独立内容承载面。
            view.byBgColor(JobsUserInfoPageColor()).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.leading.trailing.bottom.equalTo(self.view);
            });
        });
    }
    return _infoSurfaceView;
}

-(NSMutableIndexSet *)collapsedSections {
    if (!_collapsedSections) {
        _collapsedSections = jobsMakeMutIndexSet(nil);
    }
    return _collapsedSections;
}

-(NSArray<UIView *> *)sectionHeaderViews {
    if (!_sectionHeaderViews) {
        NSMutableArray<UIView *> *headers = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable items) {});
        NSMutableArray<UIButton *> *buttons = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable items) {});
        NSMutableArray<UILabel *> *titles = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable items) {});
        NSMutableArray<UILabel *> *counts = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable items) {});
        NSMutableArray<UILabel *> *actions = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable items) {});
        NSMutableArray<UIImageView *> *chevrons = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable items) {});
        @jobs_weakify(self)
        for (NSInteger section = 0; section < 3; section++) {
            UIView *header = jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(JobsUserInfoCardColor()).byCornerRadius(12).byClipsToBounds(YES);
            });
            UILabel *title = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label.byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(17)])
                    .byAdjustsFontForContentSizeCategory(YES);
            });
            UILabel *count = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label.byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(13)])
                    .byAdjustsFontForContentSizeCategory(YES);
            });
            UILabel *action = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label.byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightMediumSize(13)])
                    .byAdjustsFontForContentSizeCategory(YES);
            });
            UIImageView *chevron = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView.byContentMode(UIViewContentModeScaleAspectFit).byTintColor(JobsLabelColor);
            });
            UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable target) {
                target.jobsResetBtnBgCor(JobsClearColor)
                    .onClickBy(^(__unused UIButton *sender) {
                        @jobs_strongify(self)
                        self.toggleSection(section);
                    })
                    .byAccessibilityIdentifier([NSString stringWithFormat:@"jobs.userInfo.section.%ld", (long)section]);
            });
            title.addOn(header).byAdd(^(MASConstraintMaker *make) {
                make.leading.equalTo(header).offset(16);
                make.centerY.equalTo(header);
            });
            chevron.addOn(header).byAdd(^(MASConstraintMaker *make) {
                make.trailing.equalTo(header).offset(-16);
                make.centerY.equalTo(header);
                make.width.mas_equalTo(12);
                make.height.mas_equalTo(16);
            });
            action.addOn(header).byAdd(^(MASConstraintMaker *make) {
                make.trailing.equalTo(chevron.mas_leading).offset(-8);
                make.centerY.equalTo(header);
            });
            count.addOn(header).byAdd(^(MASConstraintMaker *make) {
                make.leading.equalTo(title.mas_trailing).offset(10);
                make.trailing.lessThanOrEqualTo(action.mas_leading).offset(-12);
                make.centerY.equalTo(header);
            });
            button.addOn(header).byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(header);
            });
            headers.add(header);
            buttons.add(button);
            titles.add(title);
            counts.add(count);
            actions.add(action);
            chevrons.add(chevron);
        }
        _sectionHeaderButtons = buttons;
        _sectionTitleLabels = titles;
        _sectionCountLabels = counts;
        _sectionActionLabels = actions;
        _sectionChevronViews = chevrons;
        _sectionHeaderViews = headers;
    }
    return _sectionHeaderViews;
}

#pragma mark —— 点击复制
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        if (!self.collectionClient.session) {
            self.renderCollection();
            self.refreshCollection();
            return;
        }
        if (!self.collectionItems.count) {
            self.refreshCollection();
            return;
        }
        JobsDeviceInfoItem *item = self.collectionItems[indexPath.row];
        if (!item.restricted && !self.presentedViewController) {
            jobsMakePasteboard(^(__kindof UIPasteboard *pasteboard) {
                pasteboard.byString(item.value);
            });
            JobsAlertModel *model = jobsMakeAlertModel(^(__kindof JobsAlertModel *model) {
                model.byAlertControllerTitle(self.collectionText(@"copy"))
                    .byMessage([NSString stringWithFormat:self.collectionText(@"copied"), item.title])
                    .byPreferredStyle(UIAlertControllerStyleAlert)
                    .byAlertActionTitle(self.collectionText(@"ok"))
                    .byAlertActionStyle(UIAlertActionStyleDefault);
            });
            self.comingToPresentVC(JobsMakeAlertControllerBy(model).add(JobsMakeAlertActionBy(model)));
        }
        return;
    }

    if (indexPath.section == 0 && !self.userInfoItems.count) {
        self.reloadInfo();
        return;
    }
    if (self.presentedViewController) {
        return;
    }
    NSString *title = indexPath.section == 0 ? self.userInfoItems[indexPath.row].textModel.text : self.deviceInfoItems[indexPath.row].title;
    NSString *value = indexPath.section == 0 ? self.userInfoItems[indexPath.row].subTextModel.text : self.deviceInfoItems[indexPath.row].value;
    BOOL restricted = indexPath.section == 1 && self.deviceInfoItems[indexPath.row].restricted;
    jobsMakePasteboard(^(__kindof UIPasteboard * _Nullable pasteboard) {
        pasteboard.byString(value);
    });
    NSString *message = restricted
        ? [NSString stringWithFormat:@"%@：已复制系统限制说明。\n%@", title, value]
        : [NSString stringWithFormat:@"已复制%@。", title];
    JobsAlertModel *alertModel = jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable model) {
        model.byAlertControllerTitle(@"复制成功".jobsTr())
            .byMessage(message)
            .byPreferredStyle(UIAlertControllerStyleAlert)
            .byAlertActionTitle(@"确定".jobsTr())
            .byAlertActionStyle(UIAlertActionStyleDefault);
    });
    self.comingToPresentVC(JobsMakeAlertControllerBy(alertModel).add(JobsMakeAlertActionBy(alertModel)));
}

#pragma mark —— 联网采集
-(JobsRetStrByStrBlock _Nonnull)collectionText {
    @jobs_weakify(self)
    return ^NSString *(NSString *key) {
        @jobs_strongify(self)
        if (!self) {
            return @"";
        }
        NSString *language = LanMgr.languageCodeByAppLanguage(LanMgr.language);
        return [JobsDeviceCollectionText text:key language:language ?: @"en"];
    };
}

-(JobsDeviceCollectionClient *)collectionClient {
    if (!_collectionClient) {
        _collectionClient = JobsDeviceCollectionClient.new;
    }
    return _collectionClient;
}

-(jobsByVoidBlock _Nonnull)renderCollection {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        (void)self.collectionPanel;
        NSDictionary *session = self.collectionClient.session;
        NSDictionary *device = [session[@"device"] isKindOfClass:NSDictionary.class] ? session[@"device"] : @{};
        NSDictionary *sources = [device[@"fieldSources"] isKindOfClass:NSDictionary.class] ? device[@"fieldSources"] : @{};
        NSArray *keys = @[@"udid", @"imei", @"imei2", @"iccid", @"meid", @"modelName", @"osVersion", @"serial", @"modelNumber", @"seid", @"product", @"version"];
        NSDictionary *titles = @{@"udid": @"UDID", @"imei": @"IMEI", @"imei2": @"IMEI2", @"iccid": @"ICCID", @"meid": @"MEID", @"seid": @"SEID"};
        NSMutableArray *items = NSMutableArray.new;
        if (device.count) {
            for (NSString *key in keys) {
                NSString *value = [device[key] isKindOfClass:NSString.class] ? device[key] : @"";
                if (value.length > 200 || [value rangeOfCharacterFromSet:NSCharacterSet.controlCharacterSet].location != NSNotFound) {
                    value = @"";
                }
                if ([key isEqual:@"udid"] && [value rangeOfString:@"^(?:[0-9a-fA-F]{40}|[0-9a-fA-F]{8}-[0-9a-fA-F]{16})$" options:NSRegularExpressionSearch].location == NSNotFound) {
                    value = @"";
                }
                if (([key isEqual:@"imei"] || [key isEqual:@"imei2"]) && [value rangeOfString:@"^[0-9]{15}$" options:NSRegularExpressionSearch].location == NSNotFound) {
                    value = @"";
                }
                NSString *source = [sources[key] isKindOfClass:NSString.class] ? sources[key] : @"";
                NSString *sourceKey = @{@"profile": @"profile", @"manual": @"manual", @"derived": @"derived", @"browser": @"browserSource", @"browser-hint": @"browserSource", @"selected": @"manual"}[source] ?: @"unknown";
                NSString *title = titles[key] ?: self.collectionText(key);
                if (value.length) {
                    title = [NSString stringWithFormat:@"%@ · %@", title, self.collectionText(sourceKey)];
                }
                [items addObject:[JobsDeviceInfoItem itemWithTitle:title value:value.length ? value : self.collectionText(@"missing") restricted:!value.length]];
            }
        }
        self.collectionItems = items.copy;
        NSString *status = self.collectionText(self.collectionStatusKey ?: @"idle");
        if (session) {
            status = [status stringByAppendingFormat:@"\n%@", [NSString stringWithFormat:self.collectionText(@"expiry"), session[@"expiresAt"]]];
        }
        self.collectionStatusLabel.byText([status stringByAppendingFormat:@"\n%@", self.collectionText(@"note")]);
        BOOL waiting = [session[@"state"] isEqual:@"waiting"];
        NSArray *buttonKeys = @[(waiting && self.collectionClient.browserURL) ? @"continue" : @"collect", @"refresh", @"clear"];
        for (NSUInteger index = 0; index < self.collectionButtons.count; index++) {
            self.collectionButtons[index]
                .jobsResetBtnTitle(self.collectionText(buttonKeys[index]))
                .byAccessibilityLabel(self.collectionText(buttonKeys[index]))
                .byEnabled(!self.collectionClient.loading);
        }
        if (self->_tableView && self.view.window) {
            [self.tableView reloadData];
        }
    };
}

-(jobsByVoidBlock _Nonnull)refreshCollection {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || self.collectionClient.loading) {
            return;
        }
        BOOL hadSession = self.collectionItems.count || [self.collectionStatusKey isEqual:@"waiting"];
        self.collectionStatusKey = @"loading";
        [self.collectionClient requestCreatingPair:NO completion:^(NSDictionary *session, NSError *error) {
            @jobs_strongify(self)
            if (!self) {
                return;
            }
            if (error) {
                self.collectionStatusKey = error.code == 429 ? @"rateLimited" : @"network";
            } else if (!session) {
                self.collectionStatusKey = self.collectionDeletionUnconfirmed ? @"clearFailed" : (hadSession ? @"expired" : @"idle");
            } else if ([session[@"state"] isEqual:@"received"]) {
                NSDictionary *device = [session[@"device"] isKindOfClass:NSDictionary.class] ? session[@"device"] : @{};
                NSString *udid = [device[@"udid"] isKindOfClass:NSString.class] ? device[@"udid"] : @"";
                BOOL validUDID = [udid rangeOfString:@"^(?:[0-9a-fA-F]{40}|[0-9a-fA-F]{8}-[0-9a-fA-F]{16})$" options:NSRegularExpressionSearch].location != NSNotFound;
                self.collectionStatusKey = [session[@"verification"] isEqual:@"browser-reported"] ? @"browser" : (validUDID ? @"received" : @"missingUDID");
            } else {
                self.collectionStatusKey = [session[@"callbackError"] isKindOfClass:NSDictionary.class] ? @"callback" : @"waiting";
            }
            self.renderCollection();
            self.scheduleCollectionRefresh();
        }];
        self.renderCollection();
    };
}

-(jobsByVoidBlock _Nonnull)scheduleCollectionRefresh {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [self.collectionTimer invalidate];
        self.collectionTimer = nil;
        NSDictionary *session = self.collectionClient.session;
        if (!self.collectionVisible || UIApplication.sharedApplication.applicationState != UIApplicationStateActive || !session) {
            return;
        }
        // 前台等待时短轮询；已收到结果也定时检查到期，不让旧编号无限显示。
        NSTimeInterval interval = 3;
        if ([session[@"state"] isEqual:@"received"]) {
            NSISO8601DateFormatter *formatter = NSISO8601DateFormatter.new;
            formatter.formatOptions = NSISO8601DateFormatWithInternetDateTime | NSISO8601DateFormatWithFractionalSeconds;
            NSDate *date = [formatter dateFromString:session[@"expiresAt"]];
            if (!date) {
                formatter.formatOptions = NSISO8601DateFormatWithInternetDateTime;
                date = [formatter dateFromString:session[@"expiresAt"]];
            }
            interval = MAX(1, date.timeIntervalSinceNow + 0.1);
        }
        self.collectionTimer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:NO block:^(NSTimer *timer) {
            @jobs_strongify(self)
            if (!self) {
                return;
            }
            if ([self.collectionClient.session[@"state"] isEqual:@"received"]) {
                self.renderCollection();
                self.scheduleCollectionRefresh();
            } else {
                self.refreshCollection();
            }
        }];
    };
}

-(jobsByVoidBlock _Nonnull)startCollection {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || self.presentedViewController || self.collectionClient.loading) {
            return;
        }
        if ([self.collectionClient.session[@"state"] isEqual:@"waiting"] && self.collectionClient.browserURL) {
            self.openCollectionPage();
            return;
        }
        JobsAlertModel *model = jobsMakeAlertModel(^(__kindof JobsAlertModel *model) {
            NSString *consent = [self.collectionText(@"consent") stringByReplacingOccurrencesOfString:@"jobs-device-info-pages.pages.dev" withString:self.collectionClient.siteURL.host];
            model.byAlertControllerTitle(self.collectionText(@"consentTitle"))
                .byMessage([consent stringByAppendingFormat:@"\n%@", self.collectionClient.siteURL.absoluteString])
                .byPreferredStyle(UIAlertControllerStyleAlert)
                .byAlertActionTitle(self.collectionText(@"agree"))
                .byAlertActionStyle(UIAlertActionStyleDefault)
                .byAlertActionBlock(^(__unused UIAlertAction *action) {
                    @jobs_strongify(self)
                    if (!self) {
                        return;
                    }
                    self.collectionStatusKey = @"loading";
                    [self.collectionTimer invalidate];
                    [self.collectionClient requestCreatingPair:YES completion:^(NSDictionary *session, NSError *error) {
                        @jobs_strongify(self)
                        if (!self) {
                            return;
                        }
                        self.collectionStatusKey = error ? (error.code == 429 ? @"rateLimited" : @"network") : @"waiting";
                        if (!error) {
                            self.collectionDeletionUnconfirmed = NO;
                        }
                        self.renderCollection();
                        if (!error && self.collectionVisible) {
                            self.openCollectionPage();
                        }
                        self.scheduleCollectionRefresh();
                    }];
                    self.renderCollection();
                });
        });
        JobsAlertModel *cancel = jobsMakeAlertModel(^(__kindof JobsAlertModel *model) {
            model.byAlertActionTitle(self.collectionText(@"cancel")).byAlertActionStyle(UIAlertActionStyleCancel);
        });
        self.comingToPresentVC(JobsMakeAlertControllerBy(model).add(JobsMakeAlertActionBy(cancel)).add(JobsMakeAlertActionBy(model)));
    };
}

-(jobsByVoidBlock _Nonnull)openCollectionPage {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSURL *url = self.collectionClient.browserURL;
        if (!url) {
            return;
        }
        [UIApplication.sharedApplication openURL:url options:@{} completionHandler:^(BOOL success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (!self) {
                    return;
                }
                if (!success) {
                    self.collectionStatusKey = @"openFailed";
                    self.renderCollection();
                }
            });
        }];
    };
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return section == 2 ? self.collectionPanel : nil;
}

-(UILabel *)collectionStatusLabel {
    if (!_collectionStatusLabel) {
        _collectionStatusLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(13)])
                .byNumberOfLines(0)
                .byAdjustsFontForContentSizeCategory(YES);
        });
        self.bindSecondaryTextColor(_collectionStatusLabel);
    }
    return _collectionStatusLabel;
}

-(UIView *)collectionPanel {
    if (!_collectionPanel) {
        _collectionPanel = jobsMakeView(^(__kindof UIView *view) {
            view.byBgColor(JobsUserInfoPageColor());
        });
        self.collectionStatusLabel.addOn(_collectionPanel).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self->_collectionPanel).offset(12);
            make.leading.equalTo(self->_collectionPanel).offset(12);
            make.trailing.equalTo(self->_collectionPanel).offset(-12);
        });
        NSMutableArray *buttons = NSMutableArray.new;
        @jobs_weakify(self)
        UIButton *previous = nil;
        for (NSUInteger index = 0; index < 3; index++) {
            UIButton *button = jobsMakeButton(^(__kindof UIButton *button) {
                button.jobsResetBtnTitleCor(JobsLabelColor)
                    .jobsResetBtnTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(15)])
                    .jobsResetBtnBgCor(JobsUserInfoCardColor())
                    .jobsResetBtnCornerRadiusValue(10)
                    .onClickBy(^(__unused UIButton *sender) {
                        @jobs_strongify(self)
                        if (!self) {
                            return;
                        }
                        if (index == 0) {
                            self.startCollection();
                        } else if (index == 1) {
                            self.refreshCollection();
                        } else if (index == 2) {
                            [self.collectionTimer invalidate];
                            self.collectionDeletionUnconfirmed = YES;
                            self.collectionStatusKey = @"clearFailed";
                            [self.collectionClient clearRemotely:YES completion:^(BOOL cleared) {
                                @jobs_strongify(self)
                                if (!self) {
                                    return;
                                }
                                self.collectionStatusKey = cleared ? @"clearDone" : @"clearFailed";
                                self.collectionDeletionUnconfirmed = !cleared;
                                self.renderCollection();
                            }];
                            self.renderCollection();

                        }
                    });
            });
            button.titleLabel.byNumberOfLines(0).byTextAlignment(NSTextAlignmentCenter);
            button.addOn(_collectionPanel).byAdd(^(MASConstraintMaker *make) {
                make.leading.equalTo(self->_collectionPanel).offset(12);
                make.trailing.equalTo(self->_collectionPanel).offset(-12);
                make.top.equalTo(previous ? previous.mas_bottom : self.collectionStatusLabel.mas_bottom).offset(10);
                make.height.mas_equalTo(MAX(48, ceil([UIFontMetrics.defaultMetrics scaledValueForValue:48])));
            });
            previous = button;
            [buttons addObject:button];
        }
        _collectionButtons = buttons.copy;
    }
    return _collectionPanel;
}

@end
