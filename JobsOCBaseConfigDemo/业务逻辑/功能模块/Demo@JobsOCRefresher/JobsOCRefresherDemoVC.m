//
//  JobsOCRefresherDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#import "JobsOCRefresherDemoVC.h"

static const NSInteger JobsOCRefresherDemoInitialVerticalRows = 8;
static const NSInteger JobsOCRefresherDemoInitialHorizontalColumns = 7;

@interface JobsOCRefresherDemoVC ()

Prop_strong()UITextView *instructionTextView;
Prop_strong()UISegmentedControl *animatorSegmentedControl;
Prop_strong()UILabel *horizontalTitleLabel;
Prop_strong()UILabel *verticalTitleLabel;
Prop_strong()UIScrollView *horizontalScrollView;
Prop_strong()UIScrollView *verticalScrollView;
Prop_strong()UIView *horizontalContentView;
Prop_strong()UIView *verticalContentView;
Prop_strong()NSMutableArray<UIView *> *horizontalTileMutArr;
Prop_strong()NSMutableArray<UIView *> *verticalTileMutArr;
Prop_strong()NSMapTable<UIView *, UILabel *> *tileTitleLabelMap;
Prop_strong()NSMapTable<UIView *, UILabel *> *tileSubTitleLabelMap;
Prop_copy()NSArray<id<JobsRefreshAnimatorProtocol>> *refreshAnimators;
Prop_copy()NSArray<NSString *> *refreshAnimatorTitles;
Prop_assign()NSInteger horizontalColumnCount;
Prop_assign()NSInteger verticalRowCount;
Prop_assign()NSInteger verticalRefreshCount;
Prop_assign()NSInteger verticalLoadCount;
Prop_assign()NSInteger horizontalRefreshCount;
Prop_assign()NSInteger horizontalLoadCount;
Prop_assign()BOOL didBindRefresher;
Prop_assign()BOOL didAutoStart;

-(jobsByVoidBlock _Nonnull)bindRefresherIfNeeded;
-(jobsByVoidBlock _Nonnull)animatorSelectionDidChange;
-(jobsByVoidBlock _Nonnull)startHeaderRefresh;
-(jobsByVoidBlock _Nonnull)rebuildHorizontalTiles;
-(jobsByVoidBlock _Nonnull)rebuildVerticalTiles;
-(jobsByVoidBlock _Nonnull)layoutDemoContent;
-(jobsByVoidBlock _Nonnull)layoutHorizontalContent;
-(jobsByVoidBlock _Nonnull)layoutVerticalContent;
-(jobsByVoidBlock _Nonnull)applyTheme;
-(JobsRetBOOLByVoidBlock _Nonnull)isDarkTheme;
-(JobsRetUIStatusBarStyleByVoidBlock _Nonnull)themeStatusBarStyle;
-(void)runRefreshAtPosition:(JobsOCRefreshPosition)position
                 scrollView:(UIScrollView *)scrollView
                      title:(NSString *)title
                 completion:(nullable jobsByVoidBlock)completion;
-(jobsByStrBlock _Nonnull)updateStatusByTitle;
-(JobsOCRefreshConfig *)refreshConfigWithIdle:(NSString *)idleText
                                      pulling:(NSString *)pullingText
                                        ready:(NSString *)readyText
                                      running:(NSString *)runningText;
-(UIView *)tileViewWithTitle:(NSString *)title
                    subTitle:(NSString *)subTitle
                       index:(NSInteger)index;
