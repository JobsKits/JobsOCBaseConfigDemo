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

Prop_strong()UILabel *statusLabel;
Prop_strong()UILabel *horizontalTitleLabel;
Prop_strong()UILabel *verticalTitleLabel;
Prop_strong()UIScrollView *horizontalScrollView;
Prop_strong()UIScrollView *verticalScrollView;
Prop_strong()UIView *horizontalContentView;
Prop_strong()UIView *verticalContentView;
Prop_strong()NSMutableArray<UIView *> *horizontalTileMutArr;
Prop_strong()NSMutableArray<UIView *> *verticalTileMutArr;
Prop_assign()NSInteger horizontalColumnCount;
Prop_assign()NSInteger verticalRowCount;
Prop_assign()NSInteger verticalRefreshCount;
Prop_assign()NSInteger verticalLoadCount;
Prop_assign()NSInteger horizontalRefreshCount;
Prop_assign()NSInteger horizontalLoadCount;
Prop_assign()BOOL didBindRefresher;

-(void)bindRefresherIfNeeded;
-(void)rebuildHorizontalTiles;
-(void)rebuildVerticalTiles;
-(void)layoutDemoContent;
-(void)layoutHorizontalContent;
-(void)layoutVerticalContent;
-(void)runRefreshAtPosition:(JobsOCRefreshPosition)position
                 scrollView:(UIScrollView *)scrollView
                      title:(NSString *)title
                 completion:(nullable jobsByVoidBlock)completion;
-(void)updateStatusByTitle:(NSString *)title;
-(JobsOCRefreshConfig *)refreshConfigWithIdle:(NSString *)idleText
                                      pulling:(NSString *)pullingText
                                        ready:(NSString *)readyText
                                      running:(NSString *)runningText;
-(UIView *)tileViewWithTitle:(NSString *)title
                    subTitle:(NSString *)subTitle
                       index:(NSInteger)index;
-(UIColor *)tileColorAtIndex:(NSInteger)index;

@end

@implementation JobsOCRefresherDemoVC
-(instancetype)init{
    if (self = [super init]) {
        _verticalRowCount = JobsOCRefresherDemoInitialVerticalRows;
        _horizontalColumnCount = JobsOCRefresherDemoInitialHorizontalColumns;
    };return self;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"JobsOCRefresher".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF7F8FC))
        .byNavBgCor(HEXCOLOR(0xF7F8FC));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF7F8FC));
    self.statusLabel.byAlpha(1);
    self.horizontalTitleLabel.byAlpha(1);
    self.horizontalScrollView.byAlpha(1);
    self.verticalTitleLabel.byAlpha(1);
    self.verticalScrollView.byAlpha(1);
    [self bindRefresherIfNeeded];
    [self rebuildHorizontalTiles];
    [self rebuildVerticalTiles];
    [self updateStatusByTitle:@"等待触发".tr];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self layoutDemoContent];
}

-(void)bindRefresherIfNeeded{
    if (self.didBindRefresher) return;
    self.didBindRefresher = YES;
    @jobs_weakify(self)
    [self.horizontalScrollView jobs_setHorizontalRefreshMode:JobsOCRefreshHorizontalModeRefreshRightLoadLeft];
    [self.horizontalScrollView jobs_enableRefreshHaptics:YES];
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
            self.horizontalColumnCount = MAX(JobsOCRefresherDemoInitialHorizontalColumns, self.horizontalColumnCount);
            [self rebuildHorizontalTiles];
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
            [self rebuildHorizontalTiles];
        }];
    }];
    [self.verticalScrollView jobs_enableRefreshHaptics:YES];
    JobsOCRefreshConfig *todayNewsConfig = [self refreshConfigWithIdle:@"下拉刷新"
                                                               pulling:@"继续下拉"
                                                                 ready:@"松开刷新"
                                                               running:@"垂直刷新中"];
    todayNewsConfig.showsText = NO;
    todayNewsConfig.animator = [[JobsTodayNewsRefreshView alloc] initWithConfig:JobsTodayNewsRefreshConfig.config];
    [self.verticalScrollView jobs_byRefreshHeaderWithConfig:todayNewsConfig
                                                 action:^{
        @jobs_strongify(self)
        [self runRefreshAtPosition:JobsOCRefreshPositionHeader
                         scrollView:self.verticalScrollView
                              title:@"垂直刷新"
                        completion:^{
            @jobs_strongify(self)
            self.verticalRefreshCount += 1;
            self.verticalRowCount = MAX(JobsOCRefresherDemoInitialVerticalRows, self.verticalRowCount);
            [self rebuildVerticalTiles];
        }];
    }];
    JobsOCRefreshConfig *douyinConfig = [self refreshConfigWithIdle:@"上拉加载"
                                                           pulling:@"继续上拉"
                                                             ready:@"松开加载"
                                                           running:@"垂直加载中"];
    douyinConfig.animator = [[JobsDouyinRefreshView alloc] initWithConfig:JobsDouyinRefreshConfig.config];
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
            [self rebuildVerticalTiles];
        }];
    }];
}

-(void)runRefreshAtPosition:(JobsOCRefreshPosition)position
                 scrollView:(UIScrollView *)scrollView
                      title:(NSString *)title
                 completion:(jobsByVoidBlock)completion{
    [self updateStatusByTitle:title];
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        if (completion) completion();
        [self layoutDemoContent];
        [scrollView jobs_switchRefreshAt:position
                                  toState:JobsOCRefreshStateIdle];
        [self updateStatusByTitle:[NSString stringWithFormat:@"%@完成", title]];
    });
}

