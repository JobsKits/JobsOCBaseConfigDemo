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
Prop_strong()NSArray <UIViewModel *>*items;
Prop_copy()jobsByNSIntegerBlock selectBlock;

@end

@implementation JobsOCRootFoldTableCell{
    MASConstraint *_innerTableHeightConstraint;
    BOOL _expanded;
}

+(CGFloat)verticalInset{
    return JobsWidth(8);
}

+(CGFloat)headerHeight{
    return JobsWidth(56);
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

+(CGFloat)collapsedHeight{
    return self.headerHeight + self.verticalInset * 2;
}

+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount{
    return self.collapsedHeight + self.innerTop + itemCount * self.innerRowHeight + self.innerBottom;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.items = @[];
        self
            .bySelectionStyle(UITableViewCellSelectionStyleNone)
            .byBgColor(JobsClearColor);
        self.contentView.byBgColor(JobsClearColor);
        [self setupSubviews];
        [self updateColors];
        [self setExpanded:NO
                 animated:NO];
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.items = @[];
    self.selectBlock = nil;
    [self setExpanded:NO
             animated:NO];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    [self updateColors];
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
        return [[UIImage systemImageNamed:@"chevron.right"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
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

-(void)configureWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                        expanded:(BOOL)expanded
                     selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock{
    self.items = sectionModel.dataMutArr.copy ?: @[];
    self.selectBlock = selectBlock;
    self.titleLab.text = [NSString stringWithFormat:@"%@  (%lu)",
                          sectionModel.title,
                          (unsigned long)self.items.count];
    self.subTitleLab.text = [NSString stringWithFormat:@"%lu 个 Demo · %@",
                             (unsigned long)self.items.count,
                             expanded ? @"已展开".tr : @"点击展开".tr];
    self.chevronView.image = self.chevronImage;
    [self.innerTableView reloadData];
    [self setExpanded:expanded
             animated:NO];
}

-(void)setExpanded:(BOOL)expanded
          animated:(BOOL)animated{
    _expanded = expanded;
    self.subTitleLab.text = [NSString stringWithFormat:@"%lu 个 Demo · %@",
                             (unsigned long)self.items.count,
                             expanded ? @"已展开".tr : @"点击展开".tr];
    CGFloat targetHeight = expanded ? self.items.count * JobsOCRootFoldTableCell.innerRowHeight : 0;
    [_innerTableHeightConstraint setOffset:targetHeight];
    if (expanded) self.detailClipView.byHidden(NO);
    void (^changes)(void) = ^{
        self.detailClipView.byAlpha(expanded ? 1 : 0);
        self.chevronView.transform = expanded ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
        [self.contentView layoutIfNeeded];
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (!expanded) self.detailClipView.byHidden(YES);
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
    cell.textLabel.text = [self textByViewModel:viewModel];
    cell.textLabel.byFont(UIFontWeightRegularSize(15));
    cell.detailTextLabel.text = [self subTextByViewModel:viewModel];
    cell.detailTextLabel.byFont(UIFontWeightRegularSize(11));
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell
        .bySelectionStyle(UITableViewCellSelectionStyleDefault)
        .byBgColor(JobsClearColor);
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
            label.byFont(UIFontWeightMediumSize(16))
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(YES)
                .addOn(self.headerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.headerView).offset(JobsWidth(16));
                    make.right.lessThanOrEqualTo(self.chevronView.mas_left).offset(-JobsWidth(10));
                    make.top.equalTo(self.headerView).offset(JobsWidth(10));
                });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byFont(UIFontWeightRegularSize(12))
                .byNumberOfLines(1)
                .addOn(self.headerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.titleLab);
                    make.right.lessThanOrEqualTo(self.chevronView.mas_left).offset(-JobsWidth(10));
                    make.bottom.equalTo(self.headerView).offset(-JobsWidth(9));
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
        });
    };return _innerTableView;
}

@end