-(JobsRetUIColorByNSIntegerBlock _Nonnull)tileColorAtIndex;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCRefresherDemoVC
@interface JobsOCRefresherDemoVC (JobsPropertyDSLSetterAutogen_8cab30efeb)
-(void)setDidAutoStart:(BOOL)data;
-(void)setDidBindRefresher:(BOOL)data;
-(void)setHorizontalColumnCount:(NSInteger)data;
-(void)setVerticalRowCount:(NSInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCRefresherDemoVC

@implementation JobsOCRefresherDemoVC
-(instancetype)init{
    if (self = [super init]) {
        _verticalRowCount = JobsOCRefresherDemoInitialVerticalRows;
        _horizontalColumnCount = JobsOCRefresherDemoInitialHorizontalColumns;
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRefresherDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"重写MJRefresh".jobsTr())
                    .byFont(UIFontWeightRegularSize(18))
                    .byTextCor(JobsLabelColor);
            })
            .bySubTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"横向/纵向刷新与加载更多".jobsTr())
                    .byFont(UIFontWeightRegularSize(11))
                    .byTextCor(JobsSecondaryLabelColor);
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRefresherDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        @jobs_weakify(self)
        [self addNotificationName:JobsThemeDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            self.applyTheme();
        }];
        self.makeNavByAlpha(1);
        self.gk_navTitleViewBy(self.viewModel);
        self.instructionTextView.byAlpha(1);
        self.animatorSegmentedControl.byAlpha(1);
        self.horizontalTitleLabel.byAlpha(1);
        self.horizontalScrollView.byAlpha(1);
        self.verticalTitleLabel.byAlpha(1);
        self.verticalScrollView.byAlpha(1);
        self.applyTheme();
        self.bindRefresherIfNeeded();
        self.rebuildHorizontalTiles();
        self.rebuildVerticalTiles();
        self.updateStatusByTitle(@"等待触发".jobsTr());
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRefresherDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        if (self.didAutoStart) return;
        self.byDidAutoStart(YES);
        self.startHeaderRefresh();
    };
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRefresherDemoVC.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
        if (!self.isViewLoaded) return;
        if (@available(iOS 13.0, *)) {
            if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
                self.applyTheme();
            }
        }
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRefresherDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        self.layoutDemoContent();
    };
}

-(jobsByVoidBlock _Nonnull)applyTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byGKStatusBarStyle(self.themeStatusBarStyle())
            .byGKBackStyle(self.isDarkTheme() ? GKNavigationBarBackStyleWhite : GKNavigationBarBackStyleBlack)
            .byGKNavBackgroundColor(JobsSystemBackgroundColor)
            .byGKNavShadowColor(JobsSeparatorColor)
            .byGKNavTitleColor(JobsLabelColor);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.instructionTextView
            .byTextCor(JobsSecondaryLabelColor)
            .byBgColor(JobsSecondarySystemBackgroundColor);
        self.animatorSegmentedControl
            .byTintColor(JobsLabelColor)
            .byBgColor(JobsTertiarySystemBackgroundColor);
        [self.animatorSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: JobsLabelColor}
                                                      forState:UIControlStateNormal];
        [self.animatorSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: JobsLabelColor}
                                                      forState:UIControlStateSelected];
        if (@available(iOS 13.0, *)) {
            self.animatorSegmentedControl.bySelectedSegmentTintColor(JobsSystemBackgroundColor);
        }
        self.horizontalTitleLabel.byTextCor(JobsLabelColor);
        self.verticalTitleLabel.byTextCor(JobsLabelColor);
        self.horizontalScrollView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.horizontalContentView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.verticalScrollView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.verticalContentView.byBgColor(JobsSecondarySystemBackgroundColor);
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)isDarkTheme{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return JobsThemeCenter.shared.isDarkMode;
    };
}

-(JobsRetUIStatusBarStyleByVoidBlock _Nonnull)themeStatusBarStyle{
    @jobs_weakify(self)
    return ^UIStatusBarStyle{
        @jobs_strongify(self)
        if (!self) return (UIStatusBarStyle){0};
        if (@available(iOS 13.0, *)) {
            return self.isDarkTheme() ? UIStatusBarStyleLightContent : UIStatusBarStyleDarkContent;
        };return UIStatusBarStyleDefault;
    };
}

