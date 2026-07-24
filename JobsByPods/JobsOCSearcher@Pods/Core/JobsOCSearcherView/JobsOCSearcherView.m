//
//  JobsOCSearcherView.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherView.h"
#import "JobsOCSearcherRecordCell.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

typedef NS_ENUM(NSUInteger, JobsOCSearcherSection) {
    JobsOCSearcherSectionHistory = 0,
    JobsOCSearcherSectionCount
};

@interface JobsOCSearcherView ()
<
UIGestureRecognizerDelegate
>

Prop_strong()UIView *searchContainerView;
Prop_strong(readwrite)UITextField *textField;
Prop_strong()UIButton *searchButton;
Prop_strong()MASConstraint *searchButtonLeftConstraint;
Prop_strong()MASConstraint *searchButtonWidthConstraint;
Prop_strong()UIView *recommendSectionView;
Prop_strong()UILabel *recommendTitleLabel;
Prop_strong()UIView *recommendTagContainerView;
Prop_strong()MASConstraint *recommendSectionHeightConstraint;
Prop_copy()NSArray <UIButton *>*recommendButtonArr;
Prop_strong()UITableView *tableView;
Prop_strong()UITapGestureRecognizer *blankTapGestureRecognizer;
Prop_strong(readwrite)JobsOCSearcherConfig *config;
Prop_copy(nullable)NSArray <NSString *>*recommendSearches;
Prop_copy(readwrite)NSArray <NSString *>*historySearches;

-(void)reloadRecommendedSearches:(NSArray <NSString *>*_Nullable)recommendSearches;
-(UIImage *)searchButtonBackgroundImageWithColor:(UIColor *)color;

@end

@implementation JobsOCSearcherView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupWithConfig:nil];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self setupWithConfig:nil];
    };return self;
}

-(instancetype)initWithConfig:(JobsOCSearcherConfig *)config{
    if (self = [super initWithFrame:CGRectZero]) {
        [self setupWithConfig:config];
    };return self;
}

-(__kindof JobsOCSearcherView *_Nullable(^)(NSArray <NSString *>*_Nullable recommendSearches))byRecommendSearches{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView *_Nullable(NSArray <NSString *>*_Nullable recommendSearches) {
        @jobs_strongify(self)
        [self reloadRecommendedSearches:recommendSearches];
        return self;
    };
}

-(void)setupWithConfig:(JobsOCSearcherConfig *)config{
    self.config = config ? : JobsOCSearcherConfig.defaultConfig;
    self.byBgColor(RGBA_COLOR(0.96 * 255.0, 0.97 * 255.0, 0.99 * 255.0, 1));
    self.searchContainerView.addOn(self);
    self.textField.addOn(self.searchContainerView);
    self.searchButton.addOn(self);
    self.recommendSectionView.addOn(self);
    self.recommendTitleLabel.addOn(self.recommendSectionView);
    self.recommendTagContainerView.addOn(self.recommendSectionView);
    self.tableView.addOn(self);
    self.byAddGestureRecognizer(self.blankTapGestureRecognizer);
    [self setupConstraints];
    [self reloadHistorySearches];
    [self updateByConfig];
}

-(void)setupConstraints{
    [self.searchContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(12);
        make.left.equalTo(self).offset(16);
        make.height.mas_equalTo(42);
    }];
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        self.searchButtonLeftConstraint = make.left.equalTo(self.searchContainerView.mas_right);
        make.right.equalTo(self).offset(-16);
        make.centerY.equalTo(self.searchContainerView);
        make.height.mas_equalTo(42);
        self.searchButtonWidthConstraint = make.width.mas_equalTo(0);
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.searchContainerView).insets(UIEdgeInsetsMake(0, 12, 0, 12));
    }];
    [self.recommendSectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchContainerView.mas_bottom).offset(12);
        make.left.right.equalTo(self);
        self.recommendSectionHeightConstraint = make.height.mas_equalTo(0);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.recommendSectionView.mas_bottom);
        make.left.right.bottom.equalTo(self);
    }];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self layoutRecommendSection];
}

