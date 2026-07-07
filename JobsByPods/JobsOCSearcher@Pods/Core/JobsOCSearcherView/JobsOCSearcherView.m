//
//  JobsOCSearcherView.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherView.h"
#import "JobsOCSearcherRecordCell.h"

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
Prop_strong()NSLayoutConstraint *searchButtonLeftConstraint;
Prop_strong()NSLayoutConstraint *searchButtonWidthConstraint;
Prop_strong()UIView *recommendSectionView;
Prop_strong()UILabel *recommendTitleLabel;
Prop_strong()UIView *recommendTagContainerView;
Prop_strong()NSLayoutConstraint *recommendSectionHeightConstraint;
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
    self.backgroundColor = [UIColor colorWithRed:0.96 green:0.97 blue:0.99 alpha:1];
    [self addSubview:self.searchContainerView];
    [self.searchContainerView addSubview:self.textField];
    [self addSubview:self.searchButton];
    [self addSubview:self.recommendSectionView];
    [self.recommendSectionView addSubview:self.recommendTitleLabel];
    [self.recommendSectionView addSubview:self.recommendTagContainerView];
    [self addSubview:self.tableView];
    [self addGestureRecognizer:self.blankTapGestureRecognizer];
    [self setupConstraints];
    [self reloadHistorySearches];
    [self updateByConfig];
}

