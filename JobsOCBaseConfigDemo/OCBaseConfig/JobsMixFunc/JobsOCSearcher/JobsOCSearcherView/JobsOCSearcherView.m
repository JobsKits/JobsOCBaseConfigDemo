//
//  JobsOCSearcherView.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherView.h"
#import "UIGestureRecognizer+DSL.h"

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

-(jobsByNSArrayNSStringBlock _Nonnull)reloadRecommendedSearches;
-(JobsRetImageByCorBlock _Nonnull)searchButtonBackgroundImageWithColor;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSearcherView
@interface JobsOCSearcherView (JobsPropertyDSLSetterAutogen_effdfbc765)
-(void)setHistorySearches:(NSArray <NSString *>* _Nullable)data;
-(void)setRecommendButtonArr:(NSArray <UIButton *>* _Nullable)data;
-(void)setRecommendSectionHeightConstraint:(MASConstraint * _Nullable)data;
-(void)setSearchButtonLeftConstraint:(MASConstraint * _Nullable)data;
-(void)setSearchButtonWidthConstraint:(MASConstraint * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSearcherView

@implementation JobsOCSearcherView
-(JobsRetJobsOCSearcherViewByConfigBlock _Nonnull)byConfig{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView *_Nullable(JobsOCSearcherConfig *_Nullable config){
        @jobs_strongify(self)
        [self setConfig:config];
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.setupWithConfig(nil);
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.setupWithConfig(nil);
    };return self;
}

-(instancetype)initWithConfig:(JobsOCSearcherConfig *)config{
    if (self = [super initWithFrame:CGRectZero]) {
        self.setupWithConfig(config);
    };return self;
}

-(JobsRetJobsOCSearcherViewByNSArrayNSStringBlock _Nonnull)byRecommendSearches{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView *_Nullable(NSArray <NSString *>*_Nullable recommendSearches) {
        @jobs_strongify(self)
        [self setRecommendSearches:recommendSearches];
        return self;
    };
}

-(jobsByJobsOCSearcherConfigBlock _Nonnull)setupWithConfig{
    @jobs_weakify(self)
    return ^(JobsOCSearcherConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        self.byConfig(config ? : JobsOCSearcherConfig.defaultConfig());
        self.byBgColor([UIColor colorWithRed:0.96 green:0.97 blue:0.99 alpha:1]);
        [self addSubview:self.searchContainerView];
        [self.searchContainerView addSubview:self.textField];
        [self addSubview:self.searchButton];
        [self addSubview:self.recommendSectionView];
        [self.recommendSectionView addSubview:self.recommendTitleLabel];
        [self.recommendSectionView addSubview:self.recommendTagContainerView];
        [self addSubview:self.tableView];
        [self addGestureRecognizer:self.blankTapGestureRecognizer];
        self.setupConstraints();
        self.reloadHistorySearches();
        self.updateByConfig();
    };
}

-(jobsByVoidBlock _Nonnull)setupConstraints{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.searchContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(12);
            make.left.equalTo(self).offset(16);
            make.height.mas_equalTo(42);
        }];
        [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
            self.bySearchButtonLeftConstraint(make.left.equalTo(self.searchContainerView.mas_right));
            make.right.equalTo(self).offset(-16);
            make.centerY.equalTo(self.searchContainerView);
            make.height.mas_equalTo(42);
            self.bySearchButtonWidthConstraint(make.width.mas_equalTo(0));
        }];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.searchContainerView).insets(UIEdgeInsetsMake(0, 12, 0, 12));
        }];
        [self.recommendSectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.searchContainerView.mas_bottom).offset(12);
            make.left.right.equalTo(self);
            self.byRecommendSectionHeightConstraint(make.height.mas_equalTo(0));
        }];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.recommendSectionView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.layoutRecommendSection();
    };
}

-(jobsByJobsOCSearcherConfigBlock _Nonnull)reloadWithConfig{
    @jobs_weakify(self)
    return ^(JobsOCSearcherConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        self.byConfig(config ? : JobsOCSearcherConfig.defaultConfig());
        self.updateByConfig();
        self.reloadHistorySearches();
    };
}

