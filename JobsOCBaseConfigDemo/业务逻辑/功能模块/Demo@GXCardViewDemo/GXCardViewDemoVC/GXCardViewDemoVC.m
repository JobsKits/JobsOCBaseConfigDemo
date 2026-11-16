//
//  GXCardViewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GXCardViewDemoVC.h"

static NSBundle *GXCardViewDemoResourceBundle(void) {
    NSArray<NSBundle *> *sourceBundles = @[
        [NSBundle bundleForClass:GXCardItemDemoCell.class] ?: NSBundle.mainBundle,
        NSBundle.mainBundle
    ];
    for (NSBundle *sourceBundle in sourceBundles) {
        NSURL *bundleURL = [sourceBundle URLForResource:@"JobsOCToolsCore" withExtension:@"bundle"];
        NSBundle *resourceBundle = bundleURL ? [NSBundle bundleWithURL:bundleURL] : nil;
        if (resourceBundle) return resourceBundle;
    }
    NSBundle *classBundle = [NSBundle bundleForClass:GXCardItemDemoCell.class];
    return classBundle ?: NSBundle.mainBundle;
}

static void GXCardViewDemoStyleCell(GXCardItemDemoCell *cell, NSInteger index, NSInteger count) {
    if (![cell viewWithTag:60113]) {
        // 仅在宿主 Demo 中替换旧 Nib 的占位内容，保留第三方卡片与手势实现。
        UILabel *numberLabel = cell.numberLabel;
        UILabel *leftLabel = cell.leftLabel;
        UILabel *rightLabel = cell.rightLabel;
        [NSLayoutConstraint deactivateConstraints:cell.constraints];
        for (UIView *subview in cell.subviews.copy) {
            [subview removeFromSuperview];
        }
        for (UILabel *label in @[numberLabel, leftLabel, rightLabel]) {
            [NSLayoutConstraint deactivateConstraints:label.constraints];
            label.byBgColor(UIColor.clearColor);
            label.byTextCor(JobsLabelColor);
            label.byFont([UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]);
            label.byAdjustsFontForContentSizeCategory(YES);
        }
        UILabel *brand = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"GXCard").byTextCor(JobsSystemBlueColor);
            label.byFont([UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]);
            label.byAdjustsFontForContentSizeCategory(YES);
        });
        numberLabel.byTextCor(JobsLabelColor);
        UIStackView *heading = jobsMakeStackView(^(__kindof UIStackView *stack) {
            stack.byAxis(UILayoutConstraintAxisHorizontal).byAlignment(UIStackViewAlignmentCenter);
            [stack addArrangedSubview:brand];
            [stack addArrangedSubview:jobsMakeView(^(__kindof UIView *view) {})];
            [stack addArrangedSubview:numberLabel];
        });
        UIImageView *symbol = jobsMakeImageView(^(__kindof UIImageView *view) {
            view.byImage([UIImage systemImageNamed:@"rectangle.stack.fill"]);
            view.byTintColor(JobsSystemBlueColor).byContentMode(UIViewContentModeScaleAspectFit);
        });
        [symbol mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(64);
        }];
        UILabel *title = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"GXCard 式滑动卡片堆".jobsTr()).byTextCor(JobsLabelColor);
            label.byFont([UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]);
            label.byNumberOfLines(0).byTextAlignment(NSTextAlignmentCenter);
            label.byAdjustsFontForContentSizeCategory(YES);
        });
        UILabel *detail = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果".jobsTr());
            label.byTextCor(JobsLabelColor);
            label.byFont([UIFont preferredFontForTextStyle:UIFontTextStyleBody]);
            label.byNumberOfLines(0).byTextAlignment(NSTextAlignmentCenter);
            label.byAdjustsFontForContentSizeCategory(YES);
        });
        UILabel *hint = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"可拖动".jobsTr()).byTextCor(JobsLabelColor);
            label.byFont([UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]);
            label.byTextAlignment(NSTextAlignmentCenter).byAdjustsFontForContentSizeCategory(YES);
        });
        UIView *topSpace = jobsMakeView(^(__kindof UIView *view) {});
        UIView *bottomSpace = jobsMakeView(^(__kindof UIView *view) {});
        UIStackView *content = jobsMakeStackView(^(__kindof UIStackView *stack) {
            stack.byAxis(UILayoutConstraintAxisVertical).bySpacing(20);
            stack.tag = 60113;
            [stack addArrangedSubview:heading];
            [stack addArrangedSubview:topSpace];
            [stack addArrangedSubview:symbol];
            [stack addArrangedSubview:title];
            [stack addArrangedSubview:detail];
            [stack addArrangedSubview:hint];
            [stack addArrangedSubview:bottomSpace];
        });
        content.addOn(cell).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(cell).insets(UIEdgeInsetsMake(24, 24, 24, 24));
        });
        [topSpace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(bottomSpace);
        }];
        for (UILabel *label in @[leftLabel, rightLabel]) {
            label.byTextCor(JobsSystemBlueColor).byHidden(YES).addOn(cell);
            label.byFont([UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]);
        }
        leftLabel.byText(@"右".jobsTr()).byAdd(^(MASConstraintMaker *make) {
            make.leading.equalTo(cell).offset(24);
            make.top.equalTo(cell).offset(70);
        });
        rightLabel.byText(@"左".jobsTr()).byAdd(^(MASConstraintMaker *make) {
            make.trailing.equalTo(cell).offset(-24);
            make.top.equalTo(cell).offset(70);
        });
    }
    cell.byBgColor(JobsSecondarySystemGroupedBackgroundColor);
    cell.layer.byCornerRadius(24).byBorderWidth(0);
    cell.layer.byShadowColor(UIColor.blackColor.CGColor)
        .byShadowOpacity(0.08)
        .byShadowOffset(CGSizeMake(0, 8))
        .byShadowRadius(18);
    cell.numberLabel.byText([NSString stringWithFormat:@"%02ld / %ld", (long)index + 1, (long)count]);
    cell.leftLabel.byHidden(YES);
    cell.rightLabel.byHidden(YES);
}

