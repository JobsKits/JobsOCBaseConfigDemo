//
//  JobsOCRootFoldTableCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsOCRootFoldTableCell.h"

NSString *const JobsOCRootFoldTableCellReuseIdentifier = @"JobsOCRootFoldTableCell";
static NSString *const JobsOCRootFoldInnerCellReuseIdentifier = @"JobsOCRootFoldInnerCell";

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

-(UIView *)sectionDescriptionHeaderViewByText:(NSString *)text;
-(CGFloat)sectionDescriptionHeaderWidth;
-(CGFloat)sectionDescriptionHeaderHeight;
-(void)reloadSectionDescriptionHeaderViewIfNeeded;

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

+(CGFloat)sectionDescriptionHorizontalInset{
    return 16;
}

+(CGFloat)sectionDescriptionVerticalInset{
    return 8;
}

+(CGFloat)sectionDescriptionEstimatedHeaderWidth{
    return MAX(200, JobsMainScreen_WIDTH() - 104);
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

+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount{
    return [self expandedHeightByItemCount:itemCount
                        sectionDescription:nil];
}

+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount
                  sectionDescription:(NSString *)sectionDescription{
    return self.collapsedHeight + self.innerTop + [self sectionDescriptionHeightByText:sectionDescription] + itemCount * self.innerRowHeight + self.innerBottom;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.items = @[];
        self.pinAccessoryIndex = NSNotFound;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = JobsClearColor;
        self.contentView.backgroundColor = JobsClearColor;
        [self setupSubviews];
        [self updateColors];
        [self setExpanded:NO
                 animated:NO];
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
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
        self.cardView.backgroundColor = UIColor.secondarySystemBackgroundColor;
        self.titleLab.textColor = UIColor.labelColor;
        self.subTitleLab.textColor = UIColor.secondaryLabelColor;
        self.chevronView.byTintColor(UIColor.secondaryLabelColor);
    }else{
        self.cardView.backgroundColor = RGBA_COLOR(255, 238, 221, 1);
        self.titleLab.textColor = HEXCOLOR(0x3D4A58);
        self.subTitleLab.textColor = HEXCOLOR(0x8A93A1);
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

-(NSString *)subTextByViewModel:(UIViewModel *)viewModel{
    NSString *subText = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    if (subText.length) return subText;
    return viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
}

-(NSAttributedString *)subAttributedTextByViewModel:(UIViewModel *)viewModel{
    return viewModel.subTextModel.attributedTitle;
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
            @"JobsTabBarCtrlDemoVC": @"rectangle.bottomthird.inset.filled",
            @"SlideToUnlockDemoVC": @"lock.open",
            @"JobsNavigationDemoVC": @"arrow.triangle.turn.up.right.diamond",
            @"JobsTimerDemoListVC": @"stopwatch",
            @"JobsBluetoothDemoVC": @"antenna.radiowaves.left.and.right",
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
            @"JobsViewPushDemoVC": @"rectangle.portrait.and.arrow.right",
            @"JobsSideDrawerDemoVC": @"rectangle.leadinghalf.inset.filled",
            @"JobsOCKeyboardMgrDemoVC": @"keyboard",
            @"JobsOCGraphicCaptchaDemoVC": @"checkmark.shield",
            @"JobsQRCodeDemoVC": @"qrcode",
            @"JobsCNIDDemoVC": @"person.text.rectangle",
            @"JobsOCSkeletonViewDemoVC": @"wave.3.right",
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
            @"JobsSysProgressDemoVC": @"gauge",
            @"JobsProgressDemoVC": @"chart.line.uptrend.xyaxis",
            @"TestIrregularViewTestVC": @"hexagon",
            @"JobsIMShowVC": @"message",
            @"TestLabelVC": @"character.textbox",
            @"JobsDropDownListVC": @"chevron.down.square",
            @"JobsOCCountryCodeCtrl": @"flag",
            @"YTKNetworkStudyVC": @"network",
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
        NSAssert([NSSet setWithArray:symbolNames.allValues].count == symbolNames.count,
                 @"Demo 入口图标必须保持一项一图，不允许重复");
    });return symbolNames;
}