-(jobsByNSArrayNSStringBlock _Nonnull)reloadRecommendedSearches{
    @jobs_weakify(self)
    return ^(NSArray <NSString *>*_Nullable recommendSearches){
        @jobs_strongify(self)
        if (!self) return;
        self.byRecommendSearches(self.normalizedTextsByArray(recommendSearches));
        self.rebuildRecommendTagButtons();
        [self setNeedsLayout];
    };
}

-(jobsByVoidBlock _Nonnull)reloadHistorySearches{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byHistorySearches(self.readHistorySearches());
        [self.tableView reloadData];
        if (self.config.historyChangedBlock) self.config.historyChangedBlock(self.historySearches);
    };
}

-(jobsByStrBlock _Nonnull)saveHistoryByText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        NSString *historyText = self.normalizedTextBy(text);
        if (!historyText.length) return;
        NSMutableArray <NSString *>*history = self.readHistorySearches().mutableCopy;
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
        }self.writeHistorySearches(history.copy);
        self.reloadHistorySearches();
    };
}

-(jobsByStrBlock _Nonnull)deleteHistoryByText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        NSString *historyText = self.normalizedTextBy(text);
        if (!historyText.length) return;
        NSMutableArray <NSString *>*history = self.readHistorySearches().mutableCopy;
        NSIndexSet *sameIndexSet = [history indexesOfObjectsPassingTest:^BOOL(NSString * _Nonnull obj,
                                                                               NSUInteger idx,
                                                                               BOOL * _Nonnull stop) {
            return [obj isEqualToString:historyText];
        }];
        if (!sameIndexSet.count) return;
        [history removeObjectsAtIndexes:sameIndexSet];
        self.writeHistorySearches(history.copy);
        self.reloadHistorySearches();
        if (self.config.historyDeleteBlock) self.config.historyDeleteBlock(historyText);
    };
}

-(void)clearHistory{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsClearHistory)))(self, @selector(jobsClearHistory));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsClearHistory{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.writeHistorySearches(nil);
        self.reloadHistorySearches();
        if (self.config.clearHistoryBlock) self.config.clearHistoryBlock();
    };
}

-(jobsByVoidBlock _Nonnull)updateByConfig{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.textField.byPlaceholder(self.config.placeholder.length ? self.config.placeholder : @"");
        [self.searchButton setTitle:self.config.searchButtonTitle.length ? self.config.searchButtonTitle : @"搜索"
                           forState:UIControlStateNormal];
        self.updateSearchButtonVisible(self.textField.isFirstResponder);
        self.updateSearchButtonEnabledByText(self.textField.text);
        self.recommendTitleLabel.byText(self.config.recommendTitle.length ? self.config.recommendTitle : @"");
        self.rebuildRecommendTagButtons();
        [self setNeedsLayout];
        [self.tableView reloadData];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)readHistorySearches{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        id data = [NSUserDefaults.standardUserDefaults objectForKey:self.config.historyStorageKey];
        if (![data isKindOfClass:NSArray.class]) return @[];
        return self.normalizedTextsByArray((NSArray *)data);
    };
}

-(jobsByNSArrayNSStringBlock _Nonnull)writeHistorySearches{
    @jobs_weakify(self)
    return ^(NSArray <NSString *>* historySearches){
        @jobs_strongify(self)
        if (!self) return;
        if (historySearches.count) {
            [NSUserDefaults.standardUserDefaults setObject:historySearches
                                                    forKey:self.config.historyStorageKey];
        } else {
            [NSUserDefaults.standardUserDefaults removeObjectForKey:self.config.historyStorageKey];
        }[NSUserDefaults.standardUserDefaults synchronize];
    };
}

-(JobsRetNSArrayNSStringByNSArrayBlock _Nonnull)normalizedTextsByArray{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*(NSArray * array){
        @jobs_strongify(self)
        if (!self) return nil;
        if (![array isKindOfClass:NSArray.class]) return @[];
        NSMutableArray <NSString *>*result = NSMutableArray.array;
        for (id obj in array) {
            NSString *text = self.normalizedTextBy(obj);
            if (!text.length || [result containsObject:text]) continue;
            [result addObject:text];
        };return result.copy;
    };
}

