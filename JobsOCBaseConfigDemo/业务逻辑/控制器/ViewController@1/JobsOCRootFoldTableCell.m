//
//  JobsOCRootFoldTableCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsOCRootFoldTableCell.h"
#import "JobsOCDemoListSettingsVC.h"

NSString *const JobsOCRootFoldTableCellReuseIdentifier = @"JobsOCRootFoldTableCell";
static NSString *const JobsOCRootFoldInnerCellReuseIdentifier = @"JobsOCRootFoldInnerCell";
static NSString *const JobsOCDemoIconFallbackSymbolName = @"questionmark.app";
static NSTimeInterval const JobsOCChargingProgressInterval = 0.45;
static CGFloat const JobsOCAnimatedTitleIconSize = 22;

@interface JobsOCRootFoldTableCell ()

Prop_strong()UIView *cardView;
Prop_strong()UIView *headerView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UIImageView *chevronView;
Prop_strong()UIView *detailClipView;
Prop_strong()UITableView *innerTableView;
Prop_strong()UILongPressGestureRecognizer *innerCellLongPressGesture;
Prop_strong()NSArray <UIViewModel *>*items;
Prop_copy()NSString *sectionDescription;
Prop_copy()jobsByNSIntegerBlock selectBlock;
Prop_copy()jobsByNSIntegerBlock pinBlock;
Prop_assign()NSInteger pinAccessoryIndex;
Prop_assign()BOOL pinnedSectionStyle;
Prop_strong()JobsTimer *chargingProgressTimer;
Prop_assign()NSInteger chargingProgressPhase;

-(JobsRetViewByStringBlock _Nonnull)sectionDescriptionHeaderViewByText;
-(JobsRetCGFloatByVoidBlock _Nonnull)sectionDescriptionHeaderWidth;
-(JobsRetCGFloatByVoidBlock _Nonnull)sectionDescriptionHeaderHeight;
-(JobsRetCGFloatByVoidBlock _Nonnull)innerTableContentHeight;
-(jobsByVoidBlock _Nonnull)reloadSectionDescriptionHeaderViewIfNeeded;
-(JobsRetBOOLByUIViewModelBlock _Nonnull)isChargingProgressViewModel;
-(JobsRetBOOLByUIViewModelBlock _Nonnull)isClockViewModel;
-(jobsByVoidBlock _Nonnull)prepareChargingProgressTimerIfNeeded;
-(jobsByVoidBlock _Nonnull)syncChargingProgressTimerState;
-(jobsByVoidBlock _Nonnull)refreshVisibleChargingProgressTitle;
-(jobsByVoidBlock _Nonnull)syncVisibleInnerTextScrollingState;
-(jobsByLabelBlock _Nonnull)applyTextDisplayStrategyToLabel;
-(jobsByTableViewCellBlock _Nonnull)syncTextScrollingStateForCell;
-(jobsByVoidBlock _Nonnull)stopVisibleInnerTextScrolling;
-(void)installAnimatedTitleIconByViewModel:(UIViewModel *)viewModel
                                    inCell:(UITableViewCell *)cell;
-(jobsByTableViewCellBlock _Nonnull)removeAnimatedTitleIconsFromCell;
-(JobsRetJobsClockIconViewByUITableViewCellBlock _Nonnull)clockIconInCell;
-(jobsByTableViewCellBlock _Nonnull)syncAnimatedTitleIconStateForCell;
-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoIconClassNameByViewModel;
-(jobsByStrBlock _Nonnull)logDemoIconIssueOnce;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCRootFoldTableCell
@interface JobsOCRootFoldTableCell (JobsPropertyDSLSetterAutogen_17a191f2c6)
-(void)setChargingProgressPhase:(NSInteger)data;
-(void)setChargingProgressTimer:(JobsTimer * _Nullable)data;
-(void)setItems:(NSArray <UIViewModel *>* _Nullable)data;
-(void)setPinAccessoryIndex:(NSInteger)data;
-(void)setPinBlock:(jobsByNSIntegerBlock)data;
-(void)setPinnedSectionStyle:(BOOL)data;
-(void)setSelectBlock:(jobsByNSIntegerBlock)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCRootFoldTableCell

@implementation JobsOCRootFoldTableCell{
    MASConstraint *_innerTableHeightConstraint;
    BOOL _expanded;
}

-(JobsRetJobsOCRootFoldTableCellByStrBlock _Nonnull)bySectionDescription{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.sectionDescription = data;
        return self;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)verticalInset{
    return ^CGFloat{
        return 8;
    };
}

+(UIFont *)titleFont{
    return UIFontWeightMediumSize(16);
}

+(JobsRetFontByVoidBlock _Nonnull)subTitleFont{
    return ^UIFont *{
        return UIFontWeightRegularSize(12);
    };
}

+(JobsRetFontByVoidBlock _Nonnull)sectionDescriptionFont{
    return ^UIFont *{
        return UIFontWeightRegularSize(13);
    };
}

+(JobsRetFontByVoidBlock _Nonnull)innerTitleFont{
    return ^UIFont *{
        return UIFontWeightRegularSize(15);
    };
}

