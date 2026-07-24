//
//  JobsOCRootFoldTableCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsOCRootFoldTableCell.h"

NSString *const JobsOCRootFoldTableCellReuseIdentifier = @"JobsOCRootFoldTableCell";
static NSString *const JobsOCRootFoldInnerCellReuseIdentifier = @"JobsOCRootFoldInnerCell";
static NSString *const JobsOCDemoIconFallbackSymbolName = @"questionmark.app";
static NSTimeInterval const JobsOCChargingProgressInterval = 0.45;

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

-(UIView *)sectionDescriptionHeaderViewByText:(NSString *)text;
-(CGFloat)sectionDescriptionHeaderWidth;
-(CGFloat)sectionDescriptionHeaderHeight;
-(CGFloat)innerTableWidth;
-(CGFloat)innerTableContentHeight;
-(void)reloadSectionDescriptionHeaderViewIfNeeded;
-(void)prepareChargingProgressTimerIfNeeded;
-(void)syncChargingProgressTimerState;
-(void)refreshVisibleChargingProgressTitle;
-(NSString *)demoIconClassNameByViewModel:(UIViewModel *)viewModel;
-(void)logDemoIconIssueOnce:(NSString *)issue;

@end

@implementation JobsOCRootFoldTableCell{
    MASConstraint *_innerTableHeightConstraint;
    BOOL _expanded;
}

+(CGFloat)verticalInset{
    return 8;
}

+(UIFont *)titleFont{
    return UIFontWeightMediumSize(16);
}

+(UIFont *)subTitleFont{
    return UIFontWeightRegularSize(12);
}

+(UIFont *)sectionDescriptionFont{
    return UIFontWeightRegularSize(13);
}

+(UIFont *)innerTitleFont{
    return UIFontWeightRegularSize(15);
}

+(UIFont *)innerSubTitleFont{
    return UIFontWeightRegularSize(11);
}

+(CGFloat)headerTitleTop{
    return 11;
}

+(CGFloat)headerTitleGap{
    return 5;
}

+(CGFloat)headerTitleBottom{
    return 10;
}

+(CGFloat)headerSubTitleTop{
    return self.headerTitleTop + self.titleHeight + self.headerTitleGap;
}

+(CGFloat)titleHeight{
    return ceil(self.titleFont.lineHeight);
}

+(CGFloat)subTitleHeight{
    return ceil(self.subTitleFont.lineHeight);
}

+(CGFloat)headerHeight{
    CGFloat textHeight = self.headerTitleTop +
                         self.titleHeight +
                         self.headerTitleGap +
                         self.subTitleHeight +
                         self.headerTitleBottom;
    return MAX(64, textHeight);
}

+(CGFloat)innerTop{
    return 10;
}

+(CGFloat)innerBottom{
    return 10;
}

+(CGFloat)innerRowHeight{
    return 50;
}

+(CGFloat)innerTextWidthByInnerTableWidth:(CGFloat)innerTableWidth{
    return MAX(120, innerTableWidth - 128);
}

+(CGFloat)innerTextHeightByText:(NSString *)text
                           font:(UIFont *)font
                          width:(CGFloat)width{
    if (!text.length || width <= 0) return 0;
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName : font}
                                         context:nil];
    return ceil(CGRectGetHeight(textRect));
}

+(NSAttributedString *)wrappedAttributedText:(NSAttributedString *)attributedText
                                  defaultFont:(UIFont *)defaultFont{
    if (!attributedText.length) return attributedText;
    NSMutableParagraphStyle *defaultParagraphStyle = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable paragraphStyle) {
        paragraphStyle.byLineBreakMode(NSLineBreakByWordWrapping);
    });
    NSMutableAttributedString *wrappedText = JobsMutAttributedString(attributedText.string);
    [wrappedText addAttributes:@{
        NSFontAttributeName : defaultFont,
        NSParagraphStyleAttributeName : defaultParagraphStyle
    } range:NSMakeRange(0, wrappedText.length)];
    [attributedText enumerateAttributesInRange:NSMakeRange(0, attributedText.length)
                                       options:0
                                    usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs,
                                                 NSRange range,
                                                 BOOL * _Nonnull stop) {
        [wrappedText addAttributes:attrs
                             range:range];
    }];
    NSUInteger index = 0;
    while (index < wrappedText.length) {
        NSRange range = NSMakeRange(0, 0);
        NSParagraphStyle *paragraphStyle = [wrappedText attribute:NSParagraphStyleAttributeName
                                                           atIndex:index
                                                    effectiveRange:&range];
        NSMutableParagraphStyle *wrappedParagraphStyle = paragraphStyle.mutableCopy ?: jobsMakeParagraphStyle(nil);
        wrappedParagraphStyle.byLineBreakMode(NSLineBreakByWordWrapping);
        [wrappedText addAttribute:NSParagraphStyleAttributeName
                            value:wrappedParagraphStyle
                            range:range];
        index = NSMaxRange(range);
    };return wrappedText;
}

