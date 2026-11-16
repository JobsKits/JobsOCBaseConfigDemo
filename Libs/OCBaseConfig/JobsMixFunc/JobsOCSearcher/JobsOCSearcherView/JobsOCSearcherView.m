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

Prop_copy(readwrite)NSString *normalizedQuery;
Prop_strong(readwrite, nullable)UIView *resultContentView;
Prop_strong()UIView *resultContainerView;
Prop_strong()UIView *emptyStateView;
Prop_strong()UIButton *emptyStateButton;
Prop_strong()UIView *inputAccessoryView;
Prop_strong()UIButton *cancelButton;
Prop_strong()UIView *historyHeaderView;
Prop_strong()UILabel *historyTitleLabel;
Prop_strong()UIButton *clearHistoryButton;
Prop_strong()UIView *searchIconContainerView;
Prop_strong()UIImageView *searchIconView;
Prop_assign()NSUInteger resultCount;
Prop_copy()NSString *historyContextKey;
Prop_assign()BOOL historyContextPersists;
Prop_strong()NSUserDefaults *historyContextDefaults;
Prop_strong()NSMutableDictionary <NSString *, NSArray <NSString *>*> *memoryHistories;
Prop_assign()CGFloat recommendationLayoutWidth;
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
@interface JobsOCSearcherView (JobsPropertyDSLSetterAutogen_b114068a45)
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
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.setupWithConfig(nil);
    }
    return self;
}

-(instancetype)initWithConfig:(JobsOCSearcherConfig *)config{
    if (self = [super initWithFrame:CGRectZero]) {
        self.setupWithConfig(config);
    }
    return self;
}

-(instancetype)initWithConfig:(JobsOCSearcherConfig *)config
                    textField:(UITextField *)textField{
    if (self = [super initWithFrame:CGRectZero]) {
        _textField = textField;
        self.setupWithConfig(config);
    }
    return self;
}

-(JobsRetJobsOCSearcherViewByNSArrayNSStringBlock _Nonnull)byRecommendSearches{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherView *_Nullable(NSArray <NSString *>*_Nullable recommendSearches) {
        @jobs_strongify(self)
        [self setRecommendSearches:self.normalizedTextsByArray(recommendSearches ?: @[])];
        self.rebuildRecommendTagButtons();
        self.refreshPresentation();
        [self setNeedsLayout];
        return self;
    };
}

-(jobsByJobsOCSearcherConfigBlock _Nonnull)setupWithConfig{
    @jobs_weakify(self)
    return ^(JobsOCSearcherConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        self.byConfig(config ? : JobsOCSearcherConfig.defaultConfig());
        self->_normalizedQuery = @"";
        self->_memoryHistories = jobsMakeMutDic(nil);
        self.captureHistoryContext();
        self.searchContainerView.addOn(self);
        self.textField.byClearButtonMode(UITextFieldViewModeWhileEditing)
            .byLeftView(self.searchIconLeftView())
            .byLeftViewMode(UITextFieldViewModeAlways)
            .byReturnKeyType(UIReturnKeySearch)
            .byInputAccessoryView(self.inputAccessoryView)
            .byDelegate(self)
            .onJobsEvent(UIControlEventEditingChanged, ^(__kindof UIControl *control) {
                @jobs_strongify(self)
                self.textFieldEditingChanged((UITextField *)control);
            })
            .addOn(self.searchContainerView);
        self.searchButton.addOn(self);
        self.cancelButton.addOn(self);
        self.resultContainerView.addOn(self);
        self.emptyStateView.addOn(self);
        self.recommendSectionView.addOn(self);
        self.recommendTitleLabel.addOn(self.recommendSectionView);
        self.recommendTagContainerView.addOn(self.recommendSectionView);
        self.tableView.addOn(self);
        self.byAddGestureRecognizer(self.blankTapGestureRecognizer);
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
        self.textField.byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.searchContainerView).insets(UIEdgeInsetsMake(0, 12, 0, 12));
        });
        self.refreshContentConstraints();
    };
}


