//
//  JobsOCWorldClockVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import "JobsOCWorldClockVC.h"

// 独立复用标识，防止当前卡片进入全球普通行的复用队列。
@interface JobsOCWorldClockCurrentCell : UITableViewCell

@end

@implementation JobsOCWorldClockCurrentCell

@end

static NSString *const JobsOCWorldClock12HourPreferenceKey = @"com.jobs.worldClock.uses12HourFormat";

@interface JobsOCWorldClockVC ()

Prop_strong()UILabel *navigationTitleLabel;
Prop_strong()UIView *formatControls;
Prop_strong()UITableViewCell *currentCardCell;
Prop_strong()UIView *currentCard;
Prop_strong()UILabel *currentTitle;
Prop_strong()UILabel *currentZone;
Prop_strong()UILabel *currentTime;
Prop_strong()UILabel *currentCalendarDate;
Prop_strong()UILabel *formatLabel;
Prop_strong()UISwitch *formatSwitch;
Prop_strong()UITableView *worldTableView;
Prop_strong()UIButton *emptyButton;
Prop_strong()NSDateFormatter *dateFormatter;
Prop_strong()NSDateFormatter *cityFormatter;
Prop_strong()NSDate *currentDate;
Prop_copy()NSDictionary *currentRow;
Prop_copy()NSArray<NSDictionary *> *worldRows;
Prop_copy()NSString *structureSignature;
Prop_copy()NSString *timerIdentifier;
Prop_assign()BOOL pageVisible;
Prop_assign()BOOL uses12Hours;

-(jobsByVoidBlock _Nonnull)refreshWorldClocks;
-(jobsByVoidBlock _Nonnull)reloadPresentation;
-(jobsByVoidBlock _Nonnull)refreshBackButtonTitle;
-(jobsByVoidBlock _Nonnull)startClockTimer;
-(jobsByVoidBlock _Nonnull)stopClockTimer;
-(JobsRetStrByIntegerBlock _Nonnull)offsetText;
-(JobsRetUIButtonModelByVoidBlock _Nonnull)emptyButtonModel;
-(void)configureCell:(UITableViewCell *)cell row:(NSDictionary *)row current:(BOOL)current;

@end

@implementation JobsOCWorldClockVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self->_uses12Hours = [NSUserDefaults.standardUserDefaults boolForKey:JobsOCWorldClock12HourPreferenceKey];
    self->_timerIdentifier = [NSString stringWithFormat:@"JobsOCWorldClockVC.%p", self];
    self.byGKNavTitleView(self.navigationTitleLabel);
    self.makeNavByAlpha(1);
    self.formatControls.byAlpha(1);
    self.worldTableView.byAlpha(1);
    self.emptyButton.byAlpha(1);
    @jobs_weakify(self)
    for (NSString *name in @[语言切换, JobsThemeDidChangeNotification, UIContentSizeCategoryDidChangeNotification]) {
        [self addNotificationName:name block:^(id _Nullable weakSelf, id _Nullable arg) {
            @jobs_strongify(self)
            if (self) {
                self.reloadPresentation();
            }
        }];
    }
    for (NSString *name in @[NSSystemTimeZoneDidChangeNotification, UIApplicationSignificantTimeChangeNotification]) {
        [self addNotificationName:name block:^(id _Nullable weakSelf, id _Nullable arg) {
            @jobs_strongify(self)
            if (self && self.pageVisible) {
                [NSTimeZone resetSystemTimeZone];
                self.refreshWorldClocks();
            }
        }];
    }
    for (NSString *name in @[UIApplicationWillResignActiveNotification, UIApplicationDidEnterBackgroundNotification]) {
        [self addNotificationName:name block:^(id _Nullable weakSelf, id _Nullable arg) {
            @jobs_strongify(self)
            if (self) {
                self.stopClockTimer();
            }
        }];
    }
    [self addNotificationName:UIApplicationDidBecomeActiveNotification block:^(id _Nullable weakSelf, id _Nullable arg) {
        @jobs_strongify(self)
        if (self && self.pageVisible) {
            self.refreshWorldClocks();
            self.startClockTimer();
        }
    }];
    self.reloadPresentation();
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.byGKNavTitleView(self.navigationTitleLabel);
    self.refreshBackButtonTitle();
    self->_pageVisible = YES;
    self.refreshWorldClocks();
    self.startClockTimer();
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self->_pageVisible = NO;
    self.stopClockTimer();
}