+(JobsRetFontByVoidBlock _Nonnull)innerSubTitleFont{
    return ^UIFont *{
        return UIFontWeightRegularSize(11);
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)headerTitleTop{
    return ^CGFloat{
        return 11;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)headerTitleGap{
    return ^CGFloat{
        return 5;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)headerTitleBottom{
    return ^CGFloat{
        return 10;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)headerSubTitleTop{
    return ^CGFloat{
        return self.headerTitleTop() + self.titleHeight() + self.headerTitleGap();
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)titleHeight{
    return ^CGFloat{
        return ceil(self.titleFont.lineHeight);
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)subTitleHeight{
    return ^CGFloat{
        return ceil(self.subTitleFont().lineHeight);
    };
}

+(CGFloat)headerHeight{
    return (((JobsRetCGFloatByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsOCRootFoldTableCell.class, @selector(jobsHeaderHeight)))(self, @selector(jobsHeaderHeight)))();
}

+(JobsRetCGFloatByVoidBlock _Nonnull)jobsHeaderHeight{
    return ^CGFloat{
        CGFloat textHeight = self.headerTitleTop() +
                             self.titleHeight() +
                             self.headerTitleGap() +
                             self.subTitleHeight() +
                             self.headerTitleBottom();
        return MAX(64, textHeight);
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)innerTop{
    return ^CGFloat{
        return 10;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)innerBottom{
    return ^CGFloat{
        return 10;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)innerRowHeight{
    return ^CGFloat{
        return 50;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)sectionDescriptionHorizontalInset{
    return ^CGFloat{
        return 16;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)sectionDescriptionVerticalInset{
    return ^CGFloat{
        return 8;
    };
}

+(JobsRetCGFloatByVoidBlock _Nonnull)sectionDescriptionEstimatedHeaderWidth{
    return ^CGFloat{
        return MAX(200, JobsMainScreen_WIDTH() - 20);
    };
}

+(JobsRetCGFloatByCGFloatBlock _Nonnull)sectionDescriptionWidthByHeaderWidth{
    return ^CGFloat(CGFloat headerWidth){
        return MAX(120, headerWidth - self.sectionDescriptionHorizontalInset() * 2);
    };
}

+(JobsRetCGFloatByNSStringBlock _Nonnull)sectionDescriptionHeightByText{
    return ^CGFloat(NSString * text){
        return [self sectionDescriptionHeightByText:text
                                        headerWidth:self.sectionDescriptionEstimatedHeaderWidth()];
    };
}

+(CGFloat)sectionDescriptionHeightByText:(NSString *)text
                             headerWidth:(CGFloat)headerWidth{
    NSString *description = text.length ? text.jobsTr() : @"";
    if (!description.length) return 0;
    CGSize limitSize = CGSizeMake(self.sectionDescriptionWidthByHeaderWidth(headerWidth), CGFLOAT_MAX);
    CGRect textRect = [description boundingRectWithSize:limitSize
                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                             attributes:@{NSFontAttributeName : self.sectionDescriptionFont()}
                                                context:nil];
    return ceil(CGRectGetHeight(textRect)) + self.sectionDescriptionVerticalInset() * 2;
}

+(JobsRetCGFloatByVoidBlock _Nonnull)collapsedHeight{
    return ^CGFloat{
        return self.jobsHeaderHeight() + self.verticalInset() * 2;
    };
}

+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount
                 sectionDescription:(NSString *)sectionDescription
                    innerTableWidth:(CGFloat)innerTableWidth{
    CGFloat width = innerTableWidth > 0 ? innerTableWidth : self.sectionDescriptionEstimatedHeaderWidth();
    CGFloat innerContentHeight = [self sectionDescriptionHeightByText:sectionDescription
                                                           headerWidth:width];
    innerContentHeight += itemCount * self.innerRowHeight();
    return self.collapsedHeight() + self.innerTop() + innerContentHeight + self.innerBottom();
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.items = @[];
        self.pinAccessoryIndex = NSNotFound;
        self.bySelectionStyle(UITableViewCellSelectionStyleNone);
        self.byBgColor(JobsClearColor);
        self.contentView.byBgColor(JobsClearColor);
        self.setupSubviews();
        [JobsThemeCenter.shared
            bindObject:self
                  slot:@"JobsOCRootFoldTableCell.colors"
                 apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
            (void)center;
            JobsOCRootFoldTableCell *cell = (JobsOCRootFoldTableCell *)object;
            cell.updateColors();
            [cell.innerTableView reloadData];
        }];
        [self setExpanded:NO
                 animated:NO];
    };return self;
}

-(void)prepareForReuse{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRootFoldTableCell.class, @selector(jobsPrepareForReuse)))(self, @selector(jobsPrepareForReuse));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareForReuse{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareForReuse];
        self.stopVisibleInnerTextScrolling();
        if (self.chargingProgressTimer) self.chargingProgressTimer.jobsStop();
        self.byChargingProgressTimer(nil);
        self.byChargingProgressPhase(0);
        self.byItems(@[]);
        [self.innerTableView reloadData];
        self.bySectionDescription(nil);
        self.bySelectBlock(nil);
        self.byPinBlock(nil);
        self.byPinAccessoryIndex(NSNotFound);
        self.byPinnedSectionStyle(NO);
        self.chevronView.byHidden(NO);
        self.innerTableView.byTableHeaderView(nil);
        [self setExpanded:NO
                 animated:NO];
    };
}

-(jobsByVoidBlock _Nonnull)jobsDidMoveToWindow{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didMoveToWindow];
        self.syncVisibleInnerTextScrollingState();
        self.syncChargingProgressTimerState();
    };
}

-(void)didMoveToWindow{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRootFoldTableCell.class, @selector(jobsDidMoveToWindow)))(self, @selector(jobsDidMoveToWindow));
    if (action) action();
}

-(void)dealloc{
    self.stopVisibleInnerTextScrolling();
    if (self.chargingProgressTimer) self.chargingProgressTimer.jobsStop();
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRootFoldTableCell.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
        self.updateColors();
        [_innerTableView reloadData];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRootFoldTableCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.reloadSectionDescriptionHeaderViewIfNeeded();
    };
}

-(jobsByVoidBlock _Nonnull)setupSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.cardView.byHidden(NO);
        self.headerView.byHidden(NO);
        self.chevronView.byHidden(NO);
        self.titleLab.byHidden(NO);
        self.subTitleLab.byHidden(NO);
        self.detailClipView.byHidden(NO);
        self.innerTableView.byHidden(NO);
    };
}

-(jobsByVoidBlock _Nonnull)updateColors{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.cardView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.titleLab.byTextCor(JobsLabelColor);
        self.subTitleLab.byTextCor(JobsSecondaryLabelColor);
        self.chevronView.byTintColor(JobsSecondaryLabelColor);
        self.innerTableView.bySeparatorColor(JobsTertiaryLabelColor);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)chevronImage{
    @jobs_weakify(self)
    return ^UIImage *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) {
            return [@"chevron.right".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        };return nil;
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)textByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        return viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    };
}

-(JobsRetBOOLByUIViewModelBlock _Nonnull)isChargingProgressViewModel{
    @jobs_weakify(self)
    return ^BOOL(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *className = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
        return [className isEqualToString:@"JobsProgressDemoVC"] ||
               [className isEqualToString:@"JobsSysProgressDemoVC"] ||
               [className isEqualToString:@"JobsProgressVC"];
    };
}

-(JobsRetBOOLByUIViewModelBlock _Nonnull)isClockViewModel{
    @jobs_weakify(self)
    return ^BOOL(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *className = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
        return [className isEqualToString:@"JobsClockDemoVC"];
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)displayTextByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *text = self.textByViewModel(viewModel);
        if (self.isClockViewModel(viewModel)) {
            return [NSString stringWithFormat:@"　 %@",text];
        }
        if (!self.isChargingProgressViewModel(viewModel)) return text;
        NSArray <NSString *>*states = @[@"🟩⬜⬜", @"🟩🟩⬜", @"🟩🟩🟩"];
        return [NSString stringWithFormat:@"%@ %@", states[self.chargingProgressPhase], text];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)containsChargingProgressItem{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        for (UIViewModel *viewModel in self.items) {
            if (self.isChargingProgressViewModel(viewModel)) return YES;
        };return NO;
    };
}