+(CGFloat)innerAttributedTextHeight:(NSAttributedString *)attributedText
                              width:(CGFloat)width{
    if (!attributedText.length || width <= 0) return 0;
    CGRect textRect = [attributedText boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                   context:nil];
    return ceil(CGRectGetHeight(textRect));
}

+(NSString *)innerTitleByViewModel:(UIViewModel *)viewModel{
    NSString *title = viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    if (![NSStringFromClass(viewModel.cls) isEqualToString:@"JobsProgressDemoVC"]) return title;
    return [NSString stringWithFormat:@"🟩🟩🟩 %@",title];
}

+(NSString *)innerSubTitleByViewModel:(UIViewModel *)viewModel{
    NSString *subTitle = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    if (subTitle.length) return subTitle;
    return viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
}

+(CGFloat)innerRowHeightByViewModel:(UIViewModel *)viewModel
                    innerTableWidth:(CGFloat)innerTableWidth{
    CGFloat textWidth = [self innerTextWidthByInnerTableWidth:innerTableWidth];
    CGFloat titleHeight = [self innerTextHeightByText:[self innerTitleByViewModel:viewModel]
                                                font:self.innerTitleFont
                                               width:textWidth];
    NSAttributedString *subAttributedText = [self wrappedAttributedText:viewModel.subTextModel.attributedTitle
                                                             defaultFont:self.innerSubTitleFont];
    CGFloat subTitleHeight = subAttributedText.length
        ? [self innerAttributedTextHeight:subAttributedText
                                    width:textWidth]
        : [self innerTextHeightByText:[self innerSubTitleByViewModel:viewModel]
                                font:self.innerSubTitleFont
                               width:textWidth];
    CGFloat contentHeight = titleHeight;
    if (subTitleHeight > 0) contentHeight += 2 + subTitleHeight;
    return MAX(self.innerRowHeight, ceil(contentHeight + 14));
}

+(CGFloat)sectionDescriptionHorizontalInset{
    return 16;
}

+(CGFloat)sectionDescriptionVerticalInset{
    return 8;
}

+(CGFloat)sectionDescriptionEstimatedHeaderWidth{
    return MAX(200, JobsMainScreen_WIDTH() - 20);
}

+(CGFloat)sectionDescriptionWidthByHeaderWidth:(CGFloat)headerWidth{
    return MAX(120, headerWidth - self.sectionDescriptionHorizontalInset * 2);
}

+(CGFloat)sectionDescriptionHeightByText:(NSString *)text{
    return [self sectionDescriptionHeightByText:text
                                    headerWidth:self.sectionDescriptionEstimatedHeaderWidth];
}

+(CGFloat)sectionDescriptionHeightByText:(NSString *)text
                             headerWidth:(CGFloat)headerWidth{
    NSString *description = text.length ? text.tr : @"";
    if (!description.length) return 0;
    CGSize limitSize = CGSizeMake([self sectionDescriptionWidthByHeaderWidth:headerWidth], CGFLOAT_MAX);
    CGRect textRect = [description boundingRectWithSize:limitSize
                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                             attributes:@{NSFontAttributeName : self.sectionDescriptionFont}
                                                context:nil];
    return ceil(CGRectGetHeight(textRect)) + self.sectionDescriptionVerticalInset * 2;
}

+(CGFloat)collapsedHeight{
    return self.headerHeight + self.verticalInset * 2;
}