-(JobsRetStrByIDBlock _Nonnull)normalizedTextBy{
    @jobs_weakify(self)
    return ^NSString *(id data){
        @jobs_strongify(self)
        if (!self) return nil;
        if ([data isKindOfClass:NSString.class]) {
            return [(NSString *)data stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
        }
        if ([data respondsToSelector:@selector(stringValue)]) {
            return [[data stringValue] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
        };return @"";
    };
}

-(jobsByVoidBlock _Nonnull)rebuildRecommendTagButtons{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (UIButton *button in self.recommendButtonArr) {
            [button removeFromSuperview];
        }
        NSMutableArray <UIButton *>*buttonMutArr = NSMutableArray.array;
        [self.recommendSearches enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                                              NSUInteger idx,
                                                              BOOL * _Nonnull stop) {
            UIButton *button = UIButton.new;
            button.byTag(idx);
            button.jobsResetBtnBgCor(self.recommendTagColorAtIndex(idx));
            button.layer.byCornerRadius(6);
            button.layer.byMasksToBounds(YES);
            button.titleLabel.byFont([UIFont systemFontOfSize:13 weight:UIFontWeightSemibold]);
            button.titleLabel.byAdjustsFontSizeToFitWidth(YES);
            button.titleLabel.byMinimumScaleFactor(0.72);
            button.titleLabel.byLineBreakMode(NSLineBreakByClipping);
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
        self.byRecommendButtonArr(buttonMutArr.copy);
    };
}

-(jobsByVoidBlock _Nonnull)layoutRecommendSection{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
        self.recommendTitleLabel.byFrame(CGRectMake(16, 0, contentWidth, titleHeight));
        self.recommendTagContainerView.byFrame(CGRectMake(0, tagTop, sectionWidth, 0));
        for (UIButton *button in self.recommendButtonArr) {
            NSString *title = [button titleForState:UIControlStateNormal] ? : @"";
            CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
            CGFloat tagWidth = MIN(ceil(titleSize.width) + 26, contentWidth);
            if (x > 16 && x + tagWidth > sectionWidth - 16) {
                x = 16;
                y += tagHeight + verticalSpace;
            }
            button.byFrame(CGRectMake(x, y, tagWidth, tagHeight));
            x += tagWidth + horizontalSpace;
        }
        CGFloat tagsHeight = self.recommendButtonArr.count ? y + tagHeight : 0;
        self.recommendTagContainerView.byFrame(CGRectMake(0, tagTop, sectionWidth, tagsHeight));
        CGFloat targetHeight = tagTop + tagsHeight + 10;
        [self.recommendSectionHeightConstraint setOffset:targetHeight];
    };
}

-(JobsRetCorByNSUIntegerBlock _Nonnull)recommendTagColorAtIndex{
    @jobs_weakify(self)
    return ^UIColor *(NSUInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

-(JobsRetImageByCorBlock _Nonnull)trashIconImageWithColor{
    @jobs_weakify(self)
    return ^UIImage *(UIColor * color){
        @jobs_strongify(self)
        if (!self) return nil;
        CGSize size = CGSizeMake(16, 16);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        UIBezierPath *lidPath = UIBezierPath.bezierPath;
        lidPath.byLineWidth(1.4);
        [color setStroke];
        [lidPath moveToPoint:CGPointMake(4, 4.8)];
        [lidPath addLineToPoint:CGPointMake(12, 4.8)];
        [lidPath moveToPoint:CGPointMake(6.2, 3.2)];
        [lidPath addLineToPoint:CGPointMake(9.8, 3.2)];
        [lidPath stroke];
        UIBezierPath *bodyPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(5, 6, 6, 7.8)
                                                             cornerRadius:1.1];
        bodyPath.byLineWidth(1.4);
        [bodyPath stroke];
        UIBezierPath *linePath = UIBezierPath.bezierPath;
        linePath.byLineWidth(1);
        [linePath moveToPoint:CGPointMake(7, 7.5)];
        [linePath addLineToPoint:CGPointMake(7, 12)];
        [linePath moveToPoint:CGPointMake(9, 7.5)];
        [linePath addLineToPoint:CGPointMake(9, 12)];
        [linePath stroke];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    };
}

-(JobsRetNSStringByNSIndexPathBlock _Nonnull)textByIndexPath{
    @jobs_weakify(self)
    return ^NSString *(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        if (indexPath.section == JobsOCSearcherSectionHistory &&
            indexPath.row < (NSInteger)self.historySearches.count) {
            return self.historySearches[indexPath.row];
        };return @"";
    };
}

-(jobsByBOOLBlock _Nonnull)updateSearchButtonVisible{
    @jobs_weakify(self)
    return ^(BOOL visible){
        @jobs_strongify(self)
        if (!self) return;
        self.searchButton.byHidden(!visible);
        [self.searchButtonLeftConstraint setOffset:visible ? 8 : 0];
        [self.searchButtonWidthConstraint setOffset:visible ? 64 : 0];
        self.searchButton.byUserInteractionEnabled(visible && self.searchButton.enabled);
        [self setNeedsLayout];
    };
}

-(jobsByStrBlock _Nonnull)updateSearchButtonEnabledByText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        BOOL enabled = self.normalizedTextBy(text).length > 0;
        if (self.searchButton) self.searchButton.byEnabled(enabled);
        self.searchButton.byUserInteractionEnabled(enabled && !self.searchButton.hidden);
        self.searchButton.byAlpha(1);
    };
}