-(void)reloadWithConfig:(JobsOCSearcherConfig *)config{
    self.config = config ? : JobsOCSearcherConfig.defaultConfig;
    [self updateByConfig];
    [self reloadHistorySearches];
}

-(void)reloadRecommendedSearches:(NSArray <NSString *>*_Nullable)recommendSearches{
    self.recommendSearches = [self normalizedTextsByArray:recommendSearches];
    [self rebuildRecommendTagButtons];
    [self setNeedsLayout];
}

-(void)reloadHistorySearches{
    self.historySearches = [self readHistorySearches];
    [self.tableView reloadData];
    if (self.config.historyChangedBlock) self.config.historyChangedBlock(self.historySearches);
}

-(void)saveHistoryByText:(NSString *)text{
    NSString *historyText = [self normalizedTextBy:text];
    if (!historyText.length) return;
    NSMutableArray <NSString *>*history = [self readHistorySearches].mutableCopy;
    NSIndexSet *sameIndexSet = [history indexesOfObjectsPassingTest:^BOOL(NSString * _Nonnull obj,
                                                                           NSUInteger idx,
                                                                           BOOL * _Nonnull stop) {
        return [obj isEqualToString:historyText];
    }];
    if (sameIndexSet.count) [history removeObjectsAtIndexes:sameIndexSet];
    [history insertObject:historyText
                  atIndex:0];
    NSUInteger maxCount = MAX(self.config.maxHistoryCount, 1);
    while (history.count > maxCount) {
        [history removeLastObject];
    }[self writeHistorySearches:history.copy];
    [self reloadHistorySearches];
}

-(void)deleteHistoryByText:(NSString *)text{
    NSString *historyText = [self normalizedTextBy:text];
    if (!historyText.length) return;
    NSMutableArray <NSString *>*history = [self readHistorySearches].mutableCopy;
    NSIndexSet *sameIndexSet = [history indexesOfObjectsPassingTest:^BOOL(NSString * _Nonnull obj,
                                                                           NSUInteger idx,
                                                                           BOOL * _Nonnull stop) {
        return [obj isEqualToString:historyText];
    }];
    if (!sameIndexSet.count) return;
    [history removeObjectsAtIndexes:sameIndexSet];
    [self writeHistorySearches:history.copy];
    [self reloadHistorySearches];
    if (self.config.historyDeleteBlock) self.config.historyDeleteBlock(historyText);
}

-(void)clearHistory{
    [self writeHistorySearches:nil];
    [self reloadHistorySearches];
    if (self.config.clearHistoryBlock) self.config.clearHistoryBlock();
}

-(void)updateByConfig{
    self.textField.byPlaceholder(self.config.placeholder.length ? self.config.placeholder : @"请输入搜索内容");
    self.searchButton.jobsResetBtnTitle(self.config.searchButtonTitle.length ? self.config.searchButtonTitle : @"搜索");
    [self updateSearchButtonVisible:self.textField.isFirstResponder];
    [self updateSearchButtonEnabledByText:self.textField.text];
    self.recommendTitleLabel.byText(self.config.recommendTitle.length ? self.config.recommendTitle : @"🔍搜索推荐");
    [self rebuildRecommendTagButtons];
    [self setNeedsLayout];
    [self.tableView reloadData];
}

-(NSArray <NSString *>*)readHistorySearches{
    id data = [NSUserDefaults.standardUserDefaults objectForKey:self.config.historyStorageKey];
    if (![data isKindOfClass:NSArray.class]) return @[];
    return [self normalizedTextsByArray:(NSArray *)data];
}

-(void)writeHistorySearches:(NSArray <NSString *>*)historySearches{
    if (historySearches.count) {
        [NSUserDefaults.standardUserDefaults setObject:historySearches
                                                forKey:self.config.historyStorageKey];
    } else {
        [NSUserDefaults.standardUserDefaults removeObjectForKey:self.config.historyStorageKey];
    }[NSUserDefaults.standardUserDefaults synchronize];
}

-(NSArray <NSString *>*)normalizedTextsByArray:(NSArray *)array{
    if (![array isKindOfClass:NSArray.class]) return @[];
    NSMutableArray <NSString *>*result = NSMutableArray.array;
    for (id obj in array) {
        NSString *text = [self normalizedTextBy:obj];
        if (!text.length || [result containsObject:text]) continue;
        [result addObject:text];
    };return result.copy;
}