-(jobsByVoidBlock _Nonnull)prepareChargingProgressTimerIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.containsChargingProgressItem()) {
            if (self.chargingProgressTimer) self.chargingProgressTimer.jobsStop();
            self.byChargingProgressTimer(nil);
            return;
        }
        if (self.chargingProgressTimer) {
            self.syncChargingProgressTimerState();
            return;
        }
        @jobs_weakify(self)
        self.chargingProgressTimer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeGCD)
                .byTimerStyle(TimerStyle_clockwise)
                .byTimeInterval(JobsOCChargingProgressInterval)
                .byQueue(dispatch_get_main_queue())
                .byPauseInBackground(YES)
                .byAutoManageAppState(YES)
                .byOnTick(^(CGFloat time) {
                    @jobs_strongify(self)
                    self.byChargingProgressPhase((self.chargingProgressPhase + 1) % 3);
                    self.refreshVisibleChargingProgressTitle();
                });
        });
        self.chargingProgressTimer.start();
        self.syncChargingProgressTimerState();
    };
}

-(jobsByVoidBlock _Nonnull)syncChargingProgressTimerState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.chargingProgressTimer) return;
        if (self.window && _expanded && self.containsChargingProgressItem()) {
            self.chargingProgressTimer.resume();
        }else{
            if (self.chargingProgressTimer) self.chargingProgressTimer.pause();
        }
    };
}

-(jobsByVoidBlock _Nonnull)refreshVisibleChargingProgressTitle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (NSIndexPath *indexPath in self.innerTableView.indexPathsForVisibleRows) {
            if (indexPath.row >= self.items.count) continue;
            UIViewModel *viewModel = self.items[indexPath.row];
            if (!self.isChargingProgressViewModel(viewModel)) continue;
            [[self.innerTableView cellForRowAtIndexPath:indexPath].textLabel
                .byText(self.displayTextByViewModel(viewModel)) byReloadTextScroll];
        }
    };
}

-(jobsByVoidBlock _Nonnull)syncVisibleInnerTextScrollingState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (UITableViewCell *cell in self.innerTableView.visibleCells) {
            self.syncTextScrollingStateForCell(cell);
        }
    };
}

-(jobsByLabelBlock _Nonnull)applyTextDisplayStrategyToLabel{
    @jobs_weakify(self)
    return ^(UILabel * label){
        @jobs_strongify(self)
        if (!self) return;
        switch (JobsOCCurrentDemoListCellTextDisplayStrategy()) {
            /// 处理 JobsOCDemoListCellTextDisplayStrategyNormal 分支
            case JobsOCDemoListCellTextDisplayStrategyNormal:
                label.byStopTextScroll()
                    .byNumberOfLines(1)
                    .byAdjustsFontSizeToFitWidth(NO)
                    .byMinimumScaleFactor(1)
                    .byLineBreakMode(NSLineBreakByClipping);
                break;
            /// 处理 JobsOCDemoListCellTextDisplayStrategyTailTruncation 分支
            case JobsOCDemoListCellTextDisplayStrategyTailTruncation:
                label.byTextDisplayMode(JobsLabelTextDisplayModeSingleLineTailTruncation);
                break;
            /// 处理 JobsOCDemoListCellTextDisplayStrategyScaleToFit 分支
            case JobsOCDemoListCellTextDisplayStrategyScaleToFit:
                [label byTextDisplayMode:JobsLabelTextDisplayModeScaleToFit
                      minimumScaleFactor:.5f
                    maximumNumberOfLines:1
                     scrollConfiguration:JobsLabelScrollConfiguration.continuousConfiguration()];
                break;
            /// 处理 JobsOCDemoListCellTextDisplayStrategyContinuous 分支
            case JobsOCDemoListCellTextDisplayStrategyContinuous:
                [label byTextDisplayMode:JobsLabelTextDisplayModeScrolling
                      minimumScaleFactor:1
                    maximumNumberOfLines:1
                     scrollConfiguration:JobsLabelScrollConfiguration.continuousConfiguration()];
                break;
            /// 处理 JobsOCDemoListCellTextDisplayStrategyPingPong 分支
            case JobsOCDemoListCellTextDisplayStrategyPingPong:
                [label byTextDisplayMode:JobsLabelTextDisplayModeScrolling
                      minimumScaleFactor:1
                    maximumNumberOfLines:1
                     scrollConfiguration:JobsLabelScrollConfiguration.pingPongConfiguration()];
                break;
        }
    };
}

-(jobsByTableViewCellBlock _Nonnull)syncTextScrollingStateForCell{
    @jobs_weakify(self)
    return ^(UITableViewCell * cell){
        @jobs_strongify(self)
        if (!self) return;
        BOOL shouldScroll = self.window && _expanded;
        if (shouldScroll) {
            if (cell.textLabel) cell.textLabel.byResumeTextScroll();
            if (cell.detailTextLabel) cell.detailTextLabel.byResumeTextScroll();
        }else{
            if (cell.textLabel) cell.textLabel.byPauseTextScroll();
            if (cell.detailTextLabel) cell.detailTextLabel.byPauseTextScroll();
        }
        self.syncAnimatedTitleIconStateForCell(cell);
    };
}

-(jobsByVoidBlock _Nonnull)stopVisibleInnerTextScrolling{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (UITableViewCell *cell in self.innerTableView.visibleCells) {
            if (cell.textLabel) cell.textLabel.byStopTextScroll();
            if (cell.detailTextLabel) cell.detailTextLabel.byStopTextScroll();
            JobsClockIconView *clockIconView = self.clockIconInCell(cell);
            if (clockIconView) clockIconView.stopAndReset(NO);
        }
    };
}

-(void)installAnimatedTitleIconByViewModel:(UIViewModel *)viewModel
                                    inCell:(UITableViewCell *)cell{
    self.removeAnimatedTitleIconsFromCell(cell);
    if (!self.isClockViewModel(viewModel)) return;
    JobsClockIconView *clockIcon =
        [[JobsClockIconView alloc] initWithDirection:JobsImageRotationDirectionClockwise
                                            interval:JobsClockIconViewDefaultInterval];
    clockIcon
        .byTintColor(JobsSecondaryLabelColor)
        .addOn(cell.contentView)
        .byAdd(^(MASConstraintMaker *make) {
            make.left.centerY.equalTo(cell.textLabel);
            make.size.mas_equalTo(CGSizeMake(JobsOCAnimatedTitleIconSize,
                                             JobsOCAnimatedTitleIconSize));
        });
    self.syncAnimatedTitleIconStateForCell(cell);
}