-(jobsByVoidBlock _Nonnull)bindRefresherIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.didBindRefresher) return;
        self.byDidBindRefresher(YES);
        @jobs_weakify(self)
        self.horizontalScrollView.jobs_setHorizontalRefreshMode(JobsOCRefreshHorizontalModeRefreshRightLoadLeft);
        self.horizontalScrollView.jobs_enableRefreshHaptics(YES);
        [self.horizontalScrollView jobs_bySideRefreshAt:JobsOCRefreshPositionLeft
                                                 config:[self refreshConfigWithIdle:@"右拉刷新"
                                                                            pulling:@"继续右拉"
                                                                              ready:@"松开刷新"
                                                                            running:@"水平刷新中"]
                                                 action:^{
            @jobs_strongify(self)
            [self runRefreshAtPosition:JobsOCRefreshPositionLeft
                             scrollView:self.horizontalScrollView
                                  title:@"水平刷新"
                             completion:^{
                @jobs_strongify(self)
                self.horizontalRefreshCount += 1;
                self.byHorizontalColumnCount(MAX(JobsOCRefresherDemoInitialHorizontalColumns, self.horizontalColumnCount));
                self.rebuildHorizontalTiles();
            }];
        }];
        [self.horizontalScrollView jobs_bySideRefreshAt:JobsOCRefreshPositionRight
                                                 config:[self refreshConfigWithIdle:@"左拉加载"
                                                                            pulling:@"继续左拉"
                                                                              ready:@"松开加载"
                                                                            running:@"水平加载中"]
                                                 action:^{
            @jobs_strongify(self)
            [self runRefreshAtPosition:JobsOCRefreshPositionRight
                             scrollView:self.horizontalScrollView
                                  title:@"水平加载更多"
                             completion:^{
                @jobs_strongify(self)
                self.horizontalLoadCount += 1;
                self.horizontalColumnCount += 2;
                self.rebuildHorizontalTiles();
            }];
        }];
        self.verticalScrollView.jobs_enableRefreshHaptics(YES);
        JobsOCRefreshConfig *todayNewsConfig = [self refreshConfigWithIdle:@"下拉刷新"
                                                                   pulling:@"继续下拉"
                                                                     ready:@"松开刷新"
                                                                   running:@"垂直刷新中"];
        todayNewsConfig.byShowsText(NO);
        todayNewsConfig.byAnimator(self.refreshAnimators.firstObject);
        [self.verticalScrollView jobs_byRefreshHeaderWithConfig:todayNewsConfig
                                                     action:^{
            @jobs_strongify(self)
            [self runRefreshAtPosition:JobsOCRefreshPositionHeader
                             scrollView:self.verticalScrollView
                                  title:@"垂直刷新"
                            completion:^{
                @jobs_strongify(self)
                self.verticalRefreshCount += 1;
                self.byVerticalRowCount(MAX(JobsOCRefresherDemoInitialVerticalRows, self.verticalRowCount));
                self.rebuildVerticalTiles();
            }];
        }];
        JobsOCRefreshConfig *douyinConfig = [self refreshConfigWithIdle:@"上拉加载"
                                                               pulling:@"继续上拉"
                                                                 ready:@"松开加载"
                                                               running:@"垂直加载中"];
        douyinConfig.byAnimator([[JobsDouyinRefreshView alloc] initWithConfig:JobsDouyinRefreshConfig.config()]);
        [self.verticalScrollView jobs_byRefreshFooterWithConfig:douyinConfig
                                                     action:^{
            @jobs_strongify(self)
            [self runRefreshAtPosition:JobsOCRefreshPositionFooter
                             scrollView:self.verticalScrollView
                                  title:@"垂直加载更多"
                            completion:^{
                @jobs_strongify(self)
                self.verticalLoadCount += 1;
                self.verticalRowCount += 2;
                self.rebuildVerticalTiles();
            }];
        }];
    };
}

-(jobsByVoidBlock _Nonnull)animatorSelectionDidChange{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSInteger index = self.animatorSegmentedControl.selectedSegmentIndex;
        if (index < 0 || index >= self.refreshAnimators.count) return;
        [self.verticalScrollView jobs_replaceRefreshAnimator:self.refreshAnimators[index]
                                                  atPosition:JobsOCRefreshPositionHeader];
        self.updateStatusByTitle([NSString stringWithFormat:@"已切换：%@", self.refreshAnimatorTitles[index]]);
        self.startHeaderRefresh();
    };
}

-(jobsByVoidBlock _Nonnull)startHeaderRefresh{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.verticalScrollView jobs_switchRefreshAt:JobsOCRefreshPositionHeader
                                              toState:JobsOCRefreshStateRefreshing];
    };
}