-(NSString *)normalizedTextBy:(id)data{
    if ([data isKindOfClass:NSString.class]) {
        return [(NSString *)data stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
    }
    if ([data respondsToSelector:@selector(stringValue)]) {
        return [[data stringValue] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
    };return @"";
}

-(void)rebuildRecommendTagButtons{
    @jobs_weakify(self)
    for (UIButton *button in self.recommendButtonArr) {
        button.byRemove();
    }
    NSMutableArray <UIButton *>*buttonMutArr = NSMutableArray.array;
    [self.recommendSearches enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
        UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(obj)
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(13))
                .byTitleLabel(^(__kindof UILabel * _Nullable label) {
                    label
                        .byAdjustsFontSizeToFitWidth(YES)
                        .byMinimumScaleFactor(0.72)
                        .byLineBreakMode(NSLineBreakByClipping);
                })
                .jobsResetBtnBgCor([self recommendTagColorAtIndex:idx])
                .jobsResetBtnCornerRadiusValue(6)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self recommendTagButtonEvent:button];
                })
                .byTag(idx)
                .byClipsToBounds(YES)
                .addOn(self.recommendTagContainerView);
        });
        [buttonMutArr addObject:button];
    }];
    self.recommendButtonArr = buttonMutArr.copy;
}

-(void)layoutRecommendSection{
    BOOL hasRecommend = self.recommendSearches.count > 0;
    self.recommendSectionView.byHidden(!hasRecommend);
    self.recommendTitleLabel.byHidden(!hasRecommend);
    self.recommendTagContainerView.byHidden(!hasRecommend);
    if (!hasRecommend) {
        [self.recommendSectionHeightConstraint setOffset:0];
        return;
    }
    CGFloat sectionWidth = CGRectGetWidth(self.bounds);
    CGFloat contentWidth = MAX(sectionWidth - 32, 0);
    if (contentWidth <= 0) return;
    CGFloat titleHeight = 24;
    CGFloat tagTop = titleHeight + 8;
    CGFloat tagHeight = 32;
    CGFloat horizontalSpace = 8;
    CGFloat verticalSpace = 8;
    CGFloat x = 16;
    CGFloat y = 0;
    self.recommendTitleLabel.frame = CGRectMake(16, 0, contentWidth, titleHeight);
    self.recommendTagContainerView.frame = CGRectMake(0, tagTop, sectionWidth, 0);
    for (UIButton *button in self.recommendButtonArr) {
        NSString *title = [button titleForState:UIControlStateNormal] ? : @"";
        CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        CGFloat tagWidth = MIN(ceil(titleSize.width) + 26, contentWidth);
        if (x > 16 && x + tagWidth > sectionWidth - 16) {
            x = 16;
            y += tagHeight + verticalSpace;
        }
        button.frame = CGRectMake(x, y, tagWidth, tagHeight);
        x += tagWidth + horizontalSpace;
    }
    CGFloat tagsHeight = self.recommendButtonArr.count ? y + tagHeight : 0;
    self.recommendTagContainerView.frame = CGRectMake(0, tagTop, sectionWidth, tagsHeight);
    CGFloat targetHeight = tagTop + tagsHeight + 10;
    [self.recommendSectionHeightConstraint setOffset:targetHeight];
}

-(UIColor *)recommendTagColorAtIndex:(NSUInteger)index{
    NSArray <UIColor *>*colors = @[
        RGBA_COLOR(0.18 * 255.0, 0.45 * 255.0, 0.82 * 255.0, 1),
        RGBA_COLOR(0.11 * 255.0, 0.58 * 255.0, 0.36 * 255.0, 1),
        RGBA_COLOR(0.84 * 255.0, 0.25 * 255.0, 0.25 * 255.0, 1),
        RGBA_COLOR(0.53 * 255.0, 0.31 * 255.0, 0.78 * 255.0, 1),
        RGBA_COLOR(0.90 * 255.0, 0.50 * 255.0, 0.13 * 255.0, 1),
        RGBA_COLOR(0.00 * 255.0, 0.52 * 255.0, 0.57 * 255.0, 1),
        RGBA_COLOR(0.23 * 255.0, 0.30 * 255.0, 0.38 * 255.0, 1),
        RGBA_COLOR(0.65 * 255.0, 0.24 * 255.0, 0.49 * 255.0, 1)
    ];
    return colors[index % colors.count];
}