+(CGFloat)expandedHeightByItems:(NSArray <UIViewModel *>*)items
              sectionDescription:(NSString *)sectionDescription
                 innerTableWidth:(CGFloat)innerTableWidth{
    CGFloat width = innerTableWidth > 0 ? innerTableWidth : self.sectionDescriptionEstimatedHeaderWidth;
    CGFloat innerContentHeight = [self sectionDescriptionHeightByText:sectionDescription
                                                           headerWidth:width];
    for (UIViewModel *viewModel in items) {
        innerContentHeight += [self innerRowHeightByViewModel:viewModel
                                             innerTableWidth:width];
    };return self.collapsedHeight + self.innerTop + innerContentHeight + self.innerBottom;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.items = @[];
        self.pinAccessoryIndex = NSNotFound;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.byBgColor(JobsClearColor);
        self.contentView.byBgColor(JobsClearColor);
        [self setupSubviews];
        [self updateColors];
        [self setExpanded:NO
                 animated:NO];
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    [self.chargingProgressTimer stop];
    self.chargingProgressTimer = nil;
    self.chargingProgressPhase = 0;
    self.items = @[];
    self.sectionDescription = nil;
    self.selectBlock = nil;
    self.pinBlock = nil;
    self.pinAccessoryIndex = NSNotFound;
    self.pinnedSectionStyle = NO;
    self.chevronView.byHidden(NO);
    self.innerTableView.tableHeaderView = nil;
    [self setExpanded:NO
             animated:NO];
}

-(void)didMoveToWindow{
    [super didMoveToWindow];
    [self syncChargingProgressTimerState];
}

-(void)dealloc{
    [self.chargingProgressTimer stop];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    [self updateColors];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self reloadSectionDescriptionHeaderViewIfNeeded];
}

-(void)setupSubviews{
    self.cardView.byHidden(NO);
    self.headerView.byHidden(NO);
    self.chevronView.byHidden(NO);
    self.titleLab.byHidden(NO);
    self.subTitleLab.byHidden(NO);
    self.detailClipView.byHidden(NO);
    self.innerTableView.byHidden(NO);
}

-(void)updateColors{
    if (@available(iOS 13.0, *)) {
        self.cardView.byBgColor(UIColor.secondarySystemBackgroundColor);
        self.titleLab.byTextCor(UIColor.labelColor);
        self.subTitleLab.byTextCor(UIColor.secondaryLabelColor);
        self.chevronView.byTintColor(UIColor.secondaryLabelColor);
    }else{
        self.cardView.byBgColor(RGBA_COLOR(255, 238, 221, 1));
        self.titleLab.byTextCor(HEXCOLOR(0x3D4A58));
        self.subTitleLab.byTextCor(HEXCOLOR(0x8A93A1));
        self.chevronView.byTintColor(HEXCOLOR(0x8A93A1));
    }
}

-(UIImage *)chevronImage{
    if (@available(iOS 13.0, *)) {
        return [@"chevron.right".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    };return nil;
}

-(NSString *)textByViewModel:(UIViewModel *)viewModel{
    return viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
}

-(NSString *)displayTextByViewModel:(UIViewModel *)viewModel{
    NSString *text = [self textByViewModel:viewModel];
    NSString *className = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    if (![className isEqualToString:@"JobsProgressDemoVC"]) return text;
    NSArray <NSString *>*states = @[@"🟩⬜⬜", @"🟩🟩⬜", @"🟩🟩🟩"];
    return [NSString stringWithFormat:@"%@ %@", states[self.chargingProgressPhase], text];
}

-(BOOL)containsChargingProgressItem{
    for (UIViewModel *viewModel in self.items) {
        if ([NSStringFromClass(viewModel.cls) isEqualToString:@"JobsProgressDemoVC"]) return YES;
    };return NO;
}

-(void)prepareChargingProgressTimerIfNeeded{
    if (!self.containsChargingProgressItem) {
        [self.chargingProgressTimer stop];
        self.chargingProgressTimer = nil;
        return;
    }
    if (self.chargingProgressTimer) {
        [self syncChargingProgressTimerState];
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
                self.chargingProgressPhase = (self.chargingProgressPhase + 1) % 3;
                [self refreshVisibleChargingProgressTitle];
            });
    });
    [self.chargingProgressTimer start];
    [self syncChargingProgressTimerState];
}