-(void)runRefreshAtPosition:(JobsOCRefreshPosition)position
                 scrollView:(UIScrollView *)scrollView
                      title:(NSString *)title
                 completion:(jobsByVoidBlock)completion{
    self.updateStatusByTitle(title);
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        if (completion) completion();
        self.layoutDemoContent();
        [scrollView jobs_switchRefreshAt:position
                                  toState:JobsOCRefreshStateIdle];
        self.updateStatusByTitle([NSString stringWithFormat:@"%@完成", title]);
    });
}

-(jobsByStrBlock _Nonnull)updateStatusByTitle{
    @jobs_weakify(self)
    return ^(NSString * title){
        @jobs_strongify(self)
        if (!self) return;
        self.instructionTextView.byText([NSString stringWithFormat:
            @"JobsOCRefresher 管四向状态机；JobsFuseAnimation 提供可热插拔的 Header 动画。\n"
             "点选动画即原位替换并自动下拉；页面首次进入也会自动演示一次。\n"
             "%@｜水平：刷新 %ld / 加载 %ld｜垂直：刷新 %ld / 加载 %ld",
            title,
            (long)self.horizontalRefreshCount,
            (long)self.horizontalLoadCount,
            (long)self.verticalRefreshCount,
            (long)self.verticalLoadCount]);
    };
}

-(JobsOCRefreshConfig *)refreshConfigWithIdle:(NSString *)idleText
                                      pulling:(NSString *)pullingText
                                        ready:(NSString *)readyText
                                      running:(NSString *)runningText{
    JobsOCRefreshConfig *config = JobsOCRefreshConfig.defaultHeaderConfig();
    config.byTriggerDistance(JobsWidth(64));
    config.byViewLength(JobsWidth(70));
    config.byIdleText(idleText);
    config.byPullingText(pullingText);
    config.byReadyRefreshText(readyText);
    config.byReadyLoadMoreText(readyText);
    config.byRefreshingText(runningText);
    config.byLoadingMoreText(runningText);
    config.byNoMoreDataText(@"没有更多了");
    return config;
}

-(jobsByVoidBlock _Nonnull)rebuildHorizontalTiles{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (UIView *tile in self.horizontalTileMutArr) {
            [self.tileTitleLabelMap removeObjectForKey:tile];
            [self.tileSubTitleLabelMap removeObjectForKey:tile];
        }
        [self.horizontalTileMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.horizontalTileMutArr removeAllObjects];
        for (NSInteger i = 0; i < self.horizontalColumnCount; i++) {
            UIView *tile = [self tileViewWithTitle:[NSString stringWithFormat:@"H-%ld", (long)i + 1]
                                          subTitle:@"左右拉动"
                                             index:i];
            tile.addOn(self.horizontalContentView);
            [self.horizontalTileMutArr addObject:tile];
        }
        self.layoutHorizontalContent();
    };
}

-(jobsByVoidBlock _Nonnull)rebuildVerticalTiles{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (UIView *tile in self.verticalTileMutArr) {
            [self.tileTitleLabelMap removeObjectForKey:tile];
            [self.tileSubTitleLabelMap removeObjectForKey:tile];
        }
        [self.verticalTileMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.verticalTileMutArr removeAllObjects];
        for (NSInteger i = 0; i < self.verticalRowCount; i++) {
            UIView *tile = [self tileViewWithTitle:[NSString stringWithFormat:@"V-%ld", (long)i + 1]
                                          subTitle:@"上下拉动"
                                             index:i];
            tile.addOn(self.verticalContentView);
            [self.verticalTileMutArr addObject:tile];
        }
        self.layoutVerticalContent();
    };
}

-(jobsByVoidBlock _Nonnull)layoutDemoContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.layoutHorizontalContent();
        self.layoutVerticalContent();
    };
}