-(jobsByVoidBlock _Nonnull)refreshContentConstraints{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self)
            return;
        if (self.config.inputOnly) {
            self.recommendSectionView.byRemake(^(MASConstraintMaker *make) {
                make.left.right.top.equalTo(self);
                self.byRecommendSectionHeightConstraint(make.height.mas_equalTo(0));
            });
            for (UIView *view in @[self.tableView, self.resultContainerView, self.emptyStateView]) {
                view.byRemake(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
            }
            return;
        }
        self.recommendSectionView.byRemake(^(MASConstraintMaker *make) {
            make.top.equalTo(self.searchContainerView.mas_bottom).offset(12);
            make.left.right.equalTo(self);
            self.byRecommendSectionHeightConstraint(make.height.mas_equalTo(0));
        });
        self.tableView.byRemake(^(MASConstraintMaker *make) {
            make.top.equalTo(self.recommendSectionView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        });
        self.resultContainerView.byRemake(^(MASConstraintMaker *make) {
            make.top.equalTo(self.searchContainerView.mas_bottom).offset(8);
            make.left.right.bottom.equalTo(self);
        });
        self.emptyStateView.byRemake(^(MASConstraintMaker *make) {
            make.top.equalTo(self.recommendSectionView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        });
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
    return ^(JobsOCSearcherConfig *config) {
        @jobs_strongify(self)
        if (!self) return;
        self.byConfig(config ?: JobsOCSearcherConfig.defaultConfig());
        self.captureHistoryContext();
        self.refreshContentConstraints();
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
        self.refreshPresentation();
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
        NSUInteger maxCount = MIN(MAX(self.config.maxHistoryCount, 1), 1000);
        while (history.count > maxCount) {
            history.removeLastObject;
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

-(jobsByVoidBlock _Nonnull)clearHistory{
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
        UIColor *foreground = self.config.textColor ?: JobsLabelColor;
        UIColor *secondary = self.config.secondaryTextColor ?: JobsLabelColor.colorWithAlphaComponentBy(0.7);
        UIColor *action = self.config.accentColor ?: (JobsThemeCenter.shared.darkMode ? HEXCOLOR(0x8BC4EB) : HEXCOLOR(0x195E83));
        self.byBgColor(self.config.pageBackgroundColor ?: JobsSystemBackgroundColor);
        self.searchContainerView.byBgColor(self.config.inputBackgroundColor ?: JobsSecondarySystemBackgroundColor)
            .byLayer(^(CALayer *layer) {
                layer.byBorderWidth(0);
            });
        self.textField.byAttributedPlaceholder(JobsAttributedStringByAttributes((self.config.placeholder.length ? self.config.placeholder : @"请输入搜索内容").jobsTr(), @{
            NSForegroundColorAttributeName: secondary,
            NSFontAttributeName: UIFontWeightRegularSize(16)
        }))
            .byFont(UIFontWeightRegularSize(16))
            .byTextCor(foreground)
            .byTintColor(action)
            .byAccessibilityIdentifier(self.identifierBy(@"field"));
        self.searchIconView.byImage(self.searchIconImageWithColor(secondary));
        self.searchButton.jobsResetBtnTitle((self.config.searchButtonTitle.length ? self.config.searchButtonTitle : @"搜索").jobsTr())
            .byAccessibilityIdentifier(self.identifierBy(@"submit"));
        self.cancelButton.jobsResetBtnTitle((self.config.cancelButtonTitle ?: @"取消").jobsTr())
            .jobsResetBtnTitleCor(action)
            .byAccessibilityIdentifier(self.identifierBy(@"cancel"));
        self.recommendTitleLabel.byText((self.config.recommendTitle.length ? self.config.recommendTitle : @"搜索推荐").jobsTr())
            .byTextCor(foreground);
        self.historyTitleLabel.byText((self.config.historyTitle.length ? self.config.historyTitle : @"搜索历史").jobsTr())
            .byTextCor(foreground);
        self.clearHistoryButton.jobsResetBtnTitle((self.config.clearHistoryButtonTitle ?: @"清空").jobsTr())
            .jobsResetBtnTitleCor(action)
            .byAccessibilityIdentifier(self.identifierBy(@"history.clear"));
        self.tableView.byAccessibilityIdentifier(self.identifierBy(@"history"));
        self.searchButton.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *configuration) {
            configuration.byContentInsets(NSDirectionalEdgeInsetsMake(0, 12, 0, 12))
                .byTitleLineBreakMode(NSLineBreakByClipping)
                .byTitleTextAttributesTransformer(^NSDictionary *(NSDictionary *attributes) {
                    NSMutableDictionary *result = attributes.mutableCopy;
                    result[NSFontAttributeName] = UIFontWeightSemiboldSize(14);
                    return result;
                });
        }).byTitleLabel(^(__kindof UILabel *label) {
            label.byFont(UIFontWeightSemiboldSize(14)).byNumberOfLines(1).byLineBreakMode(NSLineBreakByClipping);
        });
        self.cancelButton.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *configuration) {
            configuration.byContentInsets(NSDirectionalEdgeInsetsMake(0, 8, 0, 8))
                .byTitleLineBreakMode(NSLineBreakByClipping)
                .byTitleTextAttributesTransformer(^NSDictionary *(NSDictionary *attributes) {
                    NSMutableDictionary *result = attributes.mutableCopy;
                    result[NSFontAttributeName] = UIFontWeightRegularSize(16);
                    return result;
                });
        }).byTitleLabel(^(__kindof UILabel *label) {
            label.byFont(UIFontWeightRegularSize(16)).byNumberOfLines(1).byLineBreakMode(NSLineBreakByClipping);
        });
        self.updateSearchButtonVisible(self.textField.isFirstResponder);
        self.updateSearchButtonEnabledByText(self.textField.text);
        self.rebuildRecommendTagButtons();
        self->_recommendationLayoutWidth = 0;
        self.refreshPresentation();
        [self setNeedsLayout];
        [self.tableView reloadData];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)readHistorySearches{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        self.captureHistoryContext();
        id data = self.historyContextPersists
            ? [self.historyContextDefaults objectForKey:self.historyContextKey]
            : self.memoryHistories[self.historyContextKey];
        NSArray *history = self.normalizedTextsByArray([data isKindOfClass:NSArray.class] ? data : @[]);
        NSUInteger count = MIN(history.count, MIN(MAX(self.config.maxHistoryCount, 1), 1000));
        return [history subarrayWithRange:NSMakeRange(0, count)];
    };
}