-(void)syncChargingProgressTimerState{
    if (!self.chargingProgressTimer) return;
    if (self.window && _expanded && self.containsChargingProgressItem) {
        [self.chargingProgressTimer resume];
    }else{
        [self.chargingProgressTimer pause];
    }
}

-(void)refreshVisibleChargingProgressTitle{
    for (NSIndexPath *indexPath in self.innerTableView.indexPathsForVisibleRows) {
        if (indexPath.row >= self.items.count) continue;
        UIViewModel *viewModel = self.items[indexPath.row];
        if (![NSStringFromClass(viewModel.cls) isEqualToString:@"JobsProgressDemoVC"]) continue;
        [self.innerTableView cellForRowAtIndexPath:indexPath].textLabel.byText([self displayTextByViewModel:viewModel]);
    }
}

-(NSString *)subTextByViewModel:(UIViewModel *)viewModel{
    NSString *subText = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    if (subText.length) return subText;
    return viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
}

-(NSAttributedString *)subAttributedTextByViewModel:(UIViewModel *)viewModel{
    return [JobsOCRootFoldTableCell wrappedAttributedText:viewModel.subTextModel.attributedTitle
                                               defaultFont:JobsOCRootFoldTableCell.innerSubTitleFont];
}

-(UIImage *)pinImage{
    if (@available(iOS 13.0, *)) {
        return [@"pin.fill".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    };return nil;
}

-(UIImage *)unpinImage{
    if (@available(iOS 13.0, *)) {
        return [@"minus.circle.fill".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    };return nil;
}

-(NSDictionary <NSString *, NSString *>*)demoIconSymbolNamesByClassName{
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
            @"JobsScreenshotTipsDemoVC": @"camera.viewfinder",
            @"JobsScreenshotProtectionDemoVC": @"eye.slash",
            @"JobsAnimatedNumberLabelDemoVC": @"textformat.123",
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
            @"JobsAppDoorVC": @"door.left.hand.closed",
            @"JobsAppDoorVC_Style2": @"key",
            @"Douyin_ZFPlayerVC_1": @"play.rectangle",
            @"Douyin_ZFPlayerVC_2": @"play.square.stack",
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
            @"JobsIMShowVC": @"message",
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
                [self logDemoIconIssueOnce:[NSString stringWithFormat:@"Demo 入口 %@ 与 %@ 重复使用系统图标 %@，请改为语义贴合且不重复的图标",
                                            existingClassName,
                                            className,
                                            symbolName]];
            }else{
                classNamesBySymbolName[symbolName] = className;
            }
        }];
    });return symbolNames;
}

-(NSString *)demoIconClassNameByViewModel:(UIViewModel *)viewModel{
    NSString *className = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    if ([className isEqualToString:@"JobsGraphicCaptchaDemoVC"]) {
        className = @"JobsOCGraphicCaptchaDemoVC";
    };return className;
}

-(void)logDemoIconIssueOnce:(NSString *)issue{
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
}

-(NSString *)demoIconSymbolNameByViewModel:(UIViewModel *)viewModel{
    NSString *className = [self demoIconClassNameByViewModel:viewModel];
    NSString *symbolName = [self demoIconSymbolNamesByClassName][className];
    if (!symbolName.length) {
        NSString *entryName = className.length ? className : [self textByViewModel:viewModel];
        [self logDemoIconIssueOnce:[NSString stringWithFormat:@"Demo 入口 %@ 缺少显式系统图标映射，已使用 %@ 兜底",
                                    entryName,
                                    JobsOCDemoIconFallbackSymbolName]];
        return JobsOCDemoIconFallbackSymbolName;
    };return symbolName;
}