-(void)setupConstraints{
    self.recommendSectionHeightConstraint = [self.recommendSectionView.heightAnchor constraintEqualToConstant:0];
    self.searchButtonLeftConstraint = [self.searchButton.leftAnchor constraintEqualToAnchor:self.searchContainerView.rightAnchor constant:0];
    self.searchButtonWidthConstraint = [self.searchButton.widthAnchor constraintEqualToConstant:0];
    [NSLayoutConstraint activateConstraints:@[
        [self.searchContainerView.topAnchor constraintEqualToAnchor:self.topAnchor constant:12],
        [self.searchContainerView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:16],
        [self.searchContainerView.heightAnchor constraintEqualToConstant:42],
        self.searchButtonLeftConstraint,
        [self.searchButton.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16],
        [self.searchButton.centerYAnchor constraintEqualToAnchor:self.searchContainerView.centerYAnchor],
        [self.searchButton.heightAnchor constraintEqualToConstant:42],
        self.searchButtonWidthConstraint,
        [self.textField.topAnchor constraintEqualToAnchor:self.searchContainerView.topAnchor],
        [self.textField.leftAnchor constraintEqualToAnchor:self.searchContainerView.leftAnchor constant:12],
        [self.textField.rightAnchor constraintEqualToAnchor:self.searchContainerView.rightAnchor constant:-12],
        [self.textField.bottomAnchor constraintEqualToAnchor:self.searchContainerView.bottomAnchor],
        [self.recommendSectionView.topAnchor constraintEqualToAnchor:self.searchContainerView.bottomAnchor constant:12],
        [self.recommendSectionView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
        [self.recommendSectionView.rightAnchor constraintEqualToAnchor:self.rightAnchor],
        self.recommendSectionHeightConstraint,
        [self.tableView.topAnchor constraintEqualToAnchor:self.recommendSectionView.bottomAnchor],
        [self.tableView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
        [self.tableView.rightAnchor constraintEqualToAnchor:self.rightAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
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
    self.textField.placeholder = self.config.placeholder.length ? self.config.placeholder : @"请输入搜索内容";
    [self.searchButton setTitle:self.config.searchButtonTitle.length ? self.config.searchButtonTitle : @"搜索"
                       forState:UIControlStateNormal];
    [self updateSearchButtonVisible:self.textField.isFirstResponder];
    [self updateSearchButtonEnabledByText:self.textField.text];
    self.recommendTitleLabel.text = self.config.recommendTitle.length ? self.config.recommendTitle : @"🔍搜索推荐";
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
    for (UIButton *button in self.recommendButtonArr) {
        [button removeFromSuperview];
    }
    NSMutableArray <UIButton *>*buttonMutArr = NSMutableArray.array;
    [self.recommendSearches enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
        UIButton *button = UIButton.new;
        button.tag = idx;
        button.backgroundColor = [self recommendTagColorAtIndex:idx];
        button.layer.cornerRadius = 6;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        button.titleLabel.minimumScaleFactor = 0.72;
        button.titleLabel.lineBreakMode = NSLineBreakByClipping;
        [button setTitle:obj
                forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor
                     forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(recommendTagButtonEvent:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.recommendTagContainerView addSubview:button];
        [buttonMutArr addObject:button];
    }];
    self.recommendButtonArr = buttonMutArr.copy;
}

-(void)layoutRecommendSection{
    BOOL hasRecommend = self.recommendSearches.count > 0;
    self.recommendSectionView.hidden = !hasRecommend;
    self.recommendTitleLabel.hidden = !hasRecommend;
    self.recommendTagContainerView.hidden = !hasRecommend;
    if (!hasRecommend) {
        self.recommendSectionHeightConstraint.constant = 0;
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
    if (fabs(self.recommendSectionHeightConstraint.constant - targetHeight) > 0.5) {
        self.recommendSectionHeightConstraint.constant = targetHeight;
    }
}

-(UIColor *)recommendTagColorAtIndex:(NSUInteger)index{
    NSArray <UIColor *>*colors = @[
        [UIColor colorWithRed:0.18 green:0.45 blue:0.82 alpha:1],
        [UIColor colorWithRed:0.11 green:0.58 blue:0.36 alpha:1],
        [UIColor colorWithRed:0.84 green:0.25 blue:0.25 alpha:1],
        [UIColor colorWithRed:0.53 green:0.31 blue:0.78 alpha:1],
        [UIColor colorWithRed:0.90 green:0.50 blue:0.13 alpha:1],
        [UIColor colorWithRed:0.00 green:0.52 blue:0.57 alpha:1],
        [UIColor colorWithRed:0.23 green:0.30 blue:0.38 alpha:1],
        [UIColor colorWithRed:0.65 green:0.24 blue:0.49 alpha:1]
    ];
    return colors[index % colors.count];
}

-(UIImage *)trashIconImageWithColor:(UIColor *)color{
    CGSize size = CGSizeMake(16, 16);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath *lidPath = UIBezierPath.bezierPath;
    lidPath.lineWidth = 1.4;
    [color setStroke];
    [lidPath moveToPoint:CGPointMake(4, 4.8)];
    [lidPath addLineToPoint:CGPointMake(12, 4.8)];
    [lidPath moveToPoint:CGPointMake(6.2, 3.2)];
    [lidPath addLineToPoint:CGPointMake(9.8, 3.2)];
    [lidPath stroke];
    UIBezierPath *bodyPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(5, 6, 6, 7.8)
                                                         cornerRadius:1.1];
    bodyPath.lineWidth = 1.4;
    [bodyPath stroke];
    UIBezierPath *linePath = UIBezierPath.bezierPath;
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
    self.searchButton.hidden = !visible;
    self.searchButtonLeftConstraint.constant = visible ? 8 : 0;
    self.searchButtonWidthConstraint.constant = visible ? 64 : 0;
    self.searchButton.userInteractionEnabled = visible && self.searchButton.enabled;
    [self setNeedsLayout];
}

-(void)updateSearchButtonEnabledByText:(NSString *)text{
    BOOL enabled = [self normalizedTextBy:text].length > 0;
    self.searchButton.enabled = enabled;
    self.searchButton.userInteractionEnabled = enabled && !self.searchButton.hidden;
    self.searchButton.alpha = 1;
}

-(void)performSearchByText:(NSString *)text{
    NSString *searchText = [self normalizedTextBy:text];
    [self updateSearchButtonEnabledByText:searchText];
    if (!searchText.length) return;
    self.textField.text = searchText;
    [self saveHistoryByText:searchText];
    if (self.config.searchConfirmBlock) self.config.searchConfirmBlock(searchText);
    [self.textField resignFirstResponder];
    [self updateSearchButtonVisible:NO];
}

-(void)cancelSearchEditing{
    self.textField.text = @"";
    [self updateSearchButtonEnabledByText:@""];
    if (self.config.dismissKeyboardWhenCancel) [self.textField resignFirstResponder];
    [self updateSearchButtonVisible:NO];
    if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(@"");
    if (self.config.cancelBlock) self.config.cancelBlock();
}

-(void)selectSearchText:(NSString *)text{
    NSString *searchText = [self normalizedTextBy:text];
    if (!searchText.length) return;
    self.textField.text = searchText;
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
    if (![self tableView:tableView numberOfRowsInSection:section]) return nil;
    UIView *header = UIView.new;
    header.backgroundColor = self.backgroundColor;
    UILabel *label = UILabel.new;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    label.textColor = [UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1];
    label.text = self.config.historyTitle.length ? self.config.historyTitle : @"⏰搜索历史";
    [header addSubview:label];
    [NSLayoutConstraint activateConstraints:@[
        [label.leftAnchor constraintEqualToAnchor:header.leftAnchor constant:16],
        [label.rightAnchor constraintEqualToAnchor:header.rightAnchor constant:-16],
        [label.bottomAnchor constraintEqualToAnchor:header.bottomAnchor constant:-8]
    ]];
    if (section == JobsOCSearcherSectionHistory) {
        UIColor *buttonColor = [UIColor colorWithRed:0.63 green:0.67 blue:0.73 alpha:1];
        UIButton *clearButton = UIButton.new;
        clearButton.translatesAutoresizingMaskIntoConstraints = NO;
        clearButton.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        clearButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [clearButton setTitle:@"清空"
                     forState:UIControlStateNormal];
        [clearButton setTitleColor:buttonColor
                          forState:UIControlStateNormal];
        [clearButton setImage:[self trashIconImageWithColor:buttonColor]
                     forState:UIControlStateNormal];
        clearButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 4);
        clearButton.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
        [clearButton addTarget:self
                        action:@selector(clearHistory)
              forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:clearButton];
        [NSLayoutConstraint activateConstraints:@[
            [clearButton.rightAnchor constraintEqualToAnchor:header.rightAnchor constant:-16],
            [clearButton.centerYAnchor constraintEqualToAnchor:label.centerYAnchor],
            [clearButton.widthAnchor constraintEqualToConstant:72],
            [clearButton.heightAnchor constraintEqualToConstant:32]
        ]];
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
        _searchContainerView = UIView.new;
        _searchContainerView.translatesAutoresizingMaskIntoConstraints = NO;
        _searchContainerView.backgroundColor = UIColor.whiteColor;
        _searchContainerView.layer.cornerRadius = 12;
        _searchContainerView.layer.borderWidth = 0.5;
        _searchContainerView.layer.borderColor = [UIColor colorWithRed:0.86 green:0.89 blue:0.93 alpha:1].CGColor;
    };return _searchContainerView;
}

-(UITextField *)textField{
    if (!_textField) {
        _textField = UITextField.new;
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.leftView = [self searchIconLeftView];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.returnKeyType = UIReturnKeySearch;
        _textField.delegate = self;
        _textField.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
        _textField.textColor = [UIColor colorWithRed:0.18 green:0.24 blue:0.31 alpha:1];
        [_textField addTarget:self
                       action:@selector(textFieldEditingChanged:)
             forControlEvents:UIControlEventEditingChanged];
    };return _textField;
}

-(UIButton *)searchButton{
    if (!_searchButton) {
        _searchButton = UIButton.new;
        _searchButton.translatesAutoresizingMaskIntoConstraints = NO;
        _searchButton.hidden = YES;
        _searchButton.layer.cornerRadius = 12;
        _searchButton.layer.masksToBounds = YES;
        _searchButton.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 12);
        _searchButton.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
        [_searchButton setTitleColor:UIColor.whiteColor
                             forState:UIControlStateNormal];
        [_searchButton setTitleColor:UIColor.whiteColor
                             forState:UIControlStateHighlighted];
        [_searchButton setTitleColor:[UIColor colorWithRed:0.57 green:0.63 blue:0.72 alpha:1]
                             forState:UIControlStateDisabled];
        [_searchButton setBackgroundImage:[self searchButtonBackgroundImageWithColor:[UIColor colorWithRed:0.19 green:0.45 blue:0.84 alpha:1]]
                                  forState:UIControlStateNormal];
        [_searchButton setBackgroundImage:[self searchButtonBackgroundImageWithColor:[UIColor colorWithRed:0.15 green:0.36 blue:0.70 alpha:1]]
                                  forState:UIControlStateHighlighted];
        [_searchButton setBackgroundImage:[self searchButtonBackgroundImageWithColor:[UIColor colorWithRed:0.91 green:0.94 blue:0.98 alpha:1]]
                                  forState:UIControlStateDisabled];
        [_searchButton addTarget:self
                          action:@selector(searchButtonEvent)
                forControlEvents:UIControlEventTouchUpInside];
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
    UIView *containerView = [UIView.alloc initWithFrame:CGRectMake(0, 0, 34, 42)];
    UIImageView *imageView = [UIImageView.alloc initWithImage:[self searchIconImageWithColor:[UIColor colorWithRed:0.53 green:0.58 blue:0.65 alpha:1]]];
    imageView.frame = CGRectMake(10, 13, 16, 16);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [containerView addSubview:imageView];
    return containerView;
}

-(UIImage *)searchIconImageWithColor:(UIColor *)color{
    CGSize size = CGSizeMake(16, 16);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [color setStroke];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.2, 2.2, 8.8, 8.8)];
    circlePath.lineWidth = 1.6;
    [circlePath stroke];
    UIBezierPath *handlePath = UIBezierPath.bezierPath;
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
        _recommendSectionView = UIView.new;
        _recommendSectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _recommendSectionView.backgroundColor = UIColor.clearColor;
    };return _recommendSectionView;
}

-(UILabel *)recommendTitleLabel{
    if (!_recommendTitleLabel) {
        _recommendTitleLabel = UILabel.new;
        _recommendTitleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
        _recommendTitleLabel.textColor = [UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1];
    };return _recommendTitleLabel;
}

-(UIView *)recommendTagContainerView{
    if (!_recommendTagContainerView) {
        _recommendTagContainerView = UIView.new;
        _recommendTagContainerView.backgroundColor = UIColor.clearColor;
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
        _tableView = [UITableView.alloc initWithFrame:CGRectZero
                                                style:UITableViewStyleGrouped];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.backgroundColor = UIColor.clearColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:JobsOCSearcherRecordCell.class
           forCellReuseIdentifier:JobsOCSearcherRecordCell.reuseIdentifier];
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
        }
    };return _tableView;
}

@end