-(jobsByStrBlock _Nonnull)performSearchByText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        NSString *searchText = self.normalizedTextBy(text);
        self.updateSearchButtonEnabledByText(searchText);
        if (!searchText.length) return;
        self.textField.byText(searchText);
        self.saveHistoryByText(searchText);
        if (self.config.searchConfirmBlock) self.config.searchConfirmBlock(searchText);
        [self.textField resignFirstResponder];
        self.updateSearchButtonVisible(NO);
    };
}

-(jobsByVoidBlock _Nonnull)cancelSearchEditing{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.textField.byText(@"");
        self.updateSearchButtonEnabledByText(@"");
        if (self.config.dismissKeyboardWhenCancel) [self.textField resignFirstResponder];
        self.updateSearchButtonVisible(NO);
        if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(@"");
        if (self.config.cancelBlock) self.config.cancelBlock();
    };
}

-(jobsByStrBlock _Nonnull)selectSearchText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        NSString *searchText = self.normalizedTextBy(text);
        if (!searchText.length) return;
        self.textField.byText(searchText);
        [self.textField becomeFirstResponder];
        self.updateSearchButtonVisible(YES);
        self.updateSearchButtonEnabledByText(searchText);
        if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(searchText);
        if (self.config.itemSelectedBlock) self.config.itemSelectedBlock(searchText);
    };
}

-(void)textFieldEditingChanged:(UITextField *)textField{
    jobsByTextFieldBlock action = ((jobsByTextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsTextFieldEditingChanged)))(self, @selector(jobsTextFieldEditingChanged));
    if (action) action(textField);
}

-(jobsByTextFieldBlock _Nonnull)jobsTextFieldEditingChanged{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        NSString *text = self.normalizedTextBy(textField.text);
        self.updateSearchButtonEnabledByText(text);
        if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(text);
    };
}

-(void)searchButtonEvent{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsSearchButtonEvent)))(self, @selector(jobsSearchButtonEvent));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsSearchButtonEvent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.performSearchByText(self.textField.text);
    };
}

-(void)blankTapGestureEvent{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsBlankTapGestureEvent)))(self, @selector(jobsBlankTapGestureEvent));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsBlankTapGestureEvent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.textField.isFirstResponder) return;
        self.cancelSearchEditing();
    };
}

-(void)recommendTagButtonEvent:(UIButton *)sender{
    jobsByBtnBlock action = ((jobsByBtnBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsRecommendTagButtonEvent)))(self, @selector(jobsRecommendTagButtonEvent));
    if (action) action(sender);
}