-(UIImage *)trashIconImageWithColor:(UIColor *)color{
    CGSize size = CGSizeMake(16, 16);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath *lidPath = jobsMakeBezierPath(nil);
    lidPath.lineWidth = 1.4;
    [color setStroke];
    [lidPath moveToPoint:CGPointMake(4, 4.8)];
    [lidPath addLineToPoint:CGPointMake(12, 4.8)];
    [lidPath moveToPoint:CGPointMake(6.2, 3.2)];
    [lidPath addLineToPoint:CGPointMake(9.8, 3.2)];
    [lidPath stroke];
    UIBezierPath *bodyPath = UIBezierPath.byBezierPathWithRoundedRect(CGRectMake(5, 6, 6, 7.8), 1.1);
    bodyPath.lineWidth = 1.4;
    [bodyPath stroke];
    UIBezierPath *linePath = jobsMakeBezierPath(nil);
    linePath.lineWidth = 1;
    [linePath moveToPoint:CGPointMake(7, 7.5)];
    [linePath addLineToPoint:CGPointMake(7, 12)];
    [linePath moveToPoint:CGPointMake(9, 7.5)];
    [linePath addLineToPoint:CGPointMake(9, 12)];
    [linePath stroke];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(NSString *)textByIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == JobsOCSearcherSectionHistory &&
        indexPath.row < (NSInteger)self.historySearches.count) {
        return self.historySearches[indexPath.row];
    };return @"";
}

-(void)updateSearchButtonVisible:(BOOL)visible{
    self.searchButton.byHidden(!visible);
    [self.searchButtonLeftConstraint setOffset:visible ? 8 : 0];
    [self.searchButtonWidthConstraint setOffset:visible ? 64 : 0];
    self.searchButton.byUserInteractionEnabled(visible && self.searchButton.jobs_isEnabled);
    [self setNeedsLayout];
}

-(void)updateSearchButtonEnabledByText:(NSString *)text{
    BOOL enabled = [self normalizedTextBy:text].length > 0;
    self.searchButton
        .byEnabled(enabled)
        .byUserInteractionEnabled(enabled && !self.searchButton.hidden)
        .byAlpha(1);
}

-(void)performSearchByText:(NSString *)text{
    NSString *searchText = [self normalizedTextBy:text];
    [self updateSearchButtonEnabledByText:searchText];
    if (!searchText.length) return;
    self.textField.byText(searchText);
    [self saveHistoryByText:searchText];
    if (self.config.searchConfirmBlock) self.config.searchConfirmBlock(searchText);
    [self.textField resignFirstResponder];
    [self updateSearchButtonVisible:NO];
}

-(void)cancelSearchEditing{
    self.textField.byText(@"");
    [self updateSearchButtonEnabledByText:@""];
    if (self.config.dismissKeyboardWhenCancel) [self.textField resignFirstResponder];
    [self updateSearchButtonVisible:NO];
    if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(@"");
    if (self.config.cancelBlock) self.config.cancelBlock();
}

-(void)selectSearchText:(NSString *)text{
    NSString *searchText = [self normalizedTextBy:text];
    if (!searchText.length) return;
    self.textField.byText(searchText);
    [self.textField becomeFirstResponder];
    [self updateSearchButtonVisible:YES];
    [self updateSearchButtonEnabledByText:searchText];
    if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(searchText);
    if (self.config.itemSelectedBlock) self.config.itemSelectedBlock(searchText);
}

-(void)textFieldEditingChanged:(UITextField *)textField{
    NSString *text = [self normalizedTextBy:textField.text];
    [self updateSearchButtonEnabledByText:text];
    if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(text);
}

-(void)searchButtonEvent{
    [self performSearchByText:self.textField.text];
}