-(jobsByNSArrayNSStringBlock _Nonnull)writeHistorySearches{
    @jobs_weakify(self)
    return ^(NSArray <NSString *>*history) {
        @jobs_strongify(self)
        if (!self) return;
        self.captureHistoryContext();
        if (!self.historyContextPersists) {
            self.memoryHistories[self.historyContextKey] = history ?: @[];
            return;
        }
        if (history.count) {
            [self.historyContextDefaults setObject:history forKey:self.historyContextKey];
        }else{
            [self.historyContextDefaults removeObjectForKey:self.historyContextKey];
        }
    };
}

-(JobsRetNSArrayNSStringByNSArrayBlock _Nonnull)normalizedTextsByArray{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*(NSArray * array){
        @jobs_strongify(self)
        if (!self) return nil;
        if (![array isKindOfClass:NSArray.class]) return @[];
        NSMutableArray <NSString *>*result = jobsMakeMutArr(nil);
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
        @jobs_weakify(self)
        for (UIButton *button in self.recommendButtonArr) {
            button.byRemove();
        }
        NSMutableArray <UIButton *>*buttonMutArr = jobsMakeMutArr(nil);
        [self.recommendSearches enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                                              NSUInteger idx,
                                                              BOOL * _Nonnull stop) {
            UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
                button
                    .jobsResetBtnTitle(obj)
                    .jobsResetBtnTitleCor(UIColor.whiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(14))
                    .byTitleLabel(^(__kindof UILabel * _Nullable label) {
                        label
                            .byAdjustsFontSizeToFitWidth(YES)
                            .byNumberOfLines(1)
                            .byMinimumScaleFactor(0.9)
                            .byLineBreakMode(NSLineBreakByClipping);
                    })
                    .jobsResetBtnBgCor(self.recommendTagColorAtIndex(idx))
                    .jobsResetBtnCornerRadiusValue(6)
                    .onClickBy(^(__kindof UIButton * _Nullable button) {
                        weak_self.recommendTagButtonEvent(button);
                    })
                    .byTag(idx)
                    .byClipsToBounds(YES)
                    .addOn(self.recommendTagContainerView);
            });
            [buttonMutArr addObject:button];
        }];
        self.byRecommendButtonArr(buttonMutArr.copy);
        self->_recommendationLayoutWidth = 0;
    };
}

-(jobsByVoidBlock _Nonnull)layoutRecommendSection{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL visible = !self.config.inputOnly && self.recommendSearches.count > 0 && !self.normalizedQuery.length;
        self.recommendSectionView.byHidden(!visible);
        if (!visible) {
            [self.recommendSectionHeightConstraint setOffset:0];
            self->_recommendationLayoutWidth = 0;
            return;
        }
        CGFloat width = CGRectGetWidth(self.bounds);
        if (width <= 32 || fabs(width - self.recommendationLayoutWidth) < 0.5)
            return;
        self->_recommendationLayoutWidth = width;
        self.recommendTitleLabel.byRemake(^(MASConstraintMaker *make) {
            make.top.equalTo(self.recommendSectionView);
            make.left.equalTo(self.recommendSectionView).offset(16);
            make.right.equalTo(self.recommendSectionView).offset(-16);
            make.height.mas_equalTo(24);
        });
        self.recommendTagContainerView.byRemake(^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.recommendSectionView);
            make.top.equalTo(self.recommendTitleLabel.mas_bottom).offset(8);
        });
        CGFloat x = 16;
        CGFloat y = 0;
        for (UIButton *button in self.recommendButtonArr) {
            NSUInteger index = (NSUInteger)button.tag;
            NSString *title = index < self.recommendSearches.count ? self.recommendSearches[index] : @"";
            CGFloat tagWidth = MIN(ceil([title sizeWithAttributes:@{NSFontAttributeName:UIFontWeightSemiboldSize(14)}].width) + 26, width - 32);
            if (x > 16 && x + tagWidth > width - 16) {
                x = 16;
                y += 52;
            }
            button.byRemake(^(MASConstraintMaker *make) {
                make.left.equalTo(self.recommendTagContainerView).offset(x);
                make.top.equalTo(self.recommendTagContainerView).offset(y);
                make.width.mas_equalTo(tagWidth);
                make.height.mas_equalTo(44);
            });
            x += tagWidth + 8;
        }
        [self.recommendSectionHeightConstraint setOffset:32 + y + 54];
    };
}