-(void)dealloc{
    if (_timerIdentifier.length) {
        JobsTimerMgr.shared().stopAndRemove(_timerIdentifier);
    }
    JobsRemoveNotification(self);
}

-(jobsByVoidBlock _Nonnull)reloadPresentation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.isViewLoaded) {
            return;
        }
        self->_dateFormatter = nil;
        self->_cityFormatter = nil;
        self->_structureSignature = nil;
        self.view.byBgColor(JobsSystemBackgroundColor);
        NSString *title = @"世界时钟".jobsTr();
        self.byTitle(title);
        self.viewModel.textModel.byAttributedTitle(nil).byText(title);
        self.byGKNavTitle(title);
        self.navigationTitleLabel.byText(title).byTextCor(JobsLabelColor);
        self.byGKNavTitleView(self.navigationTitleLabel);
        self.refreshBackButtonTitle();
        self.formatControls.byBgColor(JobsSecondarySystemGroupedBackgroundColor);
        self.formatLabel.byText((self.uses12Hours ? @"12小时制" : @"24小时制").jobsTr())
            .byTextCor(JobsLabelColor)
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(17)]);
        self.formatSwitch.byOn(self.uses12Hours);
        self.formatSwitch.accessibilityLabel = (self.uses12Hours ? @"12小时制" : @"24小时制").jobsTr();
        self.worldTableView.bySeparatorColor(JobsSeparatorColor);
        self.emptyButton.resetByButtonModel(self.emptyButtonModel(), NO).byTintColor(JobsSecondaryLabelColor);
        self.refreshWorldClocks();
    };
}

-(jobsByVoidBlock _Nonnull)refreshBackButtonTitle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        UIBarButtonItem *item = self.gk_navLeftBarButtonItem ?: self.gk_navLeftBarButtonItems.firstObject;
        if ([item.customView isKindOfClass:UIButton.class]) {
            ((UIButton *)item.customView)
                .jobsResetBtnTitle(@"返回".jobsTr())
                .byAccessibilityLabel(@"返回".jobsTr())
                .byAccessibilityIdentifier(@"jobs.worldClock.back");
        }
    };
}

-(jobsByVoidBlock _Nonnull)refreshWorldClocks{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.isViewLoaded) {
            return;
        }
        self->_currentDate = NSDate.date;
        NSDictionary *snapshot = [JobsOCWorldClockCatalog snapshotForDate:self.currentDate
                                                       currentTimeZone:NSTimeZone.bySystemTimeZone()];
        self->_currentRow = snapshot[@"current"];
        self->_worldRows = snapshot[@"world"];
        NSMutableArray<NSString *> *signatureParts = jobsMakeMutArr(^(NSMutableArray *array) {});
        for (NSDictionary *row in [@[self.currentRow] arrayByAddingObjectsFromArray:self.worldRows]) {
            NSTimeZone *zone = row[@"zone"];
            self.dateFormatter.byTimeZone(zone);
            [signatureParts addObject:[NSString stringWithFormat:@"%@|%@|%@", zone.name, row[@"offset"],
                [self.dateFormatter stringFromDate:self.currentDate]]];
        }
        NSString *signature = [signatureParts componentsJoinedByString:@";"];
        if (![self.structureSignature isEqualToString:signature]) {
            self->_structureSignature = signature;
            CGPoint offset = self.worldTableView.contentOffset;
            [self.worldTableView reloadData];
            [self.worldTableView layoutIfNeeded];
            self.worldTableView.byContentOffset(offset);
        } else {
            // 秒值只更新可见行，避免整表重载引起滚动与切换位置跳动。
            for (NSIndexPath *indexPath in self.worldTableView.indexPathsForVisibleRows) {
                NSDictionary *row = indexPath.section == 0 ? self.currentRow : self.worldRows[indexPath.row];
                [self configureCell:[self.worldTableView cellForRowAtIndexPath:indexPath]
                                row:row
                            current:indexPath.section == 0];
            }
        }
        self.emptyButton.byHidden(self.worldRows.count > 0);
    };
}