-(NSString *)demoIconSymbolNameByViewModel:(UIViewModel *)viewModel{
    NSString *className = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    if ([className isEqualToString:@"JobsGraphicCaptchaDemoVC"]) {
        className = @"JobsOCGraphicCaptchaDemoVC";
    }
    NSString *symbolName = [self demoIconSymbolNamesByClassName][className];
    NSAssert(symbolName.length,
             @"Demo 入口 %@ 必须显式配置贴合内容且不重复的图标",
             className.length ? className : [self textByViewModel:viewModel]);
    return symbolName ?: @"questionmark.app";
}

-(UIImage *)demoIconImageByViewModel:(UIViewModel *)viewModel{
    if (viewModel.image) {
        return [viewModel.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    NSString *symbolName = [self demoIconSymbolNameByViewModel:viewModel];
    UIImage *image = symbolName.sys_img;
    NSAssert(image, @"无效的系统图标：%@", symbolName);
    if (image) return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return [@"questionmark.app".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
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
    UIButton *button = UIButton.jobsInit()
        .jobsResetBtnImage(accessoryImage)
            .byImageEdgeInsets(UIEdgeInsetsMake(8, 8, 8, 8))
        .onClickBy(^(UIButton *x) {
            @jobs_strongify(self)
            self.pinAccessoryIndex = NSNotFound;
            if (self.pinBlock) self.pinBlock(x.tag);
        })
        .byTintColor(tintColor)
        .byBgColor(JobsClearColor)
            .bySize(CGSizeMake(40, 40));
    [button setImage:accessoryImage
            forState:UIControlStateNormal];
    [button setImage:accessoryImage
            forState:UIControlStateHighlighted];
    [button setImage:accessoryImage
            forState:UIControlStateSelected];
    if (@available(iOS 16.0, *)) {
        button.jobsResetTitleBaseForegroundColor(tintColor);
        button.jobsResetImageColorTransformer(^UIColor *_Nullable(UIColor *_Nullable color) {
            return tintColor;
        });
        button.jobsResetImage(accessoryImage);
    }
    button.tintColor = tintColor;
    button.imageView.tintColor = tintColor;
    button.adjustsImageWhenHighlighted = NO;
    button.tag = index;
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    return button;
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

-(void)reloadSectionDescriptionHeaderViewIfNeeded{
    if (!self.sectionDescription.length || !_innerTableView) return;
    UIView *headerView = self.innerTableView.tableHeaderView;
    CGFloat headerWidth = self.sectionDescriptionHeaderWidth;
    CGFloat headerHeight = self.sectionDescriptionHeaderHeight;
    if (headerHeight <= 0) {
        self.innerTableView.tableHeaderView = nil;
        return;
    }
    if (headerView &&
        ABS(CGRectGetWidth(headerView.bounds) - headerWidth) <= 0.5 &&
        ABS(CGRectGetHeight(headerView.bounds) - headerHeight) <= 0.5) return;
    self.innerTableView.tableHeaderView = [self sectionDescriptionHeaderViewByText:self.sectionDescription];
    if (_expanded) {
        [_innerTableHeightConstraint setOffset:headerHeight + self.items.count * JobsOCRootFoldTableCell.innerRowHeight];
    }
}

-(UIView *)sectionDescriptionHeaderViewByText:(NSString *)text{
    CGFloat headerWidth = self.sectionDescriptionHeaderWidth;
    CGFloat headerHeight = [JobsOCRootFoldTableCell sectionDescriptionHeightByText:text
                                                                       headerWidth:headerWidth];
    if (headerHeight <= 0) return nil;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, headerWidth, headerHeight)];
    headerView.backgroundColor = JobsClearColor;
    CGFloat labelWidth = [JobsOCRootFoldTableCell sectionDescriptionWidthByHeaderWidth:headerWidth];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(JobsOCRootFoldTableCell.sectionDescriptionHorizontalInset,
                                                               JobsOCRootFoldTableCell.sectionDescriptionVerticalInset,
                                                               labelWidth,
                                                               headerHeight - JobsOCRootFoldTableCell.sectionDescriptionVerticalInset * 2)];
    label.text = text.tr;
    label.font = JobsOCRootFoldTableCell.sectionDescriptionFont;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.clipsToBounds = YES;
    label.textColor = HEXCOLOR(0x5F6B7A);
    if (@available(iOS 13.0, *)) {
        label.textColor = UIColor.secondaryLabelColor;
    }
    [headerView addSubview:label];
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
    self.titleLab.text = [NSString stringWithFormat:@"%@  (%lu)",
                          sectionModel.title,
                          (unsigned long)self.items.count];
    self.chevronView.image = self.chevronImage;
    self.chevronView.byHidden(NO);
    self.innerTableView.tableHeaderView = [self sectionDescriptionHeaderViewByText:self.sectionDescription];
    [self.innerTableView reloadData];
    [self setExpanded:expanded
             animated:NO];
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
    self.titleLab.text = [NSString stringWithFormat:@"%@  (%lu)",
                          sectionModel.title,
                          (unsigned long)self.items.count];
    self.chevronView.image = nil;
    self.chevronView.byHidden(YES);
    self.innerTableView.tableHeaderView = nil;
    [self.innerTableView reloadData];
    [self setExpanded:YES
             animated:NO];
}

-(void)setExpanded:(BOOL)expanded
          animated:(BOOL)animated{
    if (self.pinnedSectionStyle) expanded = YES;
    _expanded = expanded;
    self.subTitleLab.text = [self subTitleTextByExpanded:expanded];
    CGFloat targetHeight = expanded ? self.sectionDescriptionHeaderHeight + self.items.count * JobsOCRootFoldTableCell.innerRowHeight : 0;
    [_innerTableHeightConstraint setOffset:targetHeight];
    if (expanded) self.detailClipView.hidden = NO;
    void (^changes)(void) = ^{
        self.detailClipView.alpha = expanded ? 1 : 0;
        self.chevronView.transform = expanded ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
        if (self.window) [self.contentView layoutIfNeeded];
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (!expanded) self.detailClipView.hidden = YES;
    };
    if (animated) {
        [UIView animateWithDuration:0.28
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                         animations:changes
                         completion:completion];
    }else{
        changes();
        completion(YES);
    }
}

#pragma mark —— UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsOCRootFoldTableCell.innerRowHeight;
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
    cell.textLabel.text = [self textByViewModel:viewModel];
    cell.textLabel.font = UIFontWeightRegularSize(15);
    cell.detailTextLabel.font = UIFontWeightRegularSize(11);
    cell.accessoryView = nil;
    cell.imageView.image = [self demoIconImageByViewModel:viewModel];
    cell.imageView.highlightedImage = nil;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (@available(iOS 13.0, *)) {
        cell.imageView.tintColor = UIColor.secondaryLabelColor;
    }else{
        cell.imageView.tintColor = HEXCOLOR(0x5F6B7A);
    }
    if (subAttributedText.length) {
        cell.detailTextLabel.text = nil;
        cell.detailTextLabel.attributedText = subAttributedText;
    }else{
        cell.detailTextLabel.attributedText = nil;
        cell.detailTextLabel.text = [self subTextByViewModel:viewModel];
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
    cell.backgroundColor = JobsClearColor;
    cell.contentView.backgroundColor = JobsClearColor;
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
                .byRowHeight(JobsOCRootFoldTableCell.innerRowHeight)
                .byEstimatedRowHeight(0)
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