-(JobsRetCorByNSUIntegerBlock _Nonnull)recommendTagColorAtIndex{
    return ^UIColor *(NSUInteger index) {
        NSArray <UIColor *> *colors = @[
            HEXCOLOR(0x315C8C), HEXCOLOR(0x6651A0), HEXCOLOR(0x176B61),
            HEXCOLOR(0x8B4C2F), HEXCOLOR(0x6F4C72), HEXCOLOR(0x3B6275)
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
        UIImage *image = JobsRenderImage(size, NO, 0, ^(CGContextRef jobsDrawingContext) {
            UIBezierPath *lidPath = jobsMakeBezierPath(nil);
            lidPath.byLineWidth(1.4);
            [color setStroke];
            [lidPath moveToPoint:CGPointMake(4, 4.8)];
            [lidPath addLineToPoint:CGPointMake(12, 4.8)];
            [lidPath moveToPoint:CGPointMake(6.2, 3.2)];
            [lidPath addLineToPoint:CGPointMake(9.8, 3.2)];
            [lidPath stroke];
            UIBezierPath *bodyPath = UIBezierPath.byBezierPathWithRoundedRect(CGRectMake(5, 6, 6, 7.8), 1.1);
            bodyPath.byLineWidth(1.4);
            [bodyPath stroke];
            UIBezierPath *linePath = jobsMakeBezierPath(nil);
            linePath.byLineWidth(1);
            [linePath moveToPoint:CGPointMake(7, 7.5)];
            [linePath addLineToPoint:CGPointMake(7, 12)];
            [linePath moveToPoint:CGPointMake(9, 7.5)];
            [linePath addLineToPoint:CGPointMake(9, 12)];
            [linePath stroke];
        });
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
    return ^(BOOL editing) {
        @jobs_strongify(self)
        if (!self) return;
        BOOL searchVisible = self.config.showsSearchButton && editing;
        self.searchButton.byHidden(!searchVisible);
        BOOL cancelVisible = self.config.showsCancelButton && (!self.config.inputOnly || editing || self.normalizedQuery.length);
        self.cancelButton.byHidden(!cancelVisible);
        CGFloat controlHeight = self.config.inputOnly ? 32 : 44;
        CGFloat top = self.config.inputOnly ? 0 : 6;
        self.cancelButton.byRemake(^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(self.config.inputOnly ? 0 : -12);
            make.top.equalTo(self).offset(top);
            make.height.mas_equalTo(controlHeight);
            if (cancelVisible) {
                make.width.mas_equalTo(MAX(44, ceil([(self.config.cancelButtonTitle ?: @"取消").jobsTr() sizeWithAttributes:@{NSFontAttributeName:UIFontWeightRegularSize(16)}].width) + 16));
            }else{
                make.width.mas_equalTo(0);
            }
        });
        self.searchButton.byRemake(^(MASConstraintMaker *make) {
            make.right.equalTo(self.cancelButton.mas_left).offset(cancelVisible ? -8 : 0);
            make.centerY.equalTo(self.cancelButton);
            make.height.mas_equalTo(controlHeight);
            self.bySearchButtonWidthConstraint(make.width.mas_equalTo(searchVisible ? MAX(64, [(self.config.searchButtonTitle.length ? self.config.searchButtonTitle : @"搜索").jobsTr() sizeWithAttributes:@{NSFontAttributeName:UIFontWeightSemiboldSize(14)}].width + 24) : 0));
        });
        self.searchContainerView.byRemake(^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(self.config.inputOnly ? 0 : 16);
            make.top.equalTo(self).offset(top);
            make.height.mas_equalTo(controlHeight);
            self.bySearchButtonLeftConstraint(make.right.equalTo(self.searchButton.mas_left).offset(searchVisible ? -8 : 0));
        });
        self.searchButton.byUserInteractionEnabled(searchVisible && self.searchButton.jobs_isEnabled);
    };
}

-(jobsByStrBlock _Nonnull)updateSearchButtonEnabledByText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        BOOL enabled = self.normalizedTextBy(text).length > 0;
        self.searchButton
            .byEnabled(enabled)
            .byUserInteractionEnabled(enabled && !self.searchButton.hidden)
            .byAlpha(1);
    };
}

-(jobsByStrBlock _Nonnull)performSearchByText{
    @jobs_weakify(self)
    return ^(NSString *text) {
        @jobs_strongify(self)
        if (!self || self.textField.markedTextRange)
            return;
        self.byQuery(self.normalizedTextBy(text), NO);
        if (!self.normalizedQuery.length) {
            if (self.config.inputOnly && self.config.searchConfirmBlock)
                self.config.searchConfirmBlock(@"");
            self.dismissKeyboard();
            return;
        }
        self.saveHistoryByText(self.normalizedQuery);
        if (self.config.searchConfirmBlock)
            self.config.searchConfirmBlock(self.normalizedQuery);
        self.dismissKeyboard();
    };
}