-(jobsByVoidBlock _Nonnull)layoutHorizontalContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat boundsW = CGRectGetWidth(self.horizontalScrollView.bounds);
        CGFloat boundsH = CGRectGetHeight(self.horizontalScrollView.bounds);
        if (boundsW <= 0 || boundsH <= 0) return;
        CGFloat tileW = JobsWidth(126);
        CGFloat tileH = MAX(JobsWidth(76), boundsH - JobsWidth(36));
        CGFloat gap = JobsWidth(12);
        CGFloat inset = JobsWidth(18);
        CGFloat contentW = inset * 2 + self.horizontalColumnCount * tileW + MAX(0, self.horizontalColumnCount - 1) * gap;
        contentW = MAX(contentW, boundsW + JobsWidth(1));
        self.horizontalContentView.byFrame(CGRectMake(0, 0, contentW, boundsH));
        self.horizontalScrollView.byContentSize(CGSizeMake(contentW, boundsH));
        [self.horizontalTileMutArr enumerateObjectsUsingBlock:^(UIView *tile, NSUInteger idx, BOOL *stop) {
            CGFloat x = inset + idx * (tileW + gap);
            CGFloat y = MAX(JobsWidth(10), (boundsH - tileH) / 2);
            tile.byFrame(CGRectMake(x, y, tileW, tileH));
            UILabel *titleLabel = [self.tileTitleLabelMap objectForKey:tile];
            UILabel *subTitleLabel = [self.tileSubTitleLabelMap objectForKey:tile];
            titleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(12), tileW - JobsWidth(24), JobsWidth(24)));
            subTitleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(42), tileW - JobsWidth(24), JobsWidth(22)));
        }];
    };
}

-(jobsByVoidBlock _Nonnull)layoutVerticalContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat boundsW = CGRectGetWidth(self.verticalScrollView.bounds);
        CGFloat boundsH = CGRectGetHeight(self.verticalScrollView.bounds);
        if (boundsW <= 0 || boundsH <= 0) return;
        CGFloat tileH = JobsWidth(72);
        CGFloat gap = JobsWidth(10);
        CGFloat inset = JobsWidth(18);
        CGFloat tileW = MAX(JobsWidth(120), boundsW - inset * 2);
        CGFloat contentH = inset * 2 + self.verticalRowCount * tileH + MAX(0, self.verticalRowCount - 1) * gap;
        contentH = MAX(contentH, boundsH + JobsWidth(1));
        self.verticalContentView.byFrame(CGRectMake(0, 0, boundsW, contentH));
        self.verticalScrollView.byContentSize(CGSizeMake(boundsW, contentH));
        [self.verticalTileMutArr enumerateObjectsUsingBlock:^(UIView *tile, NSUInteger idx, BOOL *stop) {
            CGFloat y = inset + idx * (tileH + gap);
            tile.byFrame(CGRectMake(inset, y, tileW, tileH));
            UILabel *titleLabel = [self.tileTitleLabelMap objectForKey:tile];
            UILabel *subTitleLabel = [self.tileSubTitleLabelMap objectForKey:tile];
            titleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(10), tileW - JobsWidth(24), JobsWidth(24)));
            subTitleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(40), tileW - JobsWidth(24), JobsWidth(22)));
        }];
    };
}

-(UIView *)tileViewWithTitle:(NSString *)title
                    subTitle:(NSString *)subTitle
                       index:(NSInteger)index{
    UIView *tile = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byBgColor(self.tileColorAtIndex(index))
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(10))
                    .byShadowColor(UIColor.blackColor.CGColor)
                    .byShadowOpacity(0.12)
                    .byShadowOffset(CGSizeMake(0, JobsWidth(3)))
                    .byShadowRadius(JobsWidth(8));
            });
    });
    UILabel *titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label.byText(title)
            .byFont(UIFontWeightSemiboldSize(16))
            .byTextCor(UIColor.whiteColor);
    });
    titleLabel.byTag(1001);
    UILabel *subTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label.byText(subTitle)
            .byFont(UIFontWeightRegularSize(13))
            .byTextCor(RGBA_SAMECOLOR(255, 0.78));
    });
    subTitleLabel.byTag(1002);
    titleLabel.addOn(tile);
    subTitleLabel.addOn(tile);
    [self.tileTitleLabelMap setObject:titleLabel forKey:tile];
    [self.tileSubTitleLabelMap setObject:subTitleLabel forKey:tile];
    return tile;
}