-(jobsByTableViewCellBlock _Nonnull)removeAnimatedTitleIconsFromCell{
    @jobs_weakify(self)
    return ^(UITableViewCell * cell){
        @jobs_strongify(self)
        if (!self) return;
        for (UIView *subview in cell.contentView.subviews.copy) {
            if (![subview isKindOfClass:JobsClockIconView.class]) continue;
            ((JobsClockIconView *)subview).jobsStop();
            [subview removeFromSuperview];
        }
    };
}

-(JobsRetJobsClockIconViewByUITableViewCellBlock _Nonnull)clockIconInCell{
    @jobs_weakify(self)
    return ^JobsClockIconView *(UITableViewCell * cell){
        @jobs_strongify(self)
        if (!self) return nil;
        for (UIView *subview in cell.contentView.subviews) {
            if ([subview isKindOfClass:JobsClockIconView.class]) {
                return (JobsClockIconView *)subview;
            }
        };return nil;
    };
}

-(jobsByTableViewCellBlock _Nonnull)syncAnimatedTitleIconStateForCell{
    @jobs_weakify(self)
    return ^(UITableViewCell * cell){
        @jobs_strongify(self)
        if (!self) return;
        JobsClockIconView *clockIcon = self.clockIconInCell(cell);
        if (!clockIcon) return;
        if (self.window &&
            _expanded &&
            !UIAccessibilityIsReduceMotionEnabled()) {
            if (!clockIcon.isRunning) clockIcon.start();
        }else{
            clockIcon.stopAndReset(NO);
        }
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)subTextByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *subText = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
        if (subText.length) return subText;
        return viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    };
}

-(JobsRetNSAttributedStringByUIViewModelBlock _Nonnull)subAttributedTextByViewModel{
    @jobs_weakify(self)
    return ^NSAttributedString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        return viewModel.subTextModel.attributedTitle;
    };
}

-(JobsRetImageByVoidBlock _Nonnull)pinImage{
    @jobs_weakify(self)
    return ^UIImage *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) {
            return [@"pin.fill".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        };return nil;
    };
}

-(JobsRetImageByVoidBlock _Nonnull)unpinImage{
    @jobs_weakify(self)
    return ^UIImage *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) {
            return [@"minus.circle.fill".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        };return nil;
    };
}

