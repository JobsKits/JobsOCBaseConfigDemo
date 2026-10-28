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
        for (NSInteger section = 0; section < 2; section++) {
            controller.refreshSectionHeader(section);
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
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.collapsedSections containsIndex:section]) {
        return 0;
    }
    return section == 0 ? MAX(1, self.userInfoItems.count) : self.deviceInfoItems.count;
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
    if ([self.collapsedSections containsIndex:section]) {
        return nil;
    }
    return section == 0
        ? @"轻点任意信息项即可复制。空值保留为 nil。".jobsTr()
        : @"轻点复制；受限项仅复制系统说明。设备名称可能由 iOS 限制为 iPhone / iPad。".jobsTr();
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
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
    BOOL empty = indexPath.section == 0 && !self.userInfoItems.count;
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
        if (!self || section < 0 || section > 1) {
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
        if (!self || section < 0 || section > 1) {
            return;
        }
        // 先完成三个数组的创建，再配置它们，避免懒加载互相重入。
        (void)self.sectionHeaderViews;
        BOOL collapsed = [self.collapsedSections containsIndex:section];
        NSString *title = section == 0 ? @"用户信息".jobsTr() : @"本机信息".jobsTr();
        NSString *action = collapsed ? @"展开".jobsTr() : @"收起".jobsTr();
        NSUInteger count = section == 0 ? self.userInfoItems.count : self.deviceInfoItems.count;
        self.sectionTitleLabels[section].byText(title).byTextCor(JobsLabelColor);
        self.sectionCountLabels[section].byText([NSString stringWithFormat:@"%lu 项", (unsigned long)count]);
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
            .byAccessibilityLabel([NSString stringWithFormat:@"%@，%lu 项，%@，轻点%@", title, (unsigned long)count, collapsed ? @"已折叠" : @"已展开", action]);
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
        for (NSInteger section = 0; section < 2; section++) {
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

@end