-(JobsRetUIColorByNSIntegerBlock _Nonnull)tileColorAtIndex{
    @jobs_weakify(self)
    return ^UIColor *(NSInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        NSArray<UIColor *> *colors = @[
            HEXCOLOR(0x2F80ED),
            HEXCOLOR(0x27AE60),
            HEXCOLOR(0x9B51E0),
            HEXCOLOR(0xF2994A),
            HEXCOLOR(0xEB5757),
            HEXCOLOR(0x00A8A8)
        ];
        return colors[index % colors.count];
    };
}
#pragma mark —— LazyLoad
-(UITextView *)instructionTextView{
    if (!_instructionTextView) {
        _instructionTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            textView.byFont(UIFontWeightRegularSize(13))
                .byTextCor(JobsSecondaryLabelColor)
                .byEditable(NO)
                .bySelectable(NO)
                .byTextContainerInset(UIEdgeInsetsMake(JobsWidth(10),
                                                       JobsWidth(12),
                                                       JobsWidth(10),
                                                       JobsWidth(12)))
                .byLineFragmentPadding(0)
                .byScrollEnabled(YES)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(104));
                });
            textView.layer.byCornerRadius(JobsWidth(10));
            textView.layer.byMasksToBounds(YES);
        });
    };return _instructionTextView;
}

-(UISegmentedControl *)animatorSegmentedControl{
    if (!_animatorSegmentedControl) {
        @jobs_weakify(self)
        _animatorSegmentedControl = jobsMakeSegmentedControl(self.refreshAnimatorTitles,
                                                             ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(0)
                .onJobsChange(^(__unused UIControl *control) {
                    @jobs_strongify(self)
                    self.animatorSelectionDidChange();
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.instructionTextView.mas_bottom).offset(JobsWidth(8));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(34));
                });
        });
    };return _animatorSegmentedControl;
}

-(UILabel *)horizontalTitleLabel{
    if (!_horizontalTitleLabel) {
        _horizontalTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"水平拉动：右拉刷新 / 左拉加载更多".jobsTr())
                .byFont(UIFontWeightSemiboldSize(15))
                .byTextCor(JobsLabelColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.animatorSegmentedControl.mas_bottom).offset(JobsWidth(10));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(24));
                });
        });
    };return _horizontalTitleLabel;
}

-(UIScrollView *)horizontalScrollView{
    if (!_horizontalScrollView) {
        _horizontalScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byAlwaysBounceHorizontal(YES)
                .byAlwaysBounceVertical(NO)
                .byBounces(YES)
                .byShowsHorizontalScrollIndicator(YES)
                .byShowsVerticalScrollIndicator(NO)
                .byDirectionalLockEnabled(YES)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.horizontalTitleLabel.mas_bottom).offset(JobsWidth(6));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(112));
                });
        });
        _horizontalScrollView.byLayer(^(__kindof CALayer * _Nullable layer) {
            layer
                .byCornerRadius(JobsWidth(10))
                .byMasksToBounds(YES);
        });
        self.horizontalContentView.addOn(_horizontalScrollView);
    };return _horizontalScrollView;
}

-(UIView *)horizontalContentView{
    if (!_horizontalContentView) {
        _horizontalContentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsSecondarySystemBackgroundColor);
        });
    };return _horizontalContentView;
}

-(UILabel *)verticalTitleLabel{
    if (!_verticalTitleLabel) {
        _verticalTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"垂直拉动：下拉刷新 / 上拉加载更多".jobsTr())
                .byFont(UIFontWeightSemiboldSize(15))
                .byTextCor(JobsLabelColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.horizontalScrollView.mas_bottom).offset(JobsWidth(12));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(24));
                });
        });
    };return _verticalTitleLabel;
}

-(UIScrollView *)verticalScrollView{
    if (!_verticalScrollView) {
        _verticalScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byAlwaysBounceVertical(YES)
                .byAlwaysBounceHorizontal(NO)
                .byBounces(YES)
                .byShowsVerticalScrollIndicator(YES)
                .byShowsHorizontalScrollIndicator(NO)
                .byDirectionalLockEnabled(YES)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.verticalTitleLabel.mas_bottom).offset(JobsWidth(6));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.bottom.equalTo(self.view).offset(-JobsBottomSafeAreaHeight() - JobsWidth(12));
                });
        });
        _verticalScrollView.byLayer(^(__kindof CALayer * _Nullable layer) {
            layer
                .byCornerRadius(JobsWidth(10))
                .byMasksToBounds(YES);
        });
        self.verticalContentView.addOn(_verticalScrollView);
    };return _verticalScrollView;
}

