//
//  WidgetVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "WidgetVC.h"

typedef NS_ENUM(NSInteger, JobsWidgetDemoFamily) {
    JobsWidgetDemoFamilySmall = 0,
    JobsWidgetDemoFamilyMedium,
    JobsWidgetDemoFamilyLarge
};

@interface WidgetVC ()

Prop_assign()JobsWidgetDemoFamily widgetFamily;
Prop_assign()NSInteger counter;
Prop_strong()UIScrollView *widgetScrollView;
Prop_strong()UIView *contentView;
Prop_strong()UILabel *introLabel;
Prop_strong()UIView *familySelectorView;
Prop_strong()BaseButton *smallFamilyButton;
Prop_strong()BaseButton *mediumFamilyButton;
Prop_strong()BaseButton *largeFamilyButton;
Prop_strong()UIView *previewCard;
Prop_strong()UILabel *previewEyebrowLabel;
Prop_strong()UILabel *previewTitleLabel;
Prop_strong()UILabel *previewTimeLabel;
Prop_strong()UILabel *previewCounterLabel;
Prop_strong()UILabel *previewDescriptionLabel;
Prop_strong()BaseButton *increaseButton;
Prop_strong()BaseButton *refreshButton;
Prop_strong()UILabel *timelineLabel;
Prop_strong()UILabel *footnoteLabel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN WidgetVC
@interface WidgetVC (JobsPropertyDSLSetterAutogen_b71c1d8ad4)
-(void)setCounter:(NSInteger)data;
-(void)setWidgetFamily:(JobsWidgetDemoFamily)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END WidgetVC

@implementation WidgetVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(WidgetVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byTextCor(JobsLabelColor)
                    .byText(@"iOS Widget Demo".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(UIColor.systemGroupedBackgroundColor)
            .byNavBgCor(UIColor.systemBackgroundColor);
    };
}

- (void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(WidgetVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(UIColor.systemGroupedBackgroundColor);
        self.byCounter(JobsWidgetCenterBridge.jobsCounter());
        self.setupDemo();
        [self applyWidgetFamily:JobsWidgetDemoFamilyMedium
                         status:@"时间线：已生成当前快照"];
        self.syncHomeScreenWidgetWithStatus(@"桌面 Widget：共享状态已就绪");
    };
}

-(jobsByVoidBlock _Nonnull)setupDemo{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.widgetScrollView.byAlpha(1);
        self.contentView.byAlpha(1);
        self.introLabel.byAlpha(1);
        self.familySelectorView.byAlpha(1);
        self.smallFamilyButton.byAlpha(1);
        self.mediumFamilyButton.byAlpha(1);
        self.largeFamilyButton.byAlpha(1);
        self.previewCard.byAlpha(1);
        self.previewEyebrowLabel.byAlpha(1);
        self.previewTitleLabel.byAlpha(1);
        self.previewTimeLabel.byAlpha(1);
        self.previewCounterLabel.byAlpha(1);
        self.previewDescriptionLabel.byAlpha(1);
        self.increaseButton.byAlpha(1);
        self.refreshButton.byAlpha(1);
        self.timelineLabel.byAlpha(1);
        self.footnoteLabel.byAlpha(1);
    };
}

-(void)applyWidgetFamily:(JobsWidgetDemoFamily)family
                  status:(NSString *)status{
    self.byWidgetFamily(family);
    self.previewCard.byRemake(^(MASConstraintMaker *make) {
        make.top.equalTo(self.familySelectorView.mas_bottom).offset(JobsWidth(18));
        make.centerX.equalTo(self.contentView);
        if (family == JobsWidgetDemoFamilySmall) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(170), JobsWidth(170)));
        }else{
            make.left.right.equalTo(self.contentView).inset(JobsWidth(20));
            make.height.mas_equalTo(JobsWidth(family == JobsWidgetDemoFamilyMedium ? 174 : 310));
        }
    });
    self.refreshFamilyButtonStyles();
    self.refreshPreviewWithStatus(status);
}