-(jobsByVoidBlock _Nonnull)cancelSearchEditing{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byQuery(@"", NO);
        if (self.config.dismissKeyboardWhenCancel)
            self.dismissKeyboard();
        if (self.config.cancelBlock) self.config.cancelBlock();
    };
}

-(jobsByStrBlock _Nonnull)selectSearchText{
    @jobs_weakify(self)
    return ^(NSString *text) {
        @jobs_strongify(self)
        if (!self) return;
        NSString *query = self.normalizedTextBy(text);
        if (!query.length)
            return;
        self.byQuery(query, NO).focus();
        if (self.config.itemSelectedBlock)
            self.config.itemSelectedBlock(query);
    };
}

-(jobsByTextFieldBlock _Nonnull)textFieldEditingChanged{
    @jobs_weakify(self)
    return ^(UITextField *textField) {
        @jobs_strongify(self)
        if (!self || textField.markedTextRange)
            return;
        self.publishQueryChange();
    };
}

-(jobsByVoidBlock _Nonnull)searchButtonEvent{
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
        if (self.resultContentView || self.config.showsCancelButton) {
            self.dismissKeyboard();
        }else{
            self.cancelSearchEditing();
        }
    };
}

-(jobsByBtnBlock _Nonnull)recommendTagButtonEvent{
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
    if (section == JobsOCSearcherSectionHistory)
        return self.historySearches.count ? 48 : CGFLOAT_MIN;
    return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    return self.historySearches.count ? self.historyHeaderView : nil;
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
    cell.applyConfig(self.config);
    @jobs_weakify(self)
    cell.byDeleteBlock(^(__kindof NSString * _Nullable string) {
        @jobs_strongify(self)
        self.deleteHistoryByText(string);
    });
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
    if ([touchView isDescendantOfView:self.emptyStateButton] || [touchView isDescendantOfView:self.searchContainerView] ||
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
        if (self.config.editingDidBeginBlock)
            self.config.editingDidBeginBlock(textField.text ?: @"");
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
        if (!self || textField.markedTextRange)
            return NO;
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
    return ^BOOL(UITextField *textField) {
        @jobs_strongify(self)
        if (!self) return NO;
        self.byQuery(@"", NO);
        return NO;
    };
}
#pragma mark —— lazyLoad
-(UIView *)searchContainerView{
    if (!_searchContainerView) {
        _searchContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
            .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(12)
                .byLayer(^(CALayer * _Nullable layer) {
                    layer
                        .byBorderWidth(0.5)
                        .byBorderColor(RGBA_COLOR(0.86 * 255.0, 0.89 * 255.0, 0.93 * 255.0, 1).CGColor);
                });
        });
    }
    return _searchContainerView;
}

-(UITextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        _textField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(JobsLabelColor)
                .byInputAccessoryView(self.inputAccessoryView)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byLeftView(self.searchIconLeftView())
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byReturnKeyType(UIReturnKeySearch)
                .byDelegate(self);
        });
    }
    return _textField;
}

-(UIButton *)searchButton{
    if (!_searchButton) {
        @jobs_weakify(self)
        _searchButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(14))
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnBgImage(self.searchButtonBackgroundImageWithColor(RGBA_COLOR(0.19 * 255.0, 0.45 * 255.0, 0.84 * 255.0, 1)))
                .jobsResetBtnCornerRadiusValue(12)
                .highlightedStateTitleColorBy(UIColor.whiteColor)
                .disabledStateTitleColorBy(HEXCOLOR(0x435466))
                .highlightedStateBackgroundImageBy(self.searchButtonBackgroundImageWithColor(RGBA_COLOR(0.15 * 255.0, 0.36 * 255.0, 0.70 * 255.0, 1)))
                .disabledStateBackgroundImageBy(self.searchButtonBackgroundImageWithColor(HEXCOLOR(0xE5EBF2)))
                .byContentEdgeInsets(UIEdgeInsetsMake(0, 12, 0, 12))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.searchButtonEvent();
                })
                .byHidden(YES)
                .byClipsToBounds(YES);
        });
    }
    return _searchButton;
}

-(JobsRetImageByCorBlock _Nonnull)searchButtonBackgroundImageWithColor{
    @jobs_weakify(self)
    return ^UIImage *(UIColor * color){
        @jobs_strongify(self)
        if (!self) return nil;
        CGRect rect = CGRectMake(0, 0, 1, 1);
        UIImage *image = JobsRenderImage(rect.size, NO, 0, ^(CGContextRef jobsDrawingContext) {
            [color setFill];
            UIRectFill(rect);
        });
        return image;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)searchIconLeftView{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        return self.searchIconContainerView;
    };
}