-(void)blankTapGestureEvent{
    if (!self.textField.isFirstResponder) return;
    [self cancelSearchEditing];
}

-(void)recommendTagButtonEvent:(UIButton *)sender{
    NSInteger index = sender.tag;
    if (index < 0 || (NSUInteger)index >= self.recommendSearches.count) return;
    [self selectSearchText:self.recommendSearches[index]];
}
#pragma mark —— UITableViewDelegate / UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return JobsOCSearcherSectionCount;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    if (section == JobsOCSearcherSectionHistory) return self.historySearches.count;
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    if (section == JobsOCSearcherSectionHistory) return self.historySearches.count ? 40 : CGFLOAT_MIN;
    return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    @jobs_weakify(self)
    if (![self tableView:tableView numberOfRowsInSection:section]) return nil;
    UIView *header = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view.byBgColor(self.backgroundColor);
    });
    UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(self.config.historyTitle.length ? self.config.historyTitle : @"⏰搜索历史")
            .byFont(UIFontWeightSemiboldSize(16))
            .byTextCor(RGBA_COLOR(0.12 * 255.0, 0.16 * 255.0, 0.21 * 255.0, 1))
            .addOn(header);
    });
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(header).offset(16);
        make.right.equalTo(header).offset(-16);
        make.bottom.equalTo(header).offset(-8);
    }];
    if (section == JobsOCSearcherSectionHistory) {
        UIColor *buttonColor = RGBA_COLOR(0.63 * 255.0, 0.67 * 255.0, 0.73 * 255.0, 1);
        UIButton *clearButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"清空".tr)
                .jobsResetBtnTitleCor(buttonColor)
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(13))
                .jobsResetBtnImage([self trashIconImageWithColor:buttonColor])
                .byImageEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 4))
                .byTitleEdgeInsets(UIEdgeInsetsMake(0, 4, 0, 0))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self clearHistory];
                })
                .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentRight)
                .addOn(header);
        });
        [clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(header).offset(-16);
            make.centerY.equalTo(label);
            make.size.mas_equalTo(CGSizeMake(72, 32));
        }];
    };return header;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = [self textByIndexPath:indexPath];
    JobsOCSearcherRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCSearcherRecordCell.reuseIdentifier
                                                                   forIndexPath:indexPath];
    [cell updateWithText:text];
    @jobs_weakify(self)
    cell.deleteBlock = ^(__kindof NSString * _Nullable string) {
        @jobs_strongify(self)
        [self deleteHistoryByText:string];
    };
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    [self selectSearchText:[self textByIndexPath:indexPath]];
}
#pragma mark —— UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch{
    if (gestureRecognizer != self.blankTapGestureRecognizer ||
        !self.textField.isFirstResponder) return NO;
    UIView *touchView = touch.view;
    if ([touchView isDescendantOfView:self.searchContainerView] ||
        [touchView isDescendantOfView:self.searchButton]) return NO;
    while (touchView && touchView != self) {
        if ([touchView isKindOfClass:UIControl.class] ||
            [touchView isKindOfClass:UITableViewCell.class]) return NO;
        touchView = touchView.superview;
    };return YES;
}
#pragma mark —— UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self updateSearchButtonVisible:YES];
    [self updateSearchButtonEnabledByText:textField.text];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self updateSearchButtonVisible:NO];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self performSearchByText:textField.text];
    return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    [self updateSearchButtonEnabledByText:@""];
    if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(@"");
    return YES;
}
#pragma mark —— lazyLoad
-(UIView *)searchContainerView{
    if (!_searchContainerView) {
        _searchContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byCornerRadius(12)
                .byLayer(^(CALayer * _Nullable layer) {
                    layer
                        .byBorderWidth(0.5)
                        .byBorderColor(RGBA_COLOR(0.86 * 255.0, 0.89 * 255.0, 0.93 * 255.0, 1).CGColor);
                });
        });
    };return _searchContainerView;
}