-(JobsRetNSDictionaryNSStringNSStringByVoidBlock _Nonnull)demoIconSymbolNamesByClassName{
    @jobs_weakify(self)
    return ^NSDictionary <NSString *, NSString *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        static NSDictionary <NSString *, NSString *>*symbolNames;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            symbolNames = @{
                @"JobsSwiftParityMomentsPreviewDemoVC": @"photo.on.rectangle.angled",
                @"JobsSwiftParityThrottleDebounceDemoVC": @"hare.fill",
                @"JobsSwiftParityTaskCenterDemoVC": @"checkmark.circle.fill",
                @"JobsSwiftParityAnimatedButtonNumberDemoVC": @"number.circle.fill",
                @"JobsSwiftParityDashboardDemoVC": @"chart.bar.xaxis",
                @"JobsSwiftParityControlEventsDemoVC": @"gamecontroller.fill",
                @"JobsSwiftParityTraitChangeDemoVC": @"circle.lefthalf.fill",
                @"JobsSwiftParityEditProfileDemoVC": @"person.crop.circle.badge.checkmark",
                @"JobsSwiftParityPDFDemoVC": @"doc.richtext.fill",
                @"JobsSwiftParityToastDemoVC": @"text.bubble.fill",
                @"JobsSwiftParityAlertDemoVC": @"exclamationmark.bubble.fill",
                @"JobsSwiftParityOpenDemoVC": @"arrow.up.right.square.fill",
                @"JobsSwiftParitySnowflakeDemoVC": @"snowflake.circle",
                @"JobsTabBarCtrlDemoVC": @"rectangle.bottomthird.inset.filled",
                @"SlideToUnlockDemoVC": @"lock.open",
                @"JobsNavigationDemoVC": @"arrow.triangle.turn.up.right.diamond",
                @"JobsTimerDemoListVC": @"stopwatch",
                @"JobsOCAudioRecorderDemoVC": @"mic.fill",
                @"JobsBluetoothDemoVC": @"antenna.radiowaves.left.and.right",
                @"JobsCoreMotionDemoVC": @"gyroscope",
                @"JobsOCSceneDelegateDemoVC": @"macwindow.on.rectangle",
                @"JobsScreenshotTipsDemoVC": @"camera.viewfinder",
                @"JobsScreenshotProtectionDemoVC": @"eye.slash",
                @"JobsAnimatedNumberLabelDemoVC": @"textformat.123",
                @"UILabelScrollingDemoVC": @"text.line.last.and.arrowtriangle.forward",
                @"JobsImageRotationDemoVC": @"clock.arrow.circlepath",
                @"JobsClockDemoVC": @"clock",
                @"LotteryVC": @"circle.grid.cross.fill",
                @"JobsRedPacketRainDemoVC": @"envelope.open.fill",
                @"JobsOCTimerMgrDemoVC": @"timer",
                @"JobsMultiTimerTableDemoVC": @"list.number",
                @"JobsMarqueeViewDemoVC": @"text.line.first.and.arrowtriangle.forward",
                @"CalendarVC": @"calendar",
                @"JobsVerticalMenuMainVC": @"sidebar.left",
                @"JobsLinkageMenuViewDemoVC": @"rectangle.split.2x1",
                @"JobsOCRefresherDemoVC": @"arrow.clockwise",
                @"JobsDouyinRefreshDemoVC": @"arrow.triangle.2.circlepath",
                @"JobsViewPushDemoVC": @"rectangle.portrait.and.arrow.right",
                @"JobsSideDrawerDemoVC": @"rectangle.leadinghalf.inset.filled",
                @"JobsOCKeyboardMgrDemoVC": @"keyboard",
                @"JobsOCNumberStepperDemoVC": @"plusminus.circle",
                @"JobsOCGraphicCaptchaDemoVC": @"checkmark.shield",
                @"JobsQRCodeDemoVC": @"qrcode",
                @"JobsCNIDDemoVC": @"person.text.rectangle",
                @"JobsOCSkeletonViewDemoVC": @"wave.3.right",
                @"JobsOCExcelDemoVC": @"rectangle.grid.3x2.fill",
                @"JobsOCMarkdownDocumentsDemoVC": @"book.closed.fill",
                @"JobsHandwritingDemoVC": @"pencil.tip.crop.circle",
                @"ExcelVC": @"tablecells",
                @"JXCategoryViewVerticalShowVC": @"rectangle.split.1x2",
                @"JobsPostVC": @"square.and.pencil",
                @"PicToStrStoreVC": @"lock.doc",
                @"HotRefreshVC": @"flame",
                @"FMDB_VC": @"cylinder",
                @"Realm_VC": @"externaldrive",
                @"PointLabTestVC": @"list.bullet",
                @"WidgetVC": @"apps.iphone",
                @"LandscapeSwitchVC": @"iphone.landscape",
                @"LocalNotificationsVC": @"bell.badge",
                @"CompressStrVC": @"doc.zipper",
                @"AppIconSwitchingVC": @"app.badge",
                @"MyTableTableVC": @"hand.tap",
                @"CtrlClipboardCueVC": @"doc.on.clipboard",
                @"JobsAppDoorDemoListVC": @"door.left.hand.closed",
                @"JobsZFPlayerDemoListVC": @"play.rectangle",
                @"TransparentRegionVC": @"square.dashed.inset.filled",
                @"JobsMosaicDemoListVC": @"square.grid.3x3.fill",
                @"JobsButtonCoverCellDemoListVC": @"rectangle.grid.1x2",
                @"JobsSphereDemoVC": @"globe.asia.australia",
                @"JobsOCCommentDemoVC": @"bubble.left.and.bubble.right",
                @"JobsOCSearcherDemoVC": @"magnifyingglass",
                @"JobsShootingVC": @"photo.on.rectangle",
                @"JobsOCVideoRecorderVC": @"video",
                @"JobsLiveCommentDemoVC": @"text.bubble",
                @"JobsLiveStreamDemoVC": @"dot.radiowaves.left.and.right",
                @"DynamicViewTestVC": @"photo.stack",
                @"JobsProgressVC": @"chart.bar",
                @"JobsCountdownLayerDemoVC": @"flame.fill",
                @"JobsLongPressLikeDemoVC": @"hand.thumbsup.fill",
                @"JobsSysProgressDemoVC": @"gauge",
                @"JobsProgressDemoVC": @"chart.line.uptrend.xyaxis",
                @"TestIrregularViewTestVC": @"hexagon",
                @"JobsIM": @"message",
                @"TestLabelVC": @"character.textbox",
                @"JobsDropDownListVC": @"chevron.down.square",
                @"JobsOCCountryCodeCtrl": @"flag",
                @"YTKNetworkStudyVC": @"network",
                @"JobsWebSocketDemoVC": @"arrow.left.arrow.right.circle.fill",
                @"CoreTextLearningVC": @"textformat",
                @"JXCategoryPopupVC": @"rectangle.inset.filled.and.person.filled",
                @"UITableViewCellEditorVC": @"envelope",
                @"JobsSettingGestureVC": @"hand.draw",
                @"CXBVC": @"cpu",
                @"OCDynamicRegisterVC": @"function",
                @"JXCategoryViewWithHeaderViewVC": @"rectangle.topthird.inset.filled",
                @"UILabelWordRotatingVC": @"rotate.right",
                @"TestBaseLabelVC": @"text.alignleft",
                @"RandomTestVC": @"dice",
                @"CustomTableViewCellVC": @"list.bullet.rectangle",
                @"CustomBtnVC": @"button.programmable",
                @"GXCardViewDemoVC": @"rectangle.stack",
                @"JobsWalletVC": @"creditcard",
                @"JobsScrollViewVC": @"scroll",
                @"JobsPresentingVC": @"sparkles",
                @"MasonryVC": @"grid",
                @"UITBVCellFoldVC": @"rectangle.compress.vertical",
                @"ProtocolKitVC": @"puzzlepiece.extension"
            };
            NSMutableDictionary <NSString *, NSString *>*classNamesBySymbolName = NSMutableDictionary.dictionary;
            [symbolNames enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull className,
                                                             NSString * _Nonnull symbolName,
                                                             BOOL * _Nonnull stop) {
                NSString *existingClassName = classNamesBySymbolName[symbolName];
                if (existingClassName.length) {
                    self.logDemoIconIssueOnce([NSString stringWithFormat:@"Demo 入口 %@ 与 %@ 重复使用系统图标 %@，请改为语义贴合且不重复的图标",
                                                existingClassName,
                                                className,
                                                symbolName]);
                }else{
                    classNamesBySymbolName[symbolName] = className;
                }
            }];
        });return symbolNames;
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoIconClassNameByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *className = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
        if ([className isEqualToString:@"JobsGraphicCaptchaDemoVC"]) {
            className = @"JobsOCGraphicCaptchaDemoVC";
        };return className;
    };
}

-(jobsByStrBlock _Nonnull)logDemoIconIssueOnce{
    @jobs_weakify(self)
    return ^(NSString * issue){
        @jobs_strongify(self)
        if (!self) return;
        if (!issue.length) return;
        static NSMutableSet <NSString *>*loggedIssues;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            loggedIssues = NSMutableSet.set;
        });
        @synchronized (loggedIssues) {
            if ([loggedIssues containsObject:issue]) return;
            [loggedIssues addObject:issue];
        }
        JobsLog(@"Demo 图标配置诊断：%@",issue);
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoIconSymbolNameByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *className = self.demoIconClassNameByViewModel(viewModel);
        NSString *symbolName = self.demoIconSymbolNamesByClassName()[className];
        if (!symbolName.length) {
            NSString *entryName = className.length ? className : self.textByViewModel(viewModel);
            self.logDemoIconIssueOnce([NSString stringWithFormat:@"Demo 入口 %@ 缺少显式系统图标映射，已使用 %@ 兜底",
                                        entryName,
                                        JobsOCDemoIconFallbackSymbolName]);
            return JobsOCDemoIconFallbackSymbolName;
        };return symbolName;
    };
}