@interface GXCardViewDemoVC ()

/// UI
//@property(nonatomic,weak)IBOutlet GXCardView *cardView;
Prop_strong()GXCardView *cardView;
Prop_strong()UIStackView *actionsStack;
Prop_assign()NSInteger cellCount;

@end

@implementation GXCardView (JobsDemoDSL)

-(JobsRetGXCardViewByIDBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.dataSource = data;
        return self;
    };
}

-(JobsRetGXCardViewByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}

-(JobsRetGXCardViewByNSIntegerBlock _Nonnull)byVisibleCount{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.visibleCount = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byLineSpacing{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.lineSpacing = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byInteritemSpacing{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.interitemSpacing = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byMaxAngle{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.maxAngle = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byMaxRemoveDistance{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.maxRemoveDistance = data;
        return self;
    };
}

-(JobsRetGXCardViewByBOOLBlock _Nonnull)byRepeat{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.isRepeat = data;
        return self;
    };
}

-(JobsRetGXCardViewByIDBlocks _Nonnull)byRegisterCell{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(jobsByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self) return nil;
        if (block) block(self);
        return self;
    };
}

-(JobsRetGXCardViewByBOOLBlock _Nonnull)reloadDataAnimated{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self reloadDataAnimated:data];
        return self;
    };
}

-(JobsRetGXCardViewByBOOLBlock _Nonnull)reloadMoreDataAnimated{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self reloadMoreDataAnimated:data];
        return self;
    };
}

-(JobsRetGXCardViewByNSIntegerBlock _Nonnull)removeTopCardViewFromSwipe{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        [self removeTopCardViewFromSwipe:(GXCardCellSwipeDirection)data];
        return self;
    };
}

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN GXCardViewDemoVC
@interface GXCardViewDemoVC (JobsPropertyDSLSetterAutogen_068388f41c)
-(void)setCellCount:(NSInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END GXCardViewDemoVC

@implementation GXCardViewDemoVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byTextCor(JobsLabelColor);
            })
            //        self.viewModel.textModel.text = @"GXCardViewDemo".jobsTr();
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byAttributedTitle(nil)
                    .byText(@"GXCard 式滑动卡片堆".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            .byBgCor(JobsSecondarySystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor)
            .byNavBgImage(nil);
        self.cellCount = 10;
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.byGKNavTitle(@"GXCard 式滑动卡片堆".jobsTr());
        self.view.byBgColor(JobsSecondarySystemBackgroundColor);
        self.actionsStack.byAlpha(1);
        self.cardView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        [self->_cardView reloadData];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}