-(void)updateStatusByTitle:(NSString *)title{
    self.statusLabel.byText([NSString stringWithFormat:@"%@\n水平：右拉刷新 %ld  左拉加载 %ld\n垂直：下拉刷新 %ld  上拉加载 %ld",
                             title,
                             (long)self.horizontalRefreshCount,
                             (long)self.horizontalLoadCount,
                             (long)self.verticalRefreshCount,
                             (long)self.verticalLoadCount]);
}

-(JobsOCRefreshConfig *)refreshConfigWithIdle:(NSString *)idleText
                                      pulling:(NSString *)pullingText
                                        ready:(NSString *)readyText
                                      running:(NSString *)runningText{
    JobsOCRefreshConfig *config = JobsOCRefreshConfig.defaultHeaderConfig;
    config.triggerDistance = JobsWidth(64);
    config.viewLength = JobsWidth(70);
    config.idleText = idleText;
    config.pullingText = pullingText;
    config.readyRefreshText = readyText;
    config.readyLoadMoreText = readyText;
    config.refreshingText = runningText;
    config.loadingMoreText = runningText;
    config.noMoreDataText = @"没有更多了";
    return config;
}

-(void)rebuildHorizontalTiles{
    [self.horizontalTileMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.horizontalTileMutArr removeAllObjects];
    for (NSInteger i = 0; i < self.horizontalColumnCount; i++) {
        UIView *tile = [self tileViewWithTitle:[NSString stringWithFormat:@"H-%ld", (long)i + 1]
                                      subTitle:@"左右拉动"
                                         index:i];
        tile.addOn(self.horizontalContentView);
        [self.horizontalTileMutArr addObject:tile];
    }
    [self layoutHorizontalContent];
}

-(void)rebuildVerticalTiles{
    [self.verticalTileMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.verticalTileMutArr removeAllObjects];
    for (NSInteger i = 0; i < self.verticalRowCount; i++) {
        UIView *tile = [self tileViewWithTitle:[NSString stringWithFormat:@"V-%ld", (long)i + 1]
                                      subTitle:@"上下拉动"
                                         index:i];
        tile.addOn(self.verticalContentView);
        [self.verticalTileMutArr addObject:tile];
    }
    [self layoutVerticalContent];
}

-(void)layoutDemoContent{
    [self layoutHorizontalContent];
    [self layoutVerticalContent];
}

-(void)layoutHorizontalContent{
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
        UILabel *titleLabel = (UILabel *)[tile viewWithTag:1001];
        UILabel *subTitleLabel = (UILabel *)[tile viewWithTag:1002];
        titleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(12), tileW - JobsWidth(24), JobsWidth(24)));
        subTitleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(42), tileW - JobsWidth(24), JobsWidth(22)));
    }];
}

-(void)layoutVerticalContent{
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
        UILabel *titleLabel = (UILabel *)[tile viewWithTag:1001];
        UILabel *subTitleLabel = (UILabel *)[tile viewWithTag:1002];
        titleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(10), tileW - JobsWidth(24), JobsWidth(24)));
        subTitleLabel.byFrame(CGRectMake(JobsWidth(12), JobsWidth(40), tileW - JobsWidth(24), JobsWidth(22)));
    }];
}

-(UIView *)tileViewWithTitle:(NSString *)title
                    subTitle:(NSString *)subTitle
                       index:(NSInteger)index{
    UIView *tile = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byBgColor([self tileColorAtIndex:index])
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
    return tile;
}

-(UIColor *)tileColorAtIndex:(NSInteger)index{
    NSArray<UIColor *> *colors = @[
        HEXCOLOR(0x2F80ED),
        HEXCOLOR(0x27AE60),
        HEXCOLOR(0x9B51E0),
        HEXCOLOR(0xF2994A),
        HEXCOLOR(0xEB5757),
        HEXCOLOR(0x00A8A8)
    ];
    return colors[index % colors.count];
}
#pragma mark —— LazyLoad
-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byBgColor(UIColor.whiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(74));
                });
            label.layer.byCornerRadius(JobsWidth(10));
            label.layer.byMasksToBounds(YES);
        });
    };return _statusLabel;
}

-(UILabel *)horizontalTitleLabel{
    if (!_horizontalTitleLabel) {
        _horizontalTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"水平拉动：右拉刷新 / 左拉加载更多".tr)
                .byFont(UIFontWeightSemiboldSize(15))
                .byTextCor(HEXCOLOR(0x26384C))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.statusLabel.mas_bottom).offset(JobsWidth(10));
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
                .byBgColor(HEXCOLOR(0xEEF1F7))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.horizontalTitleLabel.mas_bottom).offset(JobsWidth(6));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(146));
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
            view.byBgColor(HEXCOLOR(0xEEF1F7));
        });
    };return _horizontalContentView;
}

-(UILabel *)verticalTitleLabel{
    if (!_verticalTitleLabel) {
        _verticalTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"垂直拉动：下拉刷新 / 上拉加载更多".tr)
                .byFont(UIFontWeightSemiboldSize(15))
                .byTextCor(HEXCOLOR(0x26384C))
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
                .byBgColor(HEXCOLOR(0xEEF1F7))
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
            view.byBgColor(HEXCOLOR(0xEEF1F7));
        });
    };return _verticalContentView;
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

@end