-(JobsRetUIImageByUIViewModelBlock _Nonnull)demoIconImageByViewModel{
    @jobs_weakify(self)
    return ^UIImage *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        if (viewModel.image) {
            return [viewModel.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        NSString *symbolName = self.demoIconSymbolNameByViewModel(viewModel);
        UIImage *image = symbolName.sys_img;
        if (!image) {
            NSString *entryName = self.demoIconClassNameByViewModel(viewModel);
            self.logDemoIconIssueOnce([NSString stringWithFormat:@"Demo 入口 %@ 配置了无效系统图标 %@，已使用 %@ 兜底",
                                        entryName.length ? entryName : self.textByViewModel(viewModel),
                                        symbolName,
                                        JobsOCDemoIconFallbackSymbolName]);
            image = JobsOCDemoIconFallbackSymbolName.sys_img;
        };return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    };
}

-(UIImage *)redAccessoryImageByImage:(UIImage *)image
                           tintColor:(UIColor *)tintColor{
    if (@available(iOS 13.0, *)) {
        return [image imageWithTintColor:tintColor
                           renderingMode:UIImageRenderingModeAlwaysOriginal];
    };return image;
}

-(JobsRetStrByBOOLBlock _Nonnull)subTitleTextByExpanded{
    @jobs_weakify(self)
    return ^NSString *(BOOL expanded){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *stateText = self.pinnedSectionStyle ? @"已置顶".jobsTr() : (expanded ? @"已展开".jobsTr() : @"点击展开".jobsTr());
        return [NSString stringWithFormat:@"%lu 个 Demo · %@",
                (unsigned long)self.items.count,
                stateText];
    };
}

-(JobsRetBtnByNSIntegerBlock _Nonnull)pinAccessoryButtonByIndex{
    @jobs_weakify(self)
    return ^UIButton *(NSInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        UIColor *tintColor = JobsRedColor;
        UIImage *accessoryImage = [self redAccessoryImageByImage:self.pinnedSectionStyle ? self.unpinImage() : self.pinImage()
                                                      tintColor:tintColor];
        @jobs_weakify(self)
        return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(accessoryImage)
                .highlightedStateImageBy(accessoryImage)
                .selectedStateImageBy(accessoryImage)
                .byImageEdgeInsets(UIEdgeInsetsMake(8, 8, 8, 8))
                .byAdjustsImageWhenHighlighted(NO)
                .byImageView(^(__kindof UIImageView * _Nullable imageView) {
                    imageView
                        .byTintColor(tintColor)
                        .byContentMode(UIViewContentModeScaleAspectFit);
                })
                .onClickBy(^(UIButton *x) {
                    @jobs_strongify(self)
                    self.byPinAccessoryIndex(NSNotFound);
                    if (self.pinBlock) self.pinBlock(x.tag);
                })
                .byTag(index)
                .byTintColor(tintColor)
                .byBgColor(JobsClearColor)
                .bySize(CGSizeMake(40, 40));
            if (@available(iOS 16.0, *)) {
                button.jobsResetTitleBaseForegroundColor(tintColor);
                button.jobsResetImageColorTransformer(^UIColor *_Nullable(UIColor *_Nullable color) {
                    return tintColor;
                });
                button.jobsResetImage(accessoryImage);
            }
        });
    };
}

-(void)handleInnerCellLongPress:(UILongPressGestureRecognizer *)gesture{
    jobsByLongPressGestureRecognizerBlock action = ((jobsByLongPressGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRootFoldTableCell.class, @selector(jobsHandleInnerCellLongPress)))(self, @selector(jobsHandleInnerCellLongPress));
    if (action) action(gesture);
}

-(jobsByLongPressGestureRecognizerBlock _Nonnull)jobsHandleInnerCellLongPress{
    @jobs_weakify(self)
    return ^(UILongPressGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (gesture.state != UIGestureRecognizerStateBegan) return;
        CGPoint point = [gesture locationInView:self.innerTableView];
        NSIndexPath *indexPath = [self.innerTableView indexPathForRowAtPoint:point];
        if (!indexPath ||
            indexPath.row < 0 ||
            indexPath.row >= (NSInteger)self.items.count) return;
        self.byPinAccessoryIndex(indexPath.row);
        NSObject.feedbackGenerator(nil);
        [self.innerTableView reloadData];
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)sectionDescriptionHeaderWidth{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGFloat headerWidth = CGRectGetWidth(self.innerTableView.bounds);
        if (headerWidth <= 0) headerWidth = CGRectGetWidth(self.detailClipView.bounds);
        if (headerWidth <= 0) headerWidth = JobsOCRootFoldTableCell.sectionDescriptionEstimatedHeaderWidth();
        return headerWidth;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)sectionDescriptionHeaderHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return [JobsOCRootFoldTableCell sectionDescriptionHeightByText:self.sectionDescription
                                                           headerWidth:self.sectionDescriptionHeaderWidth()];
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)innerTableContentHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return self.sectionDescriptionHeaderHeight() +
               self.items.count * JobsOCRootFoldTableCell.innerRowHeight();
    };
}

-(jobsByVoidBlock _Nonnull)reloadSectionDescriptionHeaderViewIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!_innerTableView) return;
        UIView *headerView = self.innerTableView.tableHeaderView;
        CGFloat headerWidth = self.sectionDescriptionHeaderWidth();
        CGFloat headerHeight = self.sectionDescriptionHeaderHeight();
        if (headerHeight <= 0) {
            if (headerView) self.innerTableView.tableHeaderView = nil;
        }else if (!headerView ||
                  ABS(CGRectGetWidth(headerView.bounds) - headerWidth) > 0.5 ||
                  ABS(CGRectGetHeight(headerView.bounds) - headerHeight) > 0.5){
            self.innerTableView.byTableHeaderView(self.sectionDescriptionHeaderViewByText(self.sectionDescription));
        }
        if (_expanded) [_innerTableHeightConstraint setOffset:self.innerTableContentHeight()];
    };
}

-(JobsRetViewByStringBlock _Nonnull)sectionDescriptionHeaderViewByText{
    @jobs_weakify(self)
    return ^UIView *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        CGFloat headerWidth = self.sectionDescriptionHeaderWidth();
        CGFloat headerHeight = [JobsOCRootFoldTableCell sectionDescriptionHeightByText:text
                                                                           headerWidth:headerWidth];
        if (headerHeight <= 0) return nil;
        UIView *headerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(CGRectMake(0, 0, headerWidth, headerHeight))
                .byBgColor(JobsClearColor);
        });
        CGFloat labelWidth = JobsOCRootFoldTableCell.sectionDescriptionWidthByHeaderWidth(headerWidth);
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(text.jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(JobsOCRootFoldTableCell.sectionDescriptionFont())
                .byNumberOfLines(0)
                .byLineBreakMode(NSLineBreakByWordWrapping)
                .byFrame(CGRectMake(JobsOCRootFoldTableCell.sectionDescriptionHorizontalInset(),
                                    JobsOCRootFoldTableCell.sectionDescriptionVerticalInset(),
                                    labelWidth,
                                    headerHeight - JobsOCRootFoldTableCell.sectionDescriptionVerticalInset() * 2))
                .byClipsToBounds(YES)
                .addOn(headerView);
        });
        return headerView;
    };
}