-(jobsByBtnBlock _Nonnull)jobsRecommendTagButtonEvent{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        NSInteger index = sender.tag;
        if (index < 0 || (NSUInteger)index >= self.recommendSearches.count) return;
        self.selectSearchText(self.recommendSearches[index]);
    };
}
#pragma mark —— UITableViewDelegate / UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return JobsOCSearcherSectionCount;
    };
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
    UIView *header = jobsMakeView(^(UIView *object){});
    header.byBgColor(self.backgroundColor);
    UILabel *label = jobsMakeLabel(^(UILabel *object){});
    label.byFont([UIFont systemFontOfSize:16 weight:UIFontWeightSemibold]);
    label.byTextColor([UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1]);
    label.byText(self.config.historyTitle.length ? self.config.historyTitle : @"");
    [header addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(header).offset(16);
        make.right.equalTo(header).offset(-16);
        make.bottom.equalTo(header).offset(-8);
    }];
    if (section == JobsOCSearcherSectionHistory) {
        UIColor *buttonColor = [UIColor colorWithRed:0.63 green:0.67 blue:0.73 alpha:1];
        UIButton *clearButton = UIButton.new;
        clearButton.titleLabel.byFont([UIFont systemFontOfSize:13 weight:UIFontWeightRegular]);
        clearButton.byContentHorizontalAlignment(UIControlContentHorizontalAlignmentRight);
        [clearButton setTitle:@"清空"
                     forState:UIControlStateNormal];
        [clearButton setTitleColor:buttonColor
                          forState:UIControlStateNormal];
        [clearButton setImage:self.trashIconImageWithColor(buttonColor)
                     forState:UIControlStateNormal];
        clearButton.byImageEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 4));
        clearButton.byTitleEdgeInsets(UIEdgeInsetsMake(0, 4, 0, 0));
        [clearButton addTarget:self
                        action:@selector(clearHistory)
              forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:clearButton];
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
    NSString *text = self.textByIndexPath(indexPath);
    JobsOCSearcherRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:(JobsOCSearcherRecordCell.reuseIdentifier)()
                                                                   forIndexPath:indexPath];
    cell.updateWithText(text);
    @jobs_weakify(self)
    cell.deleteBlock = ^(__kindof NSString * _Nullable string) {
        @jobs_strongify(self)
        self.deleteHistoryByText(string);
    };
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    self.selectSearchText(self.textByIndexPath(indexPath));
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
    ((((jobsByTextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(textFieldDidBeginEditing)))(self, @selector(textFieldDidBeginEditing))))(textField);
}
-(jobsByTextFieldBlock _Nonnull)textFieldDidBeginEditing{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        self.updateSearchButtonVisible(YES);
        self.updateSearchButtonEnabledByText(textField.text);
    };
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    ((((jobsByTextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(textFieldDidEndEditing)))(self, @selector(textFieldDidEndEditing))))(textField);
}
-(jobsByTextFieldBlock _Nonnull)textFieldDidEndEditing{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        self.updateSearchButtonVisible(NO);
    };
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsTextFieldShouldReturn)))(self, @selector(jobsTextFieldShouldReturn));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldReturn{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        self.performSearchByText(textField.text);
        return YES;
    };
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherView.class, @selector(jobsTextFieldShouldClear)))(self, @selector(jobsTextFieldShouldClear));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldClear{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        self.updateSearchButtonEnabledByText(@"");
        if (self.config.searchTextDidChangeBlock) self.config.searchTextDidChangeBlock(@"");
        return YES;
    };
}
#pragma mark —— lazyLoad
-(UIView *)searchContainerView{
    if (!_searchContainerView) {
        _searchContainerView = jobsMakeView(^(UIView *object){});
        _searchContainerView.byTranslatesAutoresizingMaskIntoConstraints(NO);
        _searchContainerView.byBgColor(JobsSecondarySystemBackgroundColor);
        _searchContainerView.layer.byCornerRadius(12);
        _searchContainerView.layer.byBorderWidth(0.5);
        _searchContainerView.layer.byBorderColor([UIColor colorWithRed:0.86 green:0.89 blue:0.93 alpha:1].CGColor);
    };return _searchContainerView;
}