-(jobsByVoidBlock _Nonnull)startClockTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.pageVisible || UIApplication.sharedApplication.applicationState != UIApplicationStateActive) {
            return;
        }
        JobsTimerMgr.shared().byUpsertTimer(self.timerIdentifier,
                                          JobsTimerTypeGCD,
                                          JobsTimerBackgroundPolicyPauseAndResume,
                                          YES,
                                          ^(JobsTimer *timer) {
            timer.byTimeInterval(1).byQueue(dispatch_get_main_queue());
        }, ^{
            @jobs_strongify(self)
            if (self && self.pageVisible) {
                self.refreshWorldClocks();
            }
        });
    };
}

-(jobsByVoidBlock _Nonnull)stopClockTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (self.timerIdentifier.length) {
            JobsTimerMgr.shared().byStopAndRemove(self.timerIdentifier);
        }
    };
}

-(JobsRetStrByIntegerBlock _Nonnull)offsetText{
    return ^NSString *(NSInteger offset) {
        NSInteger minutes = labs(offset) / 60;
        return [NSString stringWithFormat:@"UTC%@%02ld:%02ld", offset < 0 ? @"−" : @"+",
            (long)(minutes / 60), (long)(minutes % 60)];
    };
}

-(UILabel *)navigationTitleLabel{
    if (!_navigationTitleLabel) {
        _navigationTitleLabel = jobsMakeLabel(^(UILabel *label) {
            label.byText(@"世界时钟".jobsTr())
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightRegularSize(18))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .byLineBreakMode(NSLineBreakByWordWrapping)
                .byFrame(CGRectMake(0, 0, MIN(232, MAX(44, CGRectGetWidth(self.view.bounds) - 144)), 44))
                .byAccessibilityElement(YES)
                .byAccessibilityIdentifier(@"jobs.worldClock.title");
        });
    }
    return _navigationTitleLabel;
}

-(UIView *)formatControls{
    if (!_formatControls) {
        _formatControls = jobsMakeView(^(UIView *view) {
            view.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.height.mas_greaterThanOrEqualTo(56);
            });
        });
        self.formatLabel.byAlpha(1);
        self.formatSwitch.byAlpha(1);
    }
    return _formatControls;
}

-(UILabel *)formatLabel{
    if (!_formatLabel) {
        _formatLabel = jobsMakeLabel(^(UILabel *label) {
            label.byNumberOfLines(0).addOn(self.formatControls).byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.formatControls).offset(16);
                make.top.equalTo(self.formatControls).offset(12);
                make.bottom.equalTo(self.formatControls).offset(-12);
                make.right.lessThanOrEqualTo(self.formatControls).offset(-90);
            });
        });
    }
    return _formatLabel;
}

-(UISwitch *)formatSwitch{
    if (!_formatSwitch) {
        @jobs_weakify(self)
        _formatSwitch = jobsMakeSwitch(^(UISwitch *toggle) {
            toggle.onJobsChange(^(__kindof UIControl *control) {
                @jobs_strongify(self)
                if (!self) {
                    return;
                }
                self->_uses12Hours = ((UISwitch *)control).on;
                [NSUserDefaults.standardUserDefaults setBool:self.uses12Hours forKey:JobsOCWorldClock12HourPreferenceKey];
                self.formatLabel.byText((self.uses12Hours ? @"12小时制" : @"24小时制").jobsTr());
                self.formatSwitch.accessibilityLabel = (self.uses12Hours ? @"12小时制" : @"24小时制").jobsTr();
                /// 重建缓存行及动态行高；保持偏移，不遗留离屏的旧小时表达。
                self->_structureSignature = nil;
                self.refreshWorldClocks();
            }).addOn(self.formatControls).byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self.formatControls).offset(-16);
                make.centerY.equalTo(self.formatControls);
            });
            toggle.accessibilityIdentifier = @"jobs.worldClock.12HourSwitch";
        });
    }
    return _formatSwitch;
}

-(UITableView *)worldTableView{
    if (!_worldTableView) {
        _worldTableView = jobsMakeTableViewByPlain(^(__kindof UITableView *tableView) {
            tableView.byDelegate(self).byDataSource(self)
                .byRowHeight(UITableViewAutomaticDimension).byEstimatedRowHeight(112)
                .byTableFooterView(jobsMakeView(^(UIView *view) {
                    view.byBgColor(JobsClearColor);
                }))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.formatControls.mas_bottom);
                });
        });
    }
    return _worldTableView;
}