-(void)configureWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                        expanded:(BOOL)expanded
                     selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                         pinBlock:(jobsByNSIntegerBlock _Nullable)pinBlock{
    self.byPinnedSectionStyle(NO);
    self.byItems(sectionModel.dataMutArr.copy ?: @[]);
    self.bySectionDescription(sectionModel.sectionDescription);
    self.bySelectBlock(selectBlock);
    self.byPinBlock(pinBlock);
    self.byPinAccessoryIndex(NSNotFound);
    self.titleLab.byText([NSString stringWithFormat:@"%@  (%lu)",
                          sectionModel.title,
                          (unsigned long)self.items.count]);
    self.chevronView.byImage(self.chevronImage());
    self.chevronView.byHidden(NO);
    self.innerTableView.byTableHeaderView(self.sectionDescriptionHeaderViewByText(self.sectionDescription));
    [self.innerTableView reloadData];
    [self setExpanded:expanded
             animated:NO];
    self.prepareChargingProgressTimerIfNeeded();
}

-(void)configurePinnedWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                           selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                            unpinBlock:(jobsByNSIntegerBlock _Nullable)unpinBlock{
    self.byPinnedSectionStyle(YES);
    self.byItems(sectionModel.dataMutArr.copy ?: @[]);
    self.bySectionDescription(nil);
    self.bySelectBlock(selectBlock);
    self.byPinBlock(unpinBlock);
    self.byPinAccessoryIndex(NSNotFound);
    self.titleLab.byText([NSString stringWithFormat:@"%@  (%lu)",
                          sectionModel.title,
                          (unsigned long)self.items.count]);
    self.chevronView.byImage(nil);
    self.chevronView.byHidden(YES);
    self.innerTableView.byTableHeaderView(nil);
    [self.innerTableView reloadData];
    [self setExpanded:YES
             animated:NO];
    self.prepareChargingProgressTimerIfNeeded();
}

-(void)setExpanded:(BOOL)expanded
          animated:(BOOL)animated{
    if (self.pinnedSectionStyle) expanded = YES;
    _expanded = expanded;
    self.subTitleLab.byText(self.subTitleTextByExpanded(expanded));
    CGFloat targetHeight = expanded ? self.innerTableContentHeight() : 0;
    [_innerTableHeightConstraint setOffset:targetHeight];
    if (expanded) self.detailClipView.byHidden(NO);
    void (^changes)(void) = ^{
        self.detailClipView.byAlpha(expanded ? 1 : 0);
        self.chevronView.byTransform(expanded ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity);
        if (self.window) [self.contentView layoutIfNeeded];
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (!expanded) self.detailClipView.byHidden(YES);
    };
    if (animated) {
        UIView.jobsAnimateWithOptions(0.28,
            0,
            UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction,
            changes,
            completion);
    }else{
        changes();
        completion(YES);
    }
    self.syncVisibleInnerTextScrollingState();
    self.syncChargingProgressTimerState();
}

#pragma mark —— UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsOCRootFoldTableCell.innerRowHeight();
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCRootFoldInnerCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:JobsOCRootFoldInnerCellReuseIdentifier];
    }
    if (indexPath.row < 0 || indexPath.row >= (NSInteger)self.items.count) {
        self.removeAnimatedTitleIconsFromCell(cell);
        cell.textLabel.byText(nil);
        cell.detailTextLabel
            .byText(nil)
            .byAttributedText(nil);
        cell.imageView.byImage(nil);
        cell.byAccessoryView(nil);
        cell.byAccessoryType(UITableViewCellAccessoryNone);
        return cell;
    }
    UIViewModel *viewModel = self.items[indexPath.row];
    NSAttributedString *subAttributedText = self.subAttributedTextByViewModel(viewModel);
    cell.textLabel
        .byText(self.displayTextByViewModel(viewModel))
        .byFont(JobsOCRootFoldTableCell.innerTitleFont());
    cell.detailTextLabel
        .byFont(JobsOCRootFoldTableCell.innerSubTitleFont());
    cell.byAccessoryView(nil);
    cell.imageView
        .byImage(self.demoIconImageByViewModel(viewModel))
        .byHighlightedImage(nil)
        .byContentMode(UIViewContentModeScaleAspectFit)
        .byTintColor(JobsSecondaryLabelColor);
    if (subAttributedText.length) {
        NSMutableAttributedString *themedSubAttributedText = subAttributedText.mutableCopy;
        [themedSubAttributedText addAttribute:NSForegroundColorAttributeName
                                       value:JobsSecondaryLabelColor
                                       range:NSMakeRange(0, themedSubAttributedText.length)];
        cell.detailTextLabel.byText(nil);
        cell.detailTextLabel.byAttributedText(themedSubAttributedText);
    }else{
        cell.detailTextLabel.byAttributedText(nil);
        cell.detailTextLabel.byText(self.subTextByViewModel(viewModel));
    }
    cell.textLabel.byTextCor(JobsLabelColor);
    cell.detailTextLabel.byTextCor(JobsSecondaryLabelColor);
    cell.byTintColor(JobsSecondaryLabelColor);
    self.applyTextDisplayStrategyToLabel(cell.textLabel);
    self.applyTextDisplayStrategyToLabel(cell.detailTextLabel);
    if (self.pinAccessoryIndex == indexPath.row) {
        cell.byAccessoryType(UITableViewCellAccessoryNone);
        cell.byAccessoryView(self.pinAccessoryButtonByIndex(indexPath.row));
    }else{
        cell.byAccessoryType(UITableViewCellAccessoryDisclosureIndicator);
    }
    BOOL isLastItem = indexPath.row == self.items.count - 1;
    cell
        .bySelectionStyle(UITableViewCellSelectionStyleDefault)
        .bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsTertiarySystemBackgroundColor);
        }))
        .bySeparatorInset(isLastItem
            ? UIEdgeInsetsMake(0, 16, 0, CGRectGetWidth(tableView.bounds))
            : UIEdgeInsetsMake(0, 16, 0, 16))
        .byContentView(^(__kindof UIView * _Nullable contentView) {
            contentView.byBgColor(JobsClearColor);
        })
        .byBgColor(JobsClearColor);
    [self installAnimatedTitleIconByViewModel:viewModel
                                      inCell:cell];
    self.syncTextScrollingStateForCell(cell);
    return cell;
}