-(UITextField *)textField{
    if (!_textField) {
        _textField = jobsMakeTextField(^(UITextField *object){});
        _textField.byTranslatesAutoresizingMaskIntoConstraints(NO);
        _textField.byClearButtonMode(UITextFieldViewModeWhileEditing);
        _textField.byLeftView(self.searchIconLeftView());
        _textField.byLeftViewMode(UITextFieldViewModeAlways);
        _textField.byReturnKeyType(UIReturnKeySearch);
        _textField.byDelegate(self);
        _textField.byFont([UIFont systemFontOfSize:15 weight:UIFontWeightRegular]);
        _textField.byTextColor([UIColor colorWithRed:0.18 green:0.24 blue:0.31 alpha:1]);
        [_textField addTarget:self
                       action:@selector(textFieldEditingChanged:)
             forControlEvents:UIControlEventEditingChanged];
    };return _textField;
}

-(UIButton *)searchButton{
    if (!_searchButton) {
        _searchButton = UIButton.new;
        _searchButton.byTranslatesAutoresizingMaskIntoConstraints(NO);
        _searchButton.byHidden(YES);
        _searchButton.layer.byCornerRadius(12);
        _searchButton.layer.byMasksToBounds(YES);
        _searchButton.byContentEdgeInsets(UIEdgeInsetsMake(0, 12, 0, 12));
        _searchButton.titleLabel.byFont([UIFont systemFontOfSize:14 weight:UIFontWeightSemibold]);
        [_searchButton setTitleColor:UIColor.whiteColor
                             forState:UIControlStateNormal];
        [_searchButton setTitleColor:UIColor.whiteColor
                             forState:UIControlStateHighlighted];
        [_searchButton setTitleColor:[UIColor colorWithRed:0.57 green:0.63 blue:0.72 alpha:1]
                             forState:UIControlStateDisabled];
        [_searchButton setBackgroundImage:self.searchButtonBackgroundImageWithColor([UIColor colorWithRed:0.19 green:0.45 blue:0.84 alpha:1])
                                  forState:UIControlStateNormal];
        [_searchButton setBackgroundImage:self.searchButtonBackgroundImageWithColor([UIColor colorWithRed:0.15 green:0.36 blue:0.70 alpha:1])
                                  forState:UIControlStateHighlighted];
        [_searchButton setBackgroundImage:self.searchButtonBackgroundImageWithColor([UIColor colorWithRed:0.91 green:0.94 blue:0.98 alpha:1])
                                  forState:UIControlStateDisabled];
        [_searchButton addTarget:self
                          action:@selector(searchButtonEvent)
                forControlEvents:UIControlEventTouchUpInside];
    };return _searchButton;
}

-(JobsRetImageByCorBlock _Nonnull)searchButtonBackgroundImageWithColor{
    @jobs_weakify(self)
    return ^UIImage *(UIColor * color){
        @jobs_strongify(self)
        if (!self) return nil;
        CGRect rect = CGRectMake(0, 0, 1, 1);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
        [color setFill];
        UIRectFill(rect);
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)searchIconLeftView{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        UIView *containerView = [UIView.alloc initWithFrame:CGRectMake(0, 0, 34, 42)];
        UIImageView *imageView = [UIImageView.alloc initWithImage:self.searchIconImageWithColor([UIColor colorWithRed:0.53 green:0.58 blue:0.65 alpha:1])];
        imageView.byFrame(CGRectMake(10, 13, 16, 16));
        imageView.byContentMode(UIViewContentModeScaleAspectFit);
        [containerView addSubview:imageView];
        return containerView;
    };
}