-(JobsRetImageByCorBlock _Nonnull)searchIconImageWithColor{
    @jobs_weakify(self)
    return ^UIImage *(UIColor * color){
        @jobs_strongify(self)
        if (!self) return nil;
        CGSize size = CGSizeMake(16, 16);
        UIImage *image = JobsRenderImage(size, NO, 0, ^(CGContextRef jobsDrawingContext) {
            [color setStroke];
            UIBezierPath *circlePath = UIBezierPath.byBezierPathWithOvalInRect(CGRectMake(2.2, 2.2, 8.8, 8.8));
            circlePath.byLineWidth(1.6);
            [circlePath stroke];
            UIBezierPath *handlePath = jobsMakeBezierPath(nil);
            handlePath.byLineWidth(1.8);
            handlePath.byLineCapStyle(kCGLineCapRound);
            [handlePath moveToPoint:CGPointMake(9.4, 9.4)];
            [handlePath addLineToPoint:CGPointMake(13.4, 13.4)];
            [handlePath stroke];
        });
        return image;
    };
}

-(UIView *)recommendSectionView{
    if (!_recommendSectionView) {
        _recommendSectionView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(UIColor.clearColor);
        });
    }
    return _recommendSectionView;
}

-(UILabel *)recommendTitleLabel{
    if (!_recommendTitleLabel) {
        _recommendTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightSemiboldSize(16))
                .byTextCor(JobsLabelColor);
        });
    }
    return _recommendTitleLabel;
}

-(UIView *)recommendTagContainerView{
    if (!_recommendTagContainerView) {
        _recommendTagContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(UIColor.clearColor);
        });
    }
    return _recommendTagContainerView;
}

-(UITapGestureRecognizer *)blankTapGestureRecognizer{
    if (!_blankTapGestureRecognizer) {
        _blankTapGestureRecognizer = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                           action:@selector(blankTapGestureEvent)];
        _blankTapGestureRecognizer.byCancelsTouchesInView(NO);
        _blankTapGestureRecognizer.byDelegate(self);
    }
    return _blankTapGestureRecognizer;
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
           forCellReuseIdentifier:(JobsOCSearcherRecordCell.reuseIdentifier)()];
        if (@available(iOS 15.0, *)) {
            _tableView.bySectionHeaderTopPadding(0);
        }
    }
    return _tableView;
}


#pragma mark —— Shared search state
-(JobsRetStrByStrBlock _Nonnull)identifierBy{
    @jobs_weakify(self)
    return ^NSString *(NSString *suffix) {
        @jobs_strongify(self)
        return [(self.config.accessibilityIdentifierPrefix ?: @"jobs.searcher") stringByAppendingFormat:@".%@", suffix];
    };
}

-(jobsByVoidBlock _Nonnull)captureHistoryContext{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self)
            return;
        NSString *key = self.config.historyStorageKey.length ? self.config.historyStorageKey : @"JobsOCSearcherHistoryData";
        NSString *scope = self.config.historyScope;
        if (scope.length) {
            NSString *encoded = [[scope dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
            key = [key stringByAppendingFormat:@".account.%@", encoded];
        }
        // Snapshot the active context: mutating the same Config must not move old memory into a new account.
        self->_historyContextKey = key.copy;
        self->_historyContextPersists = self.config.persistsHistory;
        self->_historyContextDefaults = self.config.historyDefaults ?: NSUserDefaults.standardUserDefaults;
    };
}

-(JobsRetJobsOCSearcherViewByUIViewBlock _Nonnull)byResultContentView{
    @jobs_weakify(self)
    return ^JobsOCSearcherView *(UIView *view) {
        @jobs_strongify(self)
        if (!self)
            return nil;
        if (self->_resultContentView != view) {
            [self->_resultContentView removeFromSuperview];
            self->_resultContentView = view;
        }
        if (view) {
            view.addOn(self.resultContainerView).byRemake(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.resultContainerView);
            });
        }
        self.refreshPresentation();
        return self;
    };
}

-(JobsRetJobsOCSearcherViewByNSStringBOOLBlock _Nonnull)byQuery{
    @jobs_weakify(self)
    return ^JobsOCSearcherView *(NSString *text, BOOL recordHistory) {
        @jobs_strongify(self)
        if (!self)
            return nil;
        self.textField.byText(text ?: @"");
        self.publishQueryChange();
        if (recordHistory)
            self.saveHistoryByText(self.normalizedQuery);
        return self;
    };
}