-(UIImage *)demoIconImageByViewModel:(UIViewModel *)viewModel{
    if (viewModel.image) {
        return [viewModel.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    NSString *symbolName = [self demoIconSymbolNameByViewModel:viewModel];
    UIImage *image = symbolName.sys_img;
    if (!image) {
        NSString *entryName = [self demoIconClassNameByViewModel:viewModel];
        [self logDemoIconIssueOnce:[NSString stringWithFormat:@"Demo 入口 %@ 配置了无效系统图标 %@，已使用 %@ 兜底",
                                    entryName.length ? entryName : [self textByViewModel:viewModel],
                                    symbolName,
                                    JobsOCDemoIconFallbackSymbolName]];
        image = JobsOCDemoIconFallbackSymbolName.sys_img;
    };return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(UIImage *)redAccessoryImageByImage:(UIImage *)image
                           tintColor:(UIColor *)tintColor{
    if (@available(iOS 13.0, *)) {
        return [image imageWithTintColor:tintColor
                           renderingMode:UIImageRenderingModeAlwaysOriginal];
    };return image;
}

-(NSString *)subTitleTextByExpanded:(BOOL)expanded{
    NSString *stateText = self.pinnedSectionStyle ? @"已置顶".tr : (expanded ? @"已展开".tr : @"点击展开".tr);
    return [NSString stringWithFormat:@"%lu 个 Demo · %@",
            (unsigned long)self.items.count,
            stateText];
}

-(UIButton *)pinAccessoryButtonByIndex:(NSInteger)index{
    UIColor *tintColor = JobsRedColor;
    UIImage *accessoryImage = [self redAccessoryImageByImage:self.pinnedSectionStyle ? self.unpinImage : self.pinImage
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
                self.pinAccessoryIndex = NSNotFound;
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
}

-(void)handleInnerCellLongPress:(UILongPressGestureRecognizer *)gesture{
    if (gesture.state != UIGestureRecognizerStateBegan) return;
    CGPoint point = [gesture locationInView:self.innerTableView];
    NSIndexPath *indexPath = [self.innerTableView indexPathForRowAtPoint:point];
    if (!indexPath ||
        indexPath.row < 0 ||
        indexPath.row >= (NSInteger)self.items.count) return;
    self.pinAccessoryIndex = indexPath.row;
    NSObject.feedbackGenerator(nil);
    [self.innerTableView reloadData];
}

-(CGFloat)sectionDescriptionHeaderWidth{
    CGFloat headerWidth = CGRectGetWidth(self.innerTableView.bounds);
    if (headerWidth <= 0) headerWidth = CGRectGetWidth(self.detailClipView.bounds);
    if (headerWidth <= 0) headerWidth = JobsOCRootFoldTableCell.sectionDescriptionEstimatedHeaderWidth;
    return headerWidth;
}

-(CGFloat)sectionDescriptionHeaderHeight{
    return [JobsOCRootFoldTableCell sectionDescriptionHeightByText:self.sectionDescription
                                                       headerWidth:self.sectionDescriptionHeaderWidth];
}

-(CGFloat)innerTableWidth{
    CGFloat innerTableWidth = CGRectGetWidth(self.innerTableView.bounds);
    if (innerTableWidth <= 0) innerTableWidth = CGRectGetWidth(self.detailClipView.bounds);
    if (innerTableWidth <= 0) innerTableWidth = CGRectGetWidth(self.contentView.bounds) - 20;
    return innerTableWidth > 0 ? innerTableWidth : JobsOCRootFoldTableCell.sectionDescriptionEstimatedHeaderWidth;
}

-(CGFloat)innerTableContentHeight{
    CGFloat contentHeight = self.sectionDescriptionHeaderHeight;
    CGFloat innerTableWidth = self.innerTableWidth;
    for (UIViewModel *viewModel in self.items) {
        contentHeight += [JobsOCRootFoldTableCell innerRowHeightByViewModel:viewModel
                                                            innerTableWidth:innerTableWidth];
    };return contentHeight;
}

-(void)reloadSectionDescriptionHeaderViewIfNeeded{
    if (!_innerTableView) return;
    UIView *headerView = self.innerTableView.tableHeaderView;
    CGFloat headerWidth = self.sectionDescriptionHeaderWidth;
    CGFloat headerHeight = self.sectionDescriptionHeaderHeight;
    if (headerHeight <= 0) {
        if (headerView) self.innerTableView.tableHeaderView = nil;
    }else if (!headerView ||
              ABS(CGRectGetWidth(headerView.bounds) - headerWidth) > 0.5 ||
              ABS(CGRectGetHeight(headerView.bounds) - headerHeight) > 0.5){
        self.innerTableView.tableHeaderView = [self sectionDescriptionHeaderViewByText:self.sectionDescription];
    }
    if (_expanded) [_innerTableHeightConstraint setOffset:self.innerTableContentHeight];
}

-(UIView *)sectionDescriptionHeaderViewByText:(NSString *)text{
    CGFloat headerWidth = self.sectionDescriptionHeaderWidth;
    CGFloat headerHeight = [JobsOCRootFoldTableCell sectionDescriptionHeightByText:text
                                                                       headerWidth:headerWidth];
    if (headerHeight <= 0) return nil;
    UIView *headerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(CGRectMake(0, 0, headerWidth, headerHeight))
            .byBgColor(JobsClearColor);
    });
    CGFloat labelWidth = [JobsOCRootFoldTableCell sectionDescriptionWidthByHeaderWidth:headerWidth];
    jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(text.tr)
            .byTextCor(HEXCOLOR(0x5F6B7A))
            .byFont(JobsOCRootFoldTableCell.sectionDescriptionFont)
            .byNumberOfLines(0)
            .byLineBreakMode(NSLineBreakByWordWrapping)
            .byFrame(CGRectMake(JobsOCRootFoldTableCell.sectionDescriptionHorizontalInset,
                                JobsOCRootFoldTableCell.sectionDescriptionVerticalInset,
                                labelWidth,
                                headerHeight - JobsOCRootFoldTableCell.sectionDescriptionVerticalInset * 2))
            .byClipsToBounds(YES)
            .addOn(headerView);
        if (@available(iOS 13.0, *)) label.byTextCor(UIColor.secondaryLabelColor);
    });
    return headerView;
}