-(JobsRetImageByCorBlock _Nonnull)searchIconImageWithColor{
    @jobs_weakify(self)
    return ^UIImage *(UIColor * color){
        @jobs_strongify(self)
        if (!self) return nil;
        CGSize size = CGSizeMake(16, 16);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        [color setStroke];
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.2, 2.2, 8.8, 8.8)];
        circlePath.byLineWidth(1.6);
        [circlePath stroke];
        UIBezierPath *handlePath = UIBezierPath.bezierPath;
        handlePath.byLineWidth(1.8);
        handlePath.byLineCapStyle(kCGLineCapRound);
        [handlePath moveToPoint:CGPointMake(9.4, 9.4)];
        [handlePath addLineToPoint:CGPointMake(13.4, 13.4)];
        [handlePath stroke];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    };
}

-(UIView *)recommendSectionView{
    if (!_recommendSectionView) {
        _recommendSectionView = jobsMakeView(^(UIView *object){});
        _recommendSectionView.byTranslatesAutoresizingMaskIntoConstraints(NO);
        _recommendSectionView.byBgColor(UIColor.clearColor);
    };return _recommendSectionView;
}

-(UILabel *)recommendTitleLabel{
    if (!_recommendTitleLabel) {
        _recommendTitleLabel = jobsMakeLabel(^(UILabel *object){});
        _recommendTitleLabel.byFont([UIFont systemFontOfSize:16 weight:UIFontWeightSemibold]);
        _recommendTitleLabel.byTextColor([UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1]);
    };return _recommendTitleLabel;
}

-(UIView *)recommendTagContainerView{
    if (!_recommendTagContainerView) {
        _recommendTagContainerView = jobsMakeView(^(UIView *object){});
        _recommendTagContainerView.byBgColor(UIColor.clearColor);
    };return _recommendTagContainerView;
}

-(UITapGestureRecognizer *)blankTapGestureRecognizer{
    if (!_blankTapGestureRecognizer) {
        _blankTapGestureRecognizer = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                           action:@selector(blankTapGestureEvent)];
        _blankTapGestureRecognizer.byCancelsTouchesInView(NO);
        _blankTapGestureRecognizer.byDelegate(self);
    };return _blankTapGestureRecognizer;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView.alloc initWithFrame:CGRectZero
                                                style:UITableViewStyleGrouped];
        _tableView.byTranslatesAutoresizingMaskIntoConstraints(NO);
        _tableView.byBgColor(UIColor.clearColor);
        _tableView.bySeparatorStyle(UITableViewCellSeparatorStyleNone);
        _tableView.byKeyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag);
        _tableView.byDelegate(self);
        _tableView.byDataSource(self);
        [_tableView registerClass:JobsOCSearcherRecordCell.class
           forCellReuseIdentifier:(JobsOCSearcherRecordCell.reuseIdentifier)()];
        if (@available(iOS 15.0, *)) {
            _tableView.bySectionHeaderTopPadding(0);
        }
    };return _tableView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSearcherView
-(JobsRetJobsOCSearcherViewByMASConstraintBlock _Nonnull)byRecommendSectionHeightConstraint{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView * _Nullable(MASConstraint * _Nullable data){
        @jobs_strongify(self)
        [self setRecommendSectionHeightConstraint:data];
        return self;
    };
}

-(JobsRetJobsOCSearcherViewByMASConstraintBlock _Nonnull)bySearchButtonLeftConstraint{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView * _Nullable(MASConstraint * _Nullable data){
        @jobs_strongify(self)
        [self setSearchButtonLeftConstraint:data];
        return self;
    };
}

-(JobsRetJobsOCSearcherViewByMASConstraintBlock _Nonnull)bySearchButtonWidthConstraint{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView * _Nullable(MASConstraint * _Nullable data){
        @jobs_strongify(self)
        [self setSearchButtonWidthConstraint:data];
        return self;
    };
}

-(JobsRetJobsOCSearcherViewByNSArrayNSStringBlock _Nonnull)byHistorySearches{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView * _Nullable(NSArray <NSString *>* _Nullable data){
        @jobs_strongify(self)
        [self setHistorySearches:data];
        return self;
    };
}

-(JobsRetJobsOCSearcherViewByNSArrayUIButtonBlock _Nonnull)byRecommendButtonArr{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView * _Nullable(NSArray <UIButton *>* _Nullable data){
        @jobs_strongify(self)
        [self setRecommendButtonArr:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSearcherView
@end