#pragma mark —— GXCardViewDataSource
- (GXCardViewCell *)cardView:(GXCardView *)cardView
           cellForRowAtIndex:(NSInteger)index {
    GXCardItemDemoCell *cell = [cardView dequeueReusableCellWithIdentifier:@"GXCardViewCell"];
    GXCardViewDemoStyleCell(cell, index, self.cellCount);
    return cell;
}

- (NSInteger)numberOfCountInCardView:(UITableView *)cardView {
    return ((((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(numberOfCountInCardView)))(self, @selector(numberOfCountInCardView))))(cardView);
}
-(JobsRetNSIntegerByUITableViewBlock _Nonnull)numberOfCountInCardView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * cardView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.cellCount;
    };
}
#pragma mark —— GXCardViewDelegate
- (void)cardView:(GXCardView *)cardView
didRemoveLastCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index {
    if (!cardView.isRepeat) {
        cardView.reloadDataAnimated(YES);
    }
}

- (void)cardView:(GXCardView *)cardView
   didRemoveCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index
       direction:(GXCardCellSwipeDirection)direction {
    JobsLog(@"didRemoveCell forRowAtIndex = %ld, direction = %ld", index, direction);
#if DEBUG
    if ([NSProcessInfo.processInfo.arguments containsObject:@"--jobs-coverage-route"]) {
        cardView.accessibilityValue = [NSString stringWithFormat:@"removed:%ld:%ld", (long)index, (long)direction];
    }
#endif
    if (!cardView.isRepeat && index == 8) {
        self.byCellCount(15);
        cardView.reloadMoreDataAnimated(YES);
    }
}

- (void)cardView:(GXCardView *)cardView
  didDisplayCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index {
    JobsLog(@"didDisplayCell forRowAtIndex = %ld", index);
}

- (void)cardView:(GXCardView *)cardView
     didMoveCell:(GXCardViewCell *)cell
    forMovePoint:(CGPoint)point
       direction:(GXCardCellSwipeDirection)direction {
    GXCardItemDemoCell *dcell = (GXCardItemDemoCell*)cell;
    dcell.leftLabel.byHidden(!(direction == GXCardCellSwipeDirectionRight));
    dcell.rightLabel.byHidden(!(direction == GXCardCellSwipeDirectionLeft));
    JobsLog(@"move point = %@,  direction = %ld", NSStringFromCGPoint(point), direction);
}

- (IBAction)leftButtonClick:(id)sender {
    jobsByIDBlock action = ((jobsByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsLeftButtonClick)))(self, @selector(jobsLeftButtonClick));
    if (action) action(sender);
}

-(jobsByIDBlock _Nonnull)jobsLeftButtonClick{
    @jobs_weakify(self)
    return ^(id sender){
        @jobs_strongify(self)
        if (!self) return;
            self.cardView.removeTopCardViewFromSwipe(GXCardCellSwipeDirectionLeft);
        //    [self.cardView reloadDataFormIndex:2 animated:YES];
    };
}

- (IBAction)rightButtonClick:(id)sender {
    jobsByIDBlock action = ((jobsByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsRightButtonClick)))(self, @selector(jobsRightButtonClick));
    if (action) action(sender);
}