-(jobsByVoidBlock _Nonnull)refreshFamilyButtonStyles{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray<BaseButton *> *buttons = @[self.smallFamilyButton,
                                          self.mediumFamilyButton,
                                          self.largeFamilyButton];
        [buttons enumerateObjectsUsingBlock:^(BaseButton * _Nonnull button, NSUInteger index, BOOL * _Nonnull stop) {
            BOOL selected = index == self.widgetFamily;
            button
                .jobsResetBtnTitleCor(selected ? UIColor.whiteColor : UIColor.labelColor)
                .jobsResetBtnBgCor(selected ? UIColor.systemBlueColor : UIColor.clearColor);
        }];
    };
}

-(jobsByStrBlock _Nonnull)refreshPreviewWithStatus{
    @jobs_weakify(self)
    return ^(NSString * status){
        @jobs_strongify(self)
        if (!self) return;
        NSString *familyText = nil;
        switch (self.widgetFamily) {
            /// 处理 JobsWidgetDemoFamilySmall 分支
            case JobsWidgetDemoFamilySmall:
                familyText = @"小号：一眼读取核心状态";
                break;
            /// 处理 JobsWidgetDemoFamilyMedium 分支
            case JobsWidgetDemoFamilyMedium:
                familyText = @"中号：展示状态与下一步行动";
                break;
            /// 处理 JobsWidgetDemoFamilyLarge 分支
            case JobsWidgetDemoFamilyLarge:
                familyText = @"大号：承载更完整的信息层级与时间线摘要";
                break;
        }
        self.previewTimeLabel.byText(NSDateFormatter.byDateFormatterWithDateFormat(@"HH:mm:ss")
                                     .byStringFromDate(NSDate.date));
        self.previewCounterLabel.byText([NSString stringWithFormat:@"今日进度 %ld / 12",(long)self.counter]);
        self.previewDescriptionLabel.byText(familyText);
        self.timelineLabel.byText([NSString stringWithFormat:@"%@ · %@",
                                   status,
                                   NSDateFormatter.byDateFormatterWithDateFormat(@"HH:mm:ss")
                                       .byStringFromDate(NSDate.date)]);
    };
}

-(jobsByVoidBlock _Nonnull)increaseCounter{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byCounter(self.counter >= 12 ? 1 : self.counter + 1);
        self.syncHomeScreenWidgetWithStatus(@"桌面 Widget：计数已同步");
    };
}

-(jobsByVoidBlock _Nonnull)reloadPreviewTimeline{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsWidgetCenterBridge.jobsReloadTimelines();
        self.refreshPreviewWithStatus(@"桌面 Widget：时间线已重载");
    };
}

-(jobsByStrBlock _Nonnull)syncHomeScreenWidgetWithStatus{
    @jobs_weakify(self)
    return ^(NSString * status){
        @jobs_strongify(self)
        if (!self) return;
        JobsWidgetCenterBridge.jobsSaveCounter(self.counter);
        self.refreshPreviewWithStatus(status);
    };
}

-(BaseButton *)makeFamilyButtonWithTitle:(NSString *)title
                                  family:(JobsWidgetDemoFamily)family{
    @jobs_weakify(self)
    return BaseButton.jobsInit()
        .jobsResetBtnTitle(title)
        .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(14))
        .jobsResetBtnCornerRadiusValue(JobsWidth(8))
        .onClickBy(^(__unused UIButton *sender) {
            @jobs_strongify(self)
            [self applyWidgetFamily:family
                             status:[NSString stringWithFormat:@"family：已切换为%@",title]];
        });
}
#pragma mark —— lazyLoad
-(UIScrollView *)widgetScrollView{
    if (!_widgetScrollView) {
        _widgetScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byAlwaysBounceVertical(YES)
                .byShowsVerticalScrollIndicator(NO)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    };return _widgetScrollView;
}

-(UIView *)contentView{
    if (!_contentView) {
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.clearColor)
                .addOn(self.widgetScrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.widgetScrollView);
                    make.width.equalTo(self.widgetScrollView);
                });
        });
    };return _contentView;
}