-(NSDateFormatter *)dateFormatter{
    if (!_dateFormatter) {
        _dateFormatter = jobsMakeDateFormatter(^(NSDateFormatter *formatter) {
            formatter.byLocale([NSLocale localeWithLocaleIdentifier:LanMgr.languageCodeByAppLanguage(LanMgr.language)])
                .byDateStyle(NSDateFormatterFullStyle).byTimeStyle(NSDateFormatterNoStyle);
        });
    }
    return _dateFormatter;
}

-(NSDateFormatter *)cityFormatter{
    if (!_cityFormatter) {
        _cityFormatter = jobsMakeDateFormatter(^(NSDateFormatter *formatter) {
            formatter.byLocale([NSLocale localeWithLocaleIdentifier:LanMgr.languageCodeByAppLanguage(LanMgr.language)])
                .byDateFormat(@"VVV");
        });
    }
    return _cityFormatter;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? (self.currentRow ? 1 : 0) : self.worldRows.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return section == 0 ? nil : @"世界时区".jobsTr();
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    if ([view isKindOfClass:UITableViewHeaderFooterView.class]) {
        ((UITableViewHeaderFooterView *)view).textLabel.byTextCor(JobsLabelColor.colorWithAlphaComponentBy(.72));
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = indexPath.section == 0 ? self.currentCardCell : UITableViewCell.cellStyleSubtitleByTableView(tableView);
    NSDictionary *row = indexPath.section == 0 ? self.currentRow : self.worldRows[indexPath.row];
    [self configureCell:cell row:row current:indexPath.section == 0];
    return cell;
}

-(void)configureCell:(UITableViewCell *)cell row:(NSDictionary *)row current:(BOOL)current{
    NSTimeZone *zone = row[@"zone"];
    self.cityFormatter.byTimeZone(zone);
    self.dateFormatter.byTimeZone(zone);
    NSString *city = [self.cityFormatter stringFromDate:self.currentDate];
    if ([zone.name isEqualToString:@"Etc/GMT+12"]) {
        city = @"贝克岛".jobsTr();
    }
    if (!city.length) {
        city = [zone.name.lastPathComponent stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    }
    NSString *place = current ? @"设备当前时区".jobsTr() : city;
    NSString *time = [JobsOCWorldClockCatalog timeForDate:self.currentDate timeZone:zone uses12Hours:self.uses12Hours];
    NSString *date = [self.dateFormatter stringFromDate:self.currentDate];
    NSString *detail = [NSString stringWithFormat:@"%@\n%@ · %@", date, self.offsetText([row[@"offset"] integerValue]), zone.name];
    if (current) {
        BOOL dark = JobsThemeCenter.shared.isDarkMode;
        UIColor *foreground = dark ? RGB_COLOR(212, 255, 241) : RGB_COLOR(0, 77, 64);
        UIColor *secondary = dark ? RGB_COLOR(170, 219, 201) : RGB_COLOR(21, 99, 82);
        self.currentCard.byBgColor(dark ? RGB_COLOR(14, 61, 51) : RGB_COLOR(137, 249, 218));
        self.currentTitle.byText(@"设备当前时区".jobsTr()).byTextCor(foreground)
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(20)]);
        self.currentZone.byText([NSString stringWithFormat:@"%@ · %@\n%@", city,
            self.offsetText([row[@"offset"] integerValue]), zone.name]).byTextCor(secondary)
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(15)]);
        self.currentTime.byText(time).byTextCor(foreground)
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontMonospacedDigitSystemWeightRegularSize(34)]);
        self.currentCalendarDate.byText(date).byTextCor(secondary)
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(15)]);
        cell.byBgColor(JobsSystemBackgroundColor);
        cell.accessibilityLabel = [NSString stringWithFormat:@"%@, %@, %@, %@, %@", city, date, time,
            self.offsetText([row[@"offset"] integerValue]), zone.name];
        return;
    }
    cell.byTextLabel(^(__kindof UILabel *label) {
        label.byText([NSString stringWithFormat:@"%@\n%@", place, time])
            .byTextCor(JobsLabelColor)
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontMonospacedDigitSystemWeightRegularSize(18)])
            .byNumberOfLines(0).byLineBreakMode(NSLineBreakByWordWrapping);
    }).byDetailTextLabel(^(__kindof UILabel *label) {
        label.byText(detail).byTextCor(JobsLabelColor.colorWithAlphaComponentBy(.72))
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(14)])
            .byNumberOfLines(0).byLineBreakMode(NSLineBreakByWordWrapping);
    }).bySelectionStyle(UITableViewCellSelectionStyleNone)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byBgColor(current ? JobsSecondarySystemGroupedBackgroundColor : JobsSystemBackgroundColor);
    cell.accessibilityLabel = [NSString stringWithFormat:@"%@, %@, %@, %@, %@", place, date, time,
        self.offsetText([row[@"offset"] integerValue]), zone.name];
}