-(void)configureWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                        expanded:(BOOL)expanded
                     selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                         pinBlock:(jobsByNSIntegerBlock _Nullable)pinBlock{
    self.pinnedSectionStyle = NO;
    self.items = sectionModel.dataMutArr.copy ?: @[];
    self.sectionDescription = sectionModel.sectionDescription;
    self.selectBlock = selectBlock;
    self.pinBlock = pinBlock;
    self.pinAccessoryIndex = NSNotFound;
    self.titleLab.byText([NSString stringWithFormat:@"%@  (%lu)",
                          sectionModel.title,
                          (unsigned long)self.items.count]);
    self.chevronView.byImage(self.chevronImage);
    self.chevronView.byHidden(NO);
    self.innerTableView.tableHeaderView = [self sectionDescriptionHeaderViewByText:self.sectionDescription];
    [self.innerTableView reloadData];
    [self setExpanded:expanded
             animated:NO];
    [self prepareChargingProgressTimerIfNeeded];
}

-(void)configurePinnedWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                           selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                            unpinBlock:(jobsByNSIntegerBlock _Nullable)unpinBlock{
    self.pinnedSectionStyle = YES;
    self.items = sectionModel.dataMutArr.copy ?: @[];
    self.sectionDescription = nil;
    self.selectBlock = selectBlock;
    self.pinBlock = unpinBlock;
    self.pinAccessoryIndex = NSNotFound;
    self.titleLab.byText([NSString stringWithFormat:@"%@  (%lu)",
                          sectionModel.title,
                          (unsigned long)self.items.count]);
    self.chevronView.byImage(nil);
    self.chevronView.byHidden(YES);
    self.innerTableView.tableHeaderView = nil;
    [self.innerTableView reloadData];
    [self setExpanded:YES
             animated:NO];
    [self prepareChargingProgressTimerIfNeeded];
}