-(UILabel *)introLabel{
    if (!_introLabel) {
        _introLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"宿主联调页：切换 Widget family，修改状态，观察时间线快照如何重新排版。")
                .byTextCor(UIColor.secondaryLabelColor)
                .byFont(UIFontSystemFontOfSize(14))
                .byNumberOfLines(0)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(JobsWidth(20));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(20));
                });
        });
    };return _introLabel;
}

-(UIView *)familySelectorView{
    if (!_familySelectorView) {
        _familySelectorView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.systemGray5Color)
                .byCornerRadius(JobsWidth(10))
                .byClipsToBounds(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.introLabel.mas_bottom).offset(JobsWidth(16));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(20));
                    make.height.mas_equalTo(JobsWidth(42));
                });
        });
    };return _familySelectorView;
}

-(BaseButton *)smallFamilyButton{
    if (!_smallFamilyButton) {
        _smallFamilyButton = [self makeFamilyButtonWithTitle:@"小号"
                                                     family:JobsWidgetDemoFamilySmall]
            .addOn(self.familySelectorView)
            .byAdd(^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self.familySelectorView).inset(JobsWidth(3));
        });
    };return _smallFamilyButton;
}

-(BaseButton *)mediumFamilyButton{
    if (!_mediumFamilyButton) {
        _mediumFamilyButton = [self makeFamilyButtonWithTitle:@"中号"
                                                      family:JobsWidgetDemoFamilyMedium]
            .addOn(self.familySelectorView)
            .byAdd(^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.familySelectorView).inset(JobsWidth(3));
            make.left.equalTo(self.smallFamilyButton.mas_right).offset(JobsWidth(3));
            make.width.equalTo(self.smallFamilyButton);
        });
    };return _mediumFamilyButton;
}

-(BaseButton *)largeFamilyButton{
    if (!_largeFamilyButton) {
        _largeFamilyButton = [self makeFamilyButtonWithTitle:@"大号"
                                                     family:JobsWidgetDemoFamilyLarge]
            .addOn(self.familySelectorView)
            .byAdd(^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self.familySelectorView).inset(JobsWidth(3));
            make.left.equalTo(self.mediumFamilyButton.mas_right).offset(JobsWidth(3));
            make.width.equalTo(self.mediumFamilyButton);
        });
    };return _largeFamilyButton;
}

-(UIView *)previewCard{
    if (!_previewCard) {
        _previewCard = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.systemIndigoColor)
                .byCornerRadius(JobsWidth(22))
                .byClipsToBounds(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.familySelectorView.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(20));
                    make.height.mas_equalTo(JobsWidth(174));
                });
        });
    };return _previewCard;
}

-(UILabel *)previewEyebrowLabel{
    if (!_previewEyebrowLabel) {
        _previewEyebrowLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"WIDGETKIT · PREVIEW")
                .byTextCor([UIColor.whiteColor colorWithAlphaComponent:0.72])
                .byFont(UIFontWeightSemiboldSize(11))
                .addOn(self.previewCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.left.equalTo(self.previewCard).offset(JobsWidth(16));
                });
        });
    };return _previewEyebrowLabel;
}

-(UILabel *)previewTitleLabel{
    if (!_previewTitleLabel) {
        _previewTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"演武堂 · 小组件")
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightBoldSize(20))
                .addOn(self.previewCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.previewEyebrowLabel.mas_bottom).offset(JobsWidth(6));
                    make.left.right.equalTo(self.previewCard).inset(JobsWidth(16));
                });
        });
    };return _previewTitleLabel;
}

-(UILabel *)previewTimeLabel{
    if (!_previewTimeLabel) {
        _previewTimeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"--:--:--")
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontMonospacedDigitSystemWeightBoldSize(30))
                .addOn(self.previewCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.previewTitleLabel.mas_bottom).offset(JobsWidth(8));
                    make.left.right.equalTo(self.previewCard).inset(JobsWidth(16));
                });
        });
    };return _previewTimeLabel;
}