-(UITextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        _textField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(RGBA_COLOR(0.18 * 255.0, 0.24 * 255.0, 0.31 * 255.0, 1))
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byLeftView([self searchIconLeftView])
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byReturnKeyType(UIReturnKeySearch)
                .byDelegate(self)
                .onJobsEvent(UIControlEventEditingChanged, ^(__kindof UIControl * _Nullable control) {
                    [weak_self textFieldEditingChanged:(UITextField *)control];
                });
        });
    };return _textField;
}

-(UIButton *)searchButton{
    if (!_searchButton) {
        @jobs_weakify(self)
        _searchButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(14))
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnBgImage([self searchButtonBackgroundImageWithColor:RGBA_COLOR(0.19 * 255.0, 0.45 * 255.0, 0.84 * 255.0, 1)])
                .jobsResetBtnCornerRadiusValue(12)
                .highlightedStateTitleColorBy(UIColor.whiteColor)
                .disabledStateTitleColorBy(RGBA_COLOR(0.57 * 255.0, 0.63 * 255.0, 0.72 * 255.0, 1))
                .highlightedStateBackgroundImageBy([self searchButtonBackgroundImageWithColor:RGBA_COLOR(0.15 * 255.0, 0.36 * 255.0, 0.70 * 255.0, 1)])
                .disabledStateBackgroundImageBy([self searchButtonBackgroundImageWithColor:RGBA_COLOR(0.91 * 255.0, 0.94 * 255.0, 0.98 * 255.0, 1)])
                .byContentEdgeInsets(UIEdgeInsetsMake(0, 12, 0, 12))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self searchButtonEvent];
                })
                .byHidden(YES)
                .byClipsToBounds(YES);
        });
    };return _searchButton;
}

-(UIImage *)searchButtonBackgroundImageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIView *)searchIconLeftView{
    UIView *containerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view.byFrame(CGRectMake(0, 0, 34, 42));
    });
    jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
        imageView
            .byImage([self searchIconImageWithColor:RGBA_COLOR(0.53 * 255.0, 0.58 * 255.0, 0.65 * 255.0, 1)])
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byUserInteractionEnabled(NO)
            .byFrame(CGRectMake(10, 13, 16, 16))
            .addOn(containerView);
    });
    return containerView;
}

-(UIImage *)searchIconImageWithColor:(UIColor *)color{
    CGSize size = CGSizeMake(16, 16);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [color setStroke];
    UIBezierPath *circlePath = UIBezierPath.byBezierPathWithOvalInRect(CGRectMake(2.2, 2.2, 8.8, 8.8));
    circlePath.lineWidth = 1.6;
    [circlePath stroke];
    UIBezierPath *handlePath = jobsMakeBezierPath(nil);
    handlePath.lineWidth = 1.8;
    handlePath.lineCapStyle = kCGLineCapRound;
    [handlePath moveToPoint:CGPointMake(9.4, 9.4)];
    [handlePath addLineToPoint:CGPointMake(13.4, 13.4)];
    [handlePath stroke];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIView *)recommendSectionView{
    if (!_recommendSectionView) {
        _recommendSectionView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(UIColor.clearColor);
        });
    };return _recommendSectionView;
}

-(UILabel *)recommendTitleLabel{
    if (!_recommendTitleLabel) {
        _recommendTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightSemiboldSize(16))
                .byTextCor(RGBA_COLOR(0.12 * 255.0, 0.16 * 255.0, 0.21 * 255.0, 1));
        });
    };return _recommendTitleLabel;
}

-(UIView *)recommendTagContainerView{
    if (!_recommendTagContainerView) {
        _recommendTagContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(UIColor.clearColor);
        });
    };return _recommendTagContainerView;
}

-(UITapGestureRecognizer *)blankTapGestureRecognizer{
    if (!_blankTapGestureRecognizer) {
        _blankTapGestureRecognizer = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                           action:@selector(blankTapGestureEvent)];
        _blankTapGestureRecognizer.cancelsTouchesInView = NO;
        _blankTapGestureRecognizer.delegate = self;
    };return _blankTapGestureRecognizer;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag)
                .byBgColor(UIColor.clearColor);
        });
        [_tableView registerClass:JobsOCSearcherRecordCell.class
           forCellReuseIdentifier:JobsOCSearcherRecordCell.reuseIdentifier];
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
        }
    };return _tableView;
}

@end