-(UIView *)verticalContentView{
    if (!_verticalContentView) {
        _verticalContentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsSecondarySystemBackgroundColor);
        });
    };return _verticalContentView;
}

-(NSArray<id<JobsRefreshAnimatorProtocol>> *)refreshAnimators{
    if (!_refreshAnimators) {
        UIImage *singleImage = @"arrow.triangle.2.circlepath".sys_img ?: jobsMakeImage(^(UIImage *object){});
        NSArray<UIImage *> *frames = @[
            @"arrow.up".sys_img ?: singleImage,
            @"arrow.right".sys_img ?: singleImage,
            @"arrow.down".sys_img ?: singleImage,
            @"arrow.left".sys_img ?: singleImage
        ];
        JobsGIFRefreshView *gifAnimator = [[JobsGIFRefreshView alloc] initWithGIFNamed:@"跳动的竖线.gif"]
            .byIndicatorSize(CGSizeMake(JobsWidth(34), JobsWidth(34)));
        _refreshAnimators = @[
            [[JobsTodayNewsRefreshView alloc] initWithConfig:JobsTodayNewsRefreshConfig.config()],
            [[JobsDouyinRefreshView alloc] initWithConfig:JobsDouyinRefreshConfig.config()],
            [[JobsImageRefreshView alloc] initWithImage:singleImage],
            [[JobsImageRefreshView alloc] initWithImages:frames frameInterval:0.18],
            gifAnimator,
            [[JobsLottieRefreshView alloc] initWithAnimationNamed:@"JobsSignatureSlogan"],
            JobsSystemRefreshView.refreshView()
        ];
    };return _refreshAnimators;
}

-(NSArray<NSString *> *)refreshAnimatorTitles{
    if (!_refreshAnimatorTitles) {
        _refreshAnimatorTitles = @[@"头条", @"抖音", @"单图", @"多图", @"GIF", @"Lottie", @"菊花"];
    };return _refreshAnimatorTitles;
}

-(NSMutableArray<UIView *> *)horizontalTileMutArr{
    if (!_horizontalTileMutArr) {
        _horizontalTileMutArr = NSMutableArray.array;
    };return _horizontalTileMutArr;
}

-(NSMutableArray<UIView *> *)verticalTileMutArr{
    if (!_verticalTileMutArr) {
        _verticalTileMutArr = NSMutableArray.array;
    };return _verticalTileMutArr;
}

-(NSMapTable<UIView *,UILabel *> *)tileTitleLabelMap{
    if (!_tileTitleLabelMap) {
        _tileTitleLabelMap = [NSMapTable strongToStrongObjectsMapTable];
    };return _tileTitleLabelMap;
}

-(NSMapTable<UIView *,UILabel *> *)tileSubTitleLabelMap{
    if (!_tileSubTitleLabelMap) {
        _tileSubTitleLabelMap = [NSMapTable strongToStrongObjectsMapTable];
    };return _tileSubTitleLabelMap;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCRefresherDemoVC
-(JobsRetJobsOCRefresherDemoVCByBOOLBlock _Nonnull)byDidAutoStart{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefresherDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setDidAutoStart:data];
        return self;
    };
}

-(JobsRetJobsOCRefresherDemoVCByBOOLBlock _Nonnull)byDidBindRefresher{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefresherDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setDidBindRefresher:data];
        return self;
    };
}

-(JobsRetJobsOCRefresherDemoVCByNSIntegerBlock _Nonnull)byHorizontalColumnCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefresherDemoVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setHorizontalColumnCount:data];
        return self;
    };
}

-(JobsRetJobsOCRefresherDemoVCByNSIntegerBlock _Nonnull)byVerticalRowCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefresherDemoVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setVerticalRowCount:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCRefresherDemoVC
@end