-(UILabel *)previewCounterLabel{
    if (!_previewCounterLabel) {
        _previewCounterLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor([UIColor.whiteColor colorWithAlphaComponent:0.86])
                .byFont(UIFontWeightSemiboldSize(13))
                .addOn(self.previewCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.previewTimeLabel.mas_bottom).offset(JobsWidth(3));
                    make.left.right.equalTo(self.previewCard).inset(JobsWidth(16));
                });
        });
    };return _previewCounterLabel;
}

-(UILabel *)previewDescriptionLabel{
    if (!_previewDescriptionLabel) {
        _previewDescriptionLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor([UIColor.whiteColor colorWithAlphaComponent:0.72])
                .byFont(UIFontSystemFontOfSize(12))
                .byNumberOfLines(2)
                .addOn(self.previewCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self.previewCard).inset(JobsWidth(16));
                });
        });
    };return _previewDescriptionLabel;
}

-(BaseButton *)increaseButton{
    if (!_increaseButton) {
        @jobs_weakify(self)
        _increaseButton = BaseButton.jobsInit()
            .jobsResetBtnTitle(@"计数 +1")
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
            .jobsResetBtnBgCor(UIColor.systemBlueColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(12))
            .onClickBy(^(__unused UIButton *sender) {
                @jobs_strongify(self)
                self.increaseCounter();
            })
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.previewCard.mas_bottom).offset(JobsWidth(16));
                make.left.equalTo(self.contentView).offset(JobsWidth(20));
                make.right.equalTo(self.contentView.mas_centerX).offset(JobsWidth(-6));
                make.height.mas_equalTo(JobsWidth(46));
            });
    };return _increaseButton;
}

-(BaseButton *)refreshButton{
    if (!_refreshButton) {
        @jobs_weakify(self)
        _refreshButton = BaseButton.jobsInit()
            .jobsResetBtnTitle(@"刷新时间线")
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
            .jobsResetBtnBgCor(UIColor.systemPurpleColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(12))
            .onClickBy(^(__unused UIButton *sender) {
                @jobs_strongify(self)
                self.reloadPreviewTimeline();
            })
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.previewCard.mas_bottom).offset(JobsWidth(16));
                make.left.equalTo(self.contentView.mas_centerX).offset(JobsWidth(6));
                make.right.equalTo(self.contentView).offset(JobsWidth(-20));
                make.height.mas_equalTo(JobsWidth(46));
            });
    };return _refreshButton;
}

-(UILabel *)timelineLabel{
    if (!_timelineLabel) {
        _timelineLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(UIColor.labelColor)
                .byFont(UIFontWeightSemiboldSize(13))
                .byNumberOfLines(0)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.increaseButton.mas_bottom).offset(JobsWidth(16));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(20));
                });
        });
    };return _timelineLabel;
}

-(UILabel *)footnoteLabel{
    if (!_footnoteLabel) {
        _footnoteLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"已接入真实 Widget Extension 与 App Group。真机运行宿主 App 一次后：回到系统桌面 → 长按空白处 → 点击“+”或“添加小组件” → 搜索“JobsOCBaseConfigDemo”（进入后显示“演武堂 OC 小组件”）→ 选择尺寸并添加。\n\n本页“计数 +1”和“刷新时间线”会重载桌面 Widget；iOS 不允许 App 直接弹出系统小组件库。")
                .byTextCor(UIColor.secondaryLabelColor)
                .byFont(UIFontSystemFontOfSize(13))
                .byNumberOfLines(0)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.timelineLabel.mas_bottom).offset(JobsWidth(14));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(20));
                    make.bottom.equalTo(self.contentView).offset(JobsWidth(-24));
                });
        });
    };return _footnoteLabel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN WidgetVC
-(JobsRetWidgetVCByJobsWidgetDemoFamilyBlock _Nonnull)byWidgetFamily{
    @jobs_weakify(self)
    return ^__kindof WidgetVC * _Nullable(JobsWidgetDemoFamily data){
        @jobs_strongify(self)
        [self setWidgetFamily:data];
        return self;
    };
}

-(JobsRetWidgetVCByNSIntegerBlock _Nonnull)byCounter{
    @jobs_weakify(self)
    return ^__kindof WidgetVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCounter:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END WidgetVC
@end