- (void)tableView:(UITableView *)tableView
   willDisplayCell:(UITableViewCell *)cell
 forRowAtIndexPath:(NSIndexPath *)indexPath{
    (((jobsByTableViewCellBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRootFoldTableCell.class, @selector(syncTextScrollingStateForCell)))(self, @selector(syncTextScrollingStateForCell)))(cell);
}

- (void)tableView:(UITableView *)tableView
didEndDisplayingCell:(UITableViewCell *)cell
 forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (cell.textLabel) cell.textLabel.byPauseTextScroll();
    if (cell.detailTextLabel) cell.detailTextLabel.byPauseTextScroll();
    JobsClockIconView *clockIconView = self.clockIconInCell(cell);
    if (clockIconView) clockIconView.stopAndReset(NO);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    if (indexPath.row < 0 || indexPath.row >= (NSInteger)self.items.count) return;
    if (self.selectBlock) self.selectBlock(indexPath.row);
}
#pragma mark —— lazyLoad
-(UIView *)cardView{
    if (!_cardView) {
        _cardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byCornerRadius(14)
                .byClipsToBounds(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(JobsOCRootFoldTableCell.verticalInset());
                    make.bottom.equalTo(self.contentView).offset(-JobsOCRootFoldTableCell.verticalInset());
                    make.left.equalTo(self.contentView).offset(10);
                    make.right.equalTo(self.contentView).offset(-10);
                });
        });
    };return _cardView;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.addOn(self.cardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.left.right.equalTo(self.cardView);
                    make.height.mas_equalTo(JobsOCRootFoldTableCell.jobsHeaderHeight()).priority(999);
                });
        });
    };return _headerView;
}

-(UIImageView *)chevronView{
    if (!_chevronView) {
        _chevronView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byContentMode(UIViewContentModeScaleAspectFit)
                .addOn(self.headerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self.headerView).offset(-16);
                    make.centerY.equalTo(self.headerView);
                    make.size.mas_equalTo(CGSizeMake(16, 16));
                });
        });
    };return _chevronView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byFont(JobsOCRootFoldTableCell.titleFont)
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .byAdjustsFontSizeToFitWidth(NO)
                .byMinimumScaleFactor(1)
                .addOn(self.headerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.headerView).offset(16);
                    make.right.lessThanOrEqualTo(self.chevronView.mas_left).offset(-10);
                    make.top.equalTo(self.headerView).offset(JobsOCRootFoldTableCell.headerTitleTop());
                    make.height.mas_equalTo(JobsOCRootFoldTableCell.titleHeight());
                });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byFont(JobsOCRootFoldTableCell.subTitleFont())
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .byAdjustsFontSizeToFitWidth(NO)
                .byMinimumScaleFactor(1)
                .addOn(self.headerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.titleLab);
                    make.right.lessThanOrEqualTo(self.chevronView.mas_left).offset(-10);
                    make.top.equalTo(self.headerView).offset(JobsOCRootFoldTableCell.headerSubTitleTop());
                    make.height.mas_equalTo(JobsOCRootFoldTableCell.subTitleHeight());
                });
        });
    };return _subTitleLab;
}

-(UIView *)detailClipView{
    if (!_detailClipView) {
        _detailClipView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byClipsToBounds(YES)
                .addOn(self.cardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.headerView.mas_bottom);
                    make.left.right.bottom.equalTo(self.cardView);
                });
        });
    };return _detailClipView;
}

-(UILongPressGestureRecognizer *)innerCellLongPressGesture{
    if (!_innerCellLongPressGesture) {
        _innerCellLongPressGesture = [UILongPressGestureRecognizer.alloc initWithTarget:self
                                                                                action:@selector(handleInnerCellLongPress:)];
        _innerCellLongPressGesture.byMinimumPressDuration(0.45);
        _innerCellLongPressGesture.byCancelsTouchesInView(NO);
    };return _innerCellLongPressGesture;
}

-(UITableView *)innerTableView{
    if (!_innerTableView) {
        _innerTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView.byDataSource(self)
                .byDelegate(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(JobsOCRootFoldTableCell.innerRowHeight())
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySeparatorInset(UIEdgeInsetsMake(0, 16, 0, 16))
                .byScrollEnabled(NO)
                .byBounces(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.detailClipView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.detailClipView).offset(JobsOCRootFoldTableCell.innerTop());
                    make.left.right.equalTo(self.detailClipView);
                    _innerTableHeightConstraint = make.height.mas_equalTo(0).priority(999);
                    make.bottom.lessThanOrEqualTo(self.detailClipView).offset(-JobsOCRootFoldTableCell.innerBottom()).priority(999);
                });
            [tableView addGestureRecognizer:self.innerCellLongPressGesture];
        });
    };return _innerTableView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCRootFoldTableCell
-(JobsRetJobsOCRootFoldTableCellByBOOLBlock _Nonnull)byPinnedSectionStyle{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setPinnedSectionStyle:data];
        return self;
    };
}

-(JobsRetJobsOCRootFoldTableCellByJobsTimerBlock _Nonnull)byChargingProgressTimer{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell * _Nullable(JobsTimer * _Nullable data){
        @jobs_strongify(self)
        [self setChargingProgressTimer:data];
        return self;
    };
}

-(JobsRetJobsOCRootFoldTableCellByNSArrayUIViewModelBlock _Nonnull)byItems{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell * _Nullable(NSArray <UIViewModel *>* _Nullable data){
        @jobs_strongify(self)
        [self setItems:data];
        return self;
    };
}

-(JobsRetJobsOCRootFoldTableCellByNSIntegerBlock _Nonnull)byChargingProgressPhase{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setChargingProgressPhase:data];
        return self;
    };
}

-(JobsRetJobsOCRootFoldTableCellByNSIntegerBlock _Nonnull)byPinAccessoryIndex{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setPinAccessoryIndex:data];
        return self;
    };
}

-(JobsRetJobsOCRootFoldTableCellByjobsByNSIntegerBlockBlock _Nonnull)byPinBlock{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell * _Nullable(jobsByNSIntegerBlock data){
        @jobs_strongify(self)
        [self setPinBlock:data];
        return self;
    };
}

-(JobsRetJobsOCRootFoldTableCellByjobsByNSIntegerBlockBlock _Nonnull)bySelectBlock{
    @jobs_weakify(self)
    return ^__kindof JobsOCRootFoldTableCell * _Nullable(jobsByNSIntegerBlock data){
        @jobs_strongify(self)
        [self setSelectBlock:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCRootFoldTableCell
@end