-(jobsByIDBlock _Nonnull)jobsRightButtonClick{
    @jobs_weakify(self)
    return ^(id sender){
        @jobs_strongify(self)
        if (!self) return;
        self.cardView.removeTopCardViewFromSwipe(GXCardCellSwipeDirectionRight);
    };
}
#pragma mark —— lazyLoad
-(UIStackView *)actionsStack{
    if (!_actionsStack) {
        @jobs_weakify(self)
        UIButton *left = UIButton.initByType(UIButtonTypeSystem)
            .byTitle(@"左".jobsTr())
            .byTitleCor(JobsLabelColor);
        UIButton *reset = UIButton.initByType(UIButtonTypeSystem)
            .byTitle(@"重置".jobsTr())
            .byTitleCor(JobsLabelColor);
        UIButton *right = UIButton.initByType(UIButtonTypeSystem)
            .byTitle(@"右".jobsTr())
            .byTitleCor(UIColor.whiteColor);
        left.byAddTarget(self, @selector(leftButtonClick:), UIControlEventTouchUpInside);
        right.byAddTarget(self, @selector(rightButtonClick:), UIControlEventTouchUpInside);
        reset.onJobsTap(^(__kindof UIControl *control) {
            @jobs_strongify(self)
            if (!self) return;
            self.byCellCount(10);
            [self.cardView reloadDataAnimated:YES];
        });
        left.byBgColor(JobsSecondarySystemGroupedBackgroundColor);
        reset.byBgColor(JobsSecondarySystemGroupedBackgroundColor);
        right.byBgColor(JobsSystemIndigoColor);
        left.accessibilityIdentifier = @"jobs.gxcard.left";
        reset.accessibilityIdentifier = @"jobs.gxcard.reset";
        right.accessibilityIdentifier = @"jobs.gxcard.right";
        for (UIButton *button in @[left, reset, right]) {
            button.layer.byCornerRadius(14);
            button.byTitleFont([UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]);
            button.titleLabel.byAdjustsFontForContentSizeCategory(YES);
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.greaterThanOrEqualTo(@50);
            }];
        }
        _actionsStack = jobsMakeStackView(^(__kindof UIStackView *stack) {
            stack.byAxis(UILayoutConstraintAxisHorizontal);
            stack.byDistribution(UIStackViewDistributionFillEqually).bySpacing(12);
            [stack addArrangedSubview:left];
            [stack addArrangedSubview:reset];
            [stack addArrangedSubview:right];
        }).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.width.equalTo(self.view).offset(-48).priorityHigh();
            make.width.lessThanOrEqualTo(@480);
            make.leading.greaterThanOrEqualTo(self.view).offset(24);
            make.trailing.lessThanOrEqualTo(self.view).offset(-24);
            make.bottom.lessThanOrEqualTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-24);
        });
    }
    return _actionsStack;
}

-(GXCardView *)cardView{
    if (!_cardView) {
        _cardView = GXCardView.new
            .byDataSource(self)
            .byDelegate(self)
            .byVisibleCount(5)
            .byLineSpacing(15.0)
            .byInteritemSpacing(10.0)
            .byMaxAngle(15.0)
            .byMaxRemoveDistance(100.0)
            .byRegisterCell(^(__kindof GXCardView *view) {
                [view registerNib:jobsMakeNib(NSStringFromClass(GXCardItemDemoCell.class),
                                              GXCardViewDemoResourceBundle(),
                                              nil)
                 forCellReuseIdentifier:@"GXCardViewCell"];
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.view);
                make.width.equalTo(self.view).offset(-48).priorityHigh();
                make.width.lessThanOrEqualTo(@480);
                make.leading.greaterThanOrEqualTo(self.view).offset(24);
                make.trailing.lessThanOrEqualTo(self.view).offset(-24);
                make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil) + 40);
                make.height.equalTo(self.view).multipliedBy(0.58).priorityHigh();
                make.height.lessThanOrEqualTo(@560);
                make.bottom.equalTo(self.actionsStack.mas_top).offset(-36);
            });
    }
#if DEBUG
    _cardView.accessibilityIdentifier = @"jobs.coverage.surface.GXCardViewDemoVC.cardView";
#endif
    return _cardView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN GXCardViewDemoVC
-(JobsRetGXCardViewDemoVCByNSIntegerBlock _Nonnull)byCellCount{
    @jobs_weakify(self)
    return ^__kindof GXCardViewDemoVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCellCount:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END GXCardViewDemoVC
@end
