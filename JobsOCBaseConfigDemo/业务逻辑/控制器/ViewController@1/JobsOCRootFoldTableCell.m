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
    return JobsWidth(8);
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
    return JobsWidth(11);
}

+(CGFloat)headerTitleGap{
    return JobsWidth(5);
}

+(CGFloat)headerTitleBottom{
    return JobsWidth(10);
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
    return MAX(JobsWidth(64), textHeight);
}

+(CGFloat)innerTop{
    return JobsWidth(10);
}

+(CGFloat)innerBottom{
    return JobsWidth(10);
}

+(CGFloat)innerRowHeight{
    return JobsWidth(50);
}

+(CGFloat)sectionDescriptionHorizontalInset{
    return JobsWidth(16);
}

+(CGFloat)sectionDescriptionVerticalInset{
    return JobsWidth(8);
}

+(CGFloat)sectionDescriptionEstimatedHeaderWidth{
    return MAX(JobsWidth(200), JobsMainScreen_WIDTH() - JobsWidth(104));
}

+(CGFloat)sectionDescriptionWidthByHeaderWidth:(CGFloat)headerWidth{
    return MAX(JobsWidth(120), headerWidth - self.sectionDescriptionHorizontalInset * 2);
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

-(NSString *)demoIconSymbolNameByViewModel:(UIViewModel *)viewModel{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@",
                      [self textByViewModel:viewModel] ?: @"",
                      [self subTextByViewModel:viewModel] ?: @"",
                      viewModel.cls ? NSStringFromClass(viewModel.cls) : @""].lowercaseString;
    if ([text containsString:@"timer"] ||
        [text containsString:@"计时"] ||
        [text containsString:@"时钟"] ||
        [text containsString:@"clock"]) return @"timer";
    if ([text containsString:@"calendar"] ||
        [text containsString:@"日历"]) return @"calendar";
    if ([text containsString:@"network"] ||
        [text containsString:@"请求"] ||
        [text containsString:@"ytk"]) return @"network";
    if ([text containsString:@"photo"] ||
        [text containsString:@"图片"] ||
        [text containsString:@"相册"] ||
        [text containsString:@"camera"] ||
        [text containsString:@"视频"] ||
        [text containsString:@"录制"]) return @"photo";
    if ([text containsString:@"excel"] ||
        [text containsString:@"xlsx"]) return @"tablecells";
    if ([text containsString:@"fmdb"] ||
        [text containsString:@"realm"] ||
        [text containsString:@"数据库"] ||
        [text containsString:@"解码"]) return @"externaldrive";
    if ([text containsString:@"web"] ||
        [text containsString:@"热更新"] ||
        [text containsString:@"patch"]) return @"globe";
    if ([text containsString:@"text"] ||
        [text containsString:@"label"] ||
        [text containsString:@"文本"] ||
        [text containsString:@"富文本"]) return @"textformat";
    if ([text containsString:@"comment"] ||
        [text containsString:@"message"] ||
        [text containsString:@"聊天"] ||
        [text containsString:@"站内信"] ||
        [text containsString:@"im"]) return @"message";
    if ([text containsString:@"search"]) return @"magnifyingglass";
    if ([text containsString:@"setting"]) return @"gearshape";
    if ([text containsString:@"progress"] ||
        [text containsString:@"进度"]) return @"chart.bar";
    if ([text containsString:@"wallet"] ||
        [text containsString:@"card"] ||
        [text containsString:@"钱包"]) return @"creditcard";
    if ([text containsString:@"tabbar"] ||
        [text containsString:@"menu"] ||
        [text containsString:@"category"] ||
        [text containsString:@"导航"] ||
        [text containsString:@"菜单"]) return @"rectangle.3.group";
    if ([text containsString:@"lock"] ||
        [text containsString:@"door"] ||
        [text containsString:@"登录"] ||
        [text containsString:@"手势"]) return @"lock";
    if ([text containsString:@"keyboard"] ||
        [text containsString:@"键盘"]) return @"keyboard";
    if ([text containsString:@"widget"]) return @"apps.iphone";
    if ([text containsString:@"剪切板"]) return @"doc.on.clipboard";
    if ([text containsString:@"动画"] ||
        [text containsString:@"dynamic"] ||
        [text containsString:@"转场"]) return @"sparkles";
    return @"square.grid.2x2";
}

-(UIImage *)demoIconImageByViewModel:(UIViewModel *)viewModel{
    NSString *symbolName = [self demoIconSymbolNameByViewModel:viewModel];
    UIImage *image = symbolName.sys_img;
    if (image) return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return @"小狮子".img;
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
        .byImageEdgeInsets(UIEdgeInsetsMake(JobsWidth(8), JobsWidth(8), JobsWidth(8), JobsWidth(8)))
        .onClickBy(^(UIButton *x) {
            @jobs_strongify(self)
            self.pinAccessoryIndex = NSNotFound;
            if (self.pinBlock) self.pinBlock(x.tag);
        })
        .byTintColor(tintColor)
        .byBgColor(JobsClearColor)
        .bySize(CGSizeMake(JobsWidth(40), JobsWidth(40)));
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
        [self.contentView layoutIfNeeded];
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
            view.byCornerRadius(JobsWidth(14))
                .byClipsToBounds(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(JobsOCRootFoldTableCell.verticalInset);
                    make.bottom.equalTo(self.contentView).offset(-JobsOCRootFoldTableCell.verticalInset);
                    make.left.equalTo(self.contentView).offset(JobsWidth(10));
                    make.right.equalTo(self.contentView).offset(-JobsWidth(10));
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
                    make.height.mas_equalTo(JobsOCRootFoldTableCell.headerHeight);
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
                    make.right.equalTo(self.headerView).offset(-JobsWidth(16));
                    make.centerY.equalTo(self.headerView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(16), JobsWidth(16)));
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
                    make.left.equalTo(self.headerView).offset(JobsWidth(16));
                    make.right.lessThanOrEqualTo(self.chevronView.mas_left).offset(-JobsWidth(10));
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
                    make.right.lessThanOrEqualTo(self.chevronView.mas_left).offset(-JobsWidth(10));
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
                .bySeparatorInset(UIEdgeInsetsMake(0, JobsWidth(16), 0, JobsWidth(16)))
                .byScrollEnabled(NO)
                .byBounces(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.detailClipView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.detailClipView).offset(JobsOCRootFoldTableCell.innerTop);
                    make.left.right.equalTo(self.detailClipView);
                    _innerTableHeightConstraint = make.height.mas_equalTo(0);
                    make.bottom.lessThanOrEqualTo(self.detailClipView).offset(-JobsOCRootFoldTableCell.innerBottom);
                });
            [tableView addGestureRecognizer:self.innerCellLongPressGesture];
        });
    };return _innerTableView;
}

@end