-(UITableViewCell *)currentCardCell{
    if (!_currentCardCell) {
        _currentCardCell = (UITableViewCell *)JobsOCWorldClockCurrentCell.initTableViewCellWithStyle(UITableViewCellStyleDefault)
            .bySelectionStyle(UITableViewCellSelectionStyleNone)
            .bySeparatorInset(UIEdgeInsetsMake(0, 10000, 0, 0))
            .byAccessibilityIdentifier(@"jobs.worldClock.local");
        _currentCard = jobsMakeView(^(UIView *view) {
            view.byCornerRadius(16).byClipsToBounds(YES)
                .byAccessibilityIdentifier(@"jobs.worldClock.currentCard")
                .addOn(self->_currentCardCell.contentView).byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self->_currentCardCell.contentView).inset(16);
                    make.top.bottom.equalTo(self->_currentCardCell.contentView).inset(12);
                });
        });
        _currentTitle = jobsMakeLabel(^(UILabel *label) {
            label.byNumberOfLines(0).addOn(self->_currentCard).byAdd(^(MASConstraintMaker *make) {
                make.left.right.top.equalTo(self->_currentCard).inset(20);
            });
        });
        _currentZone = jobsMakeLabel(^(UILabel *label) {
            label.byNumberOfLines(0).addOn(self->_currentCard).byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self->_currentCard).inset(20);
                make.top.equalTo(self->_currentTitle.mas_bottom).offset(4);
            });
        });
        _currentTime = jobsMakeLabel(^(UILabel *label) {
            label.byNumberOfLines(0).addOn(self->_currentCard).byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self->_currentCard).inset(20);
                make.top.equalTo(self->_currentZone.mas_bottom).offset(18);
            });
        });
        _currentCalendarDate = jobsMakeLabel(^(UILabel *label) {
            label.byNumberOfLines(0).addOn(self->_currentCard).byAdd(^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self->_currentCard).inset(20);
                make.top.equalTo(self->_currentTime.mas_bottom).offset(8);
            });
        });
    }
    return _currentCardCell;
}

-(UIButton *)emptyButton{
    if (!_emptyButton) {
        _emptyButton = UIButton.initByButtonModel(self.emptyButtonModel()).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.center.equalTo(self.worldTableView);
            make.left.equalTo(self.worldTableView).offset(24);
            make.right.equalTo(self.worldTableView).offset(-24);
            make.height.mas_greaterThanOrEqualTo(160);
        });
    }
    return _emptyButton;
}

-(JobsRetUIButtonModelByVoidBlock _Nonnull)emptyButtonModel{
    @jobs_weakify(self)
    return ^UIButtonModel *{
        @jobs_strongify(self)
        return jobsMakeButtonModel(^(__kindof UIButtonModel *model) {
            model.byTitle(@"暂无时区数据".jobsTr()).byTitleCor(JobsLabelColor)
                .byTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(22)])
                .byTitleLineBreakMode(NSLineBreakByWordWrapping).byTextAlignment(NSTextAlignmentCenter)
                .bySubTitle(@"轻点重新加载".jobsTr()).bySubTitleCor(JobsSecondaryLabelColor)
                .bySubTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(16)])
                .bySubtitleLineBreakMode(NSLineBreakByWordWrapping).bySubTextAlignment(NSTextAlignmentCenter)
                .byNormalImage(@"globe".sys_img).byImagePlacement(NSDirectionalRectEdgeTop).byImagePadding(16)
                .byBaseBackgroundColor(JobsClearColor).byClickEventBlock(^id(id _Nullable data) {
                    @jobs_strongify(self)
                    if (self) {
                        self.refreshWorldClocks();
                    }
                    return nil;
                });
        });
    };
}

@end