-(void)setExpanded:(BOOL)expanded
          animated:(BOOL)animated{
    if (self.pinnedSectionStyle) expanded = YES;
    _expanded = expanded;
    self.subTitleLab.byText([self subTitleTextByExpanded:expanded]);
    CGFloat targetHeight = expanded ? self.innerTableContentHeight : 0;
    [_innerTableHeightConstraint setOffset:targetHeight];
    if (expanded) self.detailClipView.byHidden(NO);
    void (^changes)(void) = ^{
        self.detailClipView.byAlpha(expanded ? 1 : 0);
        self.chevronView.transform = expanded ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
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
    [self syncChargingProgressTimerState];
}

#pragma mark —— UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < 0 || indexPath.row >= (NSInteger)self.items.count) return JobsOCRootFoldTableCell.innerRowHeight;
    return [JobsOCRootFoldTableCell innerRowHeightByViewModel:self.items[indexPath.row]
                                              innerTableWidth:CGRectGetWidth(tableView.bounds)];
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCRootFoldInnerCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:JobsOCRootFoldInnerCellReuseIdentifier];
    }
    UIViewModel *viewModel = self.items[indexPath.row];
    NSAttributedString *subAttributedText = [self subAttributedTextByViewModel:viewModel];
    cell.textLabel
        .byText([self displayTextByViewModel:viewModel])
        .byFont(JobsOCRootFoldTableCell.innerTitleFont)
        .byNumberOfLines(0)
        .byLineBreakMode(NSLineBreakByWordWrapping);
    cell.detailTextLabel
        .byFont(JobsOCRootFoldTableCell.innerSubTitleFont)
        .byNumberOfLines(0)
        .byLineBreakMode(NSLineBreakByWordWrapping);
    cell.accessoryView = nil;
    cell.imageView
        .byImage([self demoIconImageByViewModel:viewModel])
        .byHighlightedImage(nil)
        .byContentMode(UIViewContentModeScaleAspectFit);
    if (@available(iOS 13.0, *)) {
        cell.imageView.byTintColor(UIColor.secondaryLabelColor);
    }else{
        cell.imageView.byTintColor(HEXCOLOR(0x5F6B7A));
    }
    if (subAttributedText.length) {
        cell.detailTextLabel.byText(nil);
        cell.detailTextLabel.attributedText = subAttributedText;
    }else{
        cell.detailTextLabel.attributedText = nil;
        cell.detailTextLabel.byText([self subTextByViewModel:viewModel]);
    }
    if (self.pinAccessoryIndex == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryView = [self pinAccessoryButtonByIndex:indexPath.row];
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    BOOL isLastItem = indexPath.row == self.items.count - 1;
    cell.bySeparatorInset(isLastItem
        ? UIEdgeInsetsMake(0, 16, 0, CGRectGetWidth(tableView.bounds))
        : UIEdgeInsetsMake(0, 16, 0, 16));
    cell.byBgColor(JobsClearColor);
    cell.contentView.byBgColor(JobsClearColor);
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
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
                    make.top.equalTo(self.contentView).offset(JobsOCRootFoldTableCell.verticalInset);
                    make.bottom.equalTo(self.contentView).offset(-JobsOCRootFoldTableCell.verticalInset);
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
                    make.height.mas_equalTo(JobsOCRootFoldTableCell.headerHeight).priority(999);
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
                    make.top.equalTo(self.headerView).offset(JobsOCRootFoldTableCell.headerTitleTop);
                    make.height.mas_equalTo(JobsOCRootFoldTableCell.titleHeight);
                });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byFont(JobsOCRootFoldTableCell.subTitleFont)
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .byAdjustsFontSizeToFitWidth(NO)
                .byMinimumScaleFactor(1)
                .addOn(self.headerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.titleLab);
                    make.right.lessThanOrEqualTo(self.chevronView.mas_left).offset(-10);
                    make.top.equalTo(self.headerView).offset(JobsOCRootFoldTableCell.headerSubTitleTop);
                    make.height.mas_equalTo(JobsOCRootFoldTableCell.subTitleHeight);
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
        _innerCellLongPressGesture.minimumPressDuration = 0.45;
        _innerCellLongPressGesture.cancelsTouchesInView = NO;
    };return _innerCellLongPressGesture;
}

-(UITableView *)innerTableView{
    if (!_innerTableView) {
        _innerTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView.byDataSource(self)
                .byDelegate(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(JobsOCRootFoldTableCell.innerRowHeight)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySeparatorInset(UIEdgeInsetsMake(0, 16, 0, 16))
                .byScrollEnabled(NO)
                .byBounces(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.detailClipView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.detailClipView).offset(JobsOCRootFoldTableCell.innerTop);
                    make.left.right.equalTo(self.detailClipView);
                    _innerTableHeightConstraint = make.height.mas_equalTo(0).priority(999);
                    make.bottom.lessThanOrEqualTo(self.detailClipView).offset(-JobsOCRootFoldTableCell.innerBottom).priority(999);
                });
            [tableView addGestureRecognizer:self.innerCellLongPressGesture];
        });
    };return _innerTableView;
}

@end