-(jobsByVoidBlock _Nonnull)publishQueryChange{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self)
            return;
        NSString *query = self.normalizedTextBy(self.textField.text);
        BOOL changed = ![query isEqualToString:self.normalizedQuery];
        self->_normalizedQuery = query.copy;
        if (changed)
            self->_resultCount = 0;
        self.updateSearchButtonEnabledByText(query);
        self.updateSearchButtonVisible(self.textField.isFirstResponder);
        self.refreshPresentation();
        if (changed && self.config.searchTextDidChangeBlock)
            self.config.searchTextDidChangeBlock(query);
    };
}

-(JobsRetJobsOCSearcherViewByNSUIntegerBlock _Nonnull)byResultCount{
    @jobs_weakify(self)
    return ^JobsOCSearcherView *(NSUInteger count) {
        @jobs_strongify(self)
        if (!self)
            return nil;
        self->_resultCount = count;
        self.refreshPresentation();
        return self;
    };
}

-(JobsRetJobsOCSearcherViewByVoidBlock _Nonnull)focus{
    @jobs_weakify(self)
    return ^JobsOCSearcherView *{
        @jobs_strongify(self)
        if (!self)
            return nil;
        [self.textField becomeFirstResponder];
        return self;
    };
}

-(JobsRetJobsOCSearcherViewByVoidBlock _Nonnull)dismissKeyboard{
    @jobs_weakify(self)
    return ^JobsOCSearcherView *{
        @jobs_strongify(self)
        if (!self)
            return nil;
        [self.textField resignFirstResponder];
        return self;
    };
}

-(jobsByVoidBlock _Nonnull)refreshPresentation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self)
            return;
        if (self.config.inputOnly) {
            self.tableView.byHidden(YES);
            self.resultContainerView.byHidden(YES);
            self.emptyStateView.byHidden(YES);
            self.layoutRecommendSection();
            return;
        }
        BOOL results = self.resultContentView && self.normalizedQuery.length;
        BOOL emptyResults = results && !self.resultCount;
        BOOL emptyHistory = !results && !self.historySearches.count;
        self.tableView.byHidden(results || emptyHistory);
        self.resultContainerView.byHidden(!results || emptyResults);
        self.emptyStateView.byHidden(!(emptyResults || emptyHistory));
        self.layoutRecommendSection();
        if (!(emptyResults || emptyHistory))
            return;
        NSString *title = (emptyResults ? (self.config.emptyResultsTitle ?: @"没有匹配结果") : (self.config.emptyHistoryTitle ?: @"暂无搜索历史")).jobsTr();
        NSString *message = (emptyResults ? (self.config.emptyResultsMessage ?: @"试试其他关键词，或清空后查看搜索历史。") : (self.config.emptyHistoryMessage ?: @"输入关键词开始搜索。")).jobsTr();
        NSString *action = emptyResults ? (self.config.clearQueryButtonTitle ?: @"清空关键词").jobsTr() : @"";
        UIButtonModel *model = jobsMakeButtonModel(^(__kindof UIButtonModel *data) {
            data.byTitle(title ?: @"")
                .bySubTitle(action.length ? [NSString stringWithFormat:@"%@\n\n%@", message ?: @"", action] : (message ?: @""))
                .byTitleFont(UIFontWeightSemiboldSize(18))
                .bySubTitleFont(UIFontWeightRegularSize(15))
                .byTitleCor(self.config.textColor ?: JobsLabelColor)
                .bySubTitleCor(self.config.accentColor ?: (JobsThemeCenter.shared.darkMode ? HEXCOLOR(0x8BC4EB) : HEXCOLOR(0x195E83)))
                .byImagePlacement(NSDirectionalRectEdgeTop)
                .byTitlePadding(8)
                .byTitleLineBreakMode(NSLineBreakByWordWrapping)
                .bySubtitleLineBreakMode(NSLineBreakByWordWrapping)
                .byButtonConfigurationTitleAlignment(UIButtonConfigurationTitleAlignmentCenter)
                .bySubTitleAlignment(NSTextAlignmentCenter)
                .byBaseBackgroundColor(JobsClearColor)
                .byContentInsets(NSDirectionalEdgeInsetsMake(16, 12, 16, 12));
        });
        self.emptyStateButton.resetByButtonModel(model, NO)
            .jobsResetTitleAlignment(UIButtonConfigurationTitleAlignmentCenter)
            .jobsUpdateButtonConfiguration(^(UIButtonConfiguration *configuration) {
                configuration.byTitleLineBreakMode(NSLineBreakByWordWrapping)
                    .bySubtitleLineBreakMode(NSLineBreakByWordWrapping)
                    .byTitlePadding(8)
                    .byContentInsets(NSDirectionalEdgeInsetsMake(16, 12, 16, 12));
            })
            .byTitleLabel(^(__kindof UILabel *label) {
                label.byTextAlignment(NSTextAlignmentCenter)
                    .byNumberOfLines(0)
                    .byLineBreakMode(NSLineBreakByWordWrapping);
            })
            .byAccessibilityLabel(emptyResults ? action : message)
            .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentCenter)
            .byAccessibilityIdentifier(self.identifierBy(@"empty.restore"));
    };
}

#pragma mark —— Shared controls
-(UIView *)resultContainerView{
    if (!_resultContainerView) {
        _resultContainerView = jobsMakeView(^(__kindof UIView *view) {
            view.byBgColor(JobsClearColor);
        });
    }
    return _resultContainerView;
}

-(UIView *)emptyStateView{
    if (!_emptyStateView) {
        _emptyStateView = jobsMakeView(^(__kindof UIView *view) {
            view.byBgColor(JobsClearColor);
        });
        self.emptyStateButton.addOn(_emptyStateView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self->_emptyStateView).offset(72);
            make.centerX.equalTo(self->_emptyStateView);
            make.width.equalTo(self->_emptyStateView).offset(-48);
            make.height.greaterThanOrEqualTo(@144);
            make.bottom.lessThanOrEqualTo(self->_emptyStateView).offset(-16).priority(999);
        });
    }
    return _emptyStateView;
}

-(UIButton *)emptyStateButton{
    if (!_emptyStateButton) {
        @jobs_weakify(self)
        _emptyStateButton = jobsMakeButton(^(__kindof UIButton *button) {
            button.onClickBy(^(UIButton *sender) {
                @jobs_strongify(self)
                self.reloadHistorySearches();
                self.byQuery(@"", NO).focus();
            });
        });
    }
    return _emptyStateButton;
}

-(UIView *)inputAccessoryView{
    if (!_inputAccessoryView) {
        // Only this field suppresses the duplicate IQ toolbar; no global keyboard setting changes.
        _inputAccessoryView = jobsMakeView(^(__kindof UIView *view) {});
    }
    return _inputAccessoryView;
}

-(UIButton *)cancelButton{
    if (!_cancelButton) {
        @jobs_weakify(self)
        _cancelButton = jobsMakeButton(^(__kindof UIButton *button) {
            button.jobsResetBtnTitleFont(UIFontWeightRegularSize(16))
                .jobsResetBtnBgCor(JobsClearColor)
                .byContentEdgeInsets(UIEdgeInsetsMake(0, 8, 0, 8))
                .onClickBy(^(UIButton *sender) {
                    @jobs_strongify(self)
                    self.cancelSearchEditing();
                });
        });
    }
    return _cancelButton;
}

-(UIView *)historyHeaderView{
    if (!_historyHeaderView) {
        _historyHeaderView = jobsMakeView(^(__kindof UIView *view) {});
        self.clearHistoryButton.addOn(_historyHeaderView).byAdd(^(MASConstraintMaker *make) {
            make.right.equalTo(self->_historyHeaderView).offset(-16);
            make.centerY.equalTo(self->_historyHeaderView);
            make.height.mas_equalTo(44);
            make.width.greaterThanOrEqualTo(@44);
        });
        self.historyTitleLabel.addOn(_historyHeaderView).byAdd(^(MASConstraintMaker *make) {
            make.left.equalTo(self->_historyHeaderView).offset(16);
            make.centerY.equalTo(self->_historyHeaderView);
            make.right.lessThanOrEqualTo(self.clearHistoryButton.mas_left).offset(-12);
        });
    }
    return _historyHeaderView;
}

-(UILabel *)historyTitleLabel{
    if (!_historyTitleLabel) {
        _historyTitleLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byFont(UIFontWeightSemiboldSize(17)).byNumberOfLines(1);
        });
    }
    return _historyTitleLabel;
}

-(UIButton *)clearHistoryButton{
    if (!_clearHistoryButton) {
        @jobs_weakify(self)
        _clearHistoryButton = jobsMakeButton(^(__kindof UIButton *button) {
            button.jobsResetBtnTitleFont(UIFontWeightRegularSize(15))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(UIButton *sender) {
                    @jobs_strongify(self)
                    self.clearHistory();
                });
        });
    }
    return _clearHistoryButton;
}

-(UIView *)searchIconContainerView{
    if (!_searchIconContainerView) {
        _searchIconContainerView = jobsMakeView(^(__kindof UIView *view) {
            // UIKit sizes left accessories using Auto Layout; a zero intrinsic width can consume the entire input.
            view.byFrame(CGRectMake(0, 0, 28, 28))
                .byAdd(^(MASConstraintMaker *make) {
                    make.width.height.mas_equalTo(28);
                });
        });
        self.searchIconView.addOn(_searchIconContainerView).byAdd(^(MASConstraintMaker *make) {
            make.centerY.equalTo(self->_searchIconContainerView);
            make.left.equalTo(self->_searchIconContainerView).offset(2);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        });
    }
    return _searchIconContainerView;
}

-(UIImageView *)searchIconView{
    if (!_searchIconView) {
        _searchIconView = jobsMakeImageView(^(__kindof UIImageView *view) {
            view.byContentMode(UIViewContentModeScaleAspectFit);
        });
    }
    return _searchIconView;
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
