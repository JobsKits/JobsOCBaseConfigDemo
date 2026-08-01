//
//  JobsGraphicCaptchaDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsGraphicCaptchaDemoVC.h"

@interface JobsGraphicCaptchaDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()JobsGraphicCaptchaView *captchaView;
Prop_strong()UIView *optionRowsView;
Prop_strong()NSMutableArray <UIButton *>*optionButtonMutArr;
Prop_strong()NSMutableArray <UIView *>*optionRowViewMutArr;
Prop_strong()NSMutableArray <UIScrollView *>*optionScrollViewMutArr;
Prop_strong()NSMutableArray <UIStackView *>*optionStackViewMutArr;
Prop_strong()NSMutableArray <UILabel *>*optionTitleLabelMutArr;
Prop_strong()UIButton *selectedOptionBtn;
Prop_strong()UILabel *lengthLab;
Prop_strong()JobsOCNumberStepper *lengthStepper;
Prop_strong()UITextField *inputTF;
Prop_strong()UIButton *refreshBtn;
Prop_strong()UIButton *validateBtn;
Prop_strong()UILabel *resultLab;

@end

@implementation JobsGraphicCaptchaDemoVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byTextCor(JobsLabelColor)
                .byText(@"JobsGraphicCaptcha")
                .byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.contentView.byHidden(NO);
    [self applyCurrentConfig];
}
#pragma mark —— Actions
-(NSUInteger)mixedGroupCountByCharacterUnits:(JobsGraphicCaptchaCharacterUnit)characterUnits{
    NSUInteger count = 0;
    if (characterUnits & JobsGraphicCaptchaCharacterUnitUppercaseLetter) count++;
    if (characterUnits & JobsGraphicCaptchaCharacterUnitLowercaseLetter) count++;
    if (characterUnits & JobsGraphicCaptchaCharacterUnitNumber) count++;
    if (characterUnits & JobsGraphicCaptchaCharacterUnitSimplifiedChinese) count++;
    if (characterUnits & JobsGraphicCaptchaCharacterUnitTraditionalChinese) count++;
    return count;
}

-(void)applyCurrentConfig{
    JobsGraphicCaptchaCharacterUnit characterUnits = self.selectedOptionBtn
        ? (JobsGraphicCaptchaCharacterUnit)self.selectedOptionBtn.tag
        : JobsGraphicCaptchaCharacterUnitUppercaseLetter |
          JobsGraphicCaptchaCharacterUnitLowercaseLetter |
          JobsGraphicCaptchaCharacterUnitNumber |
          JobsGraphicCaptchaCharacterUnitSimplifiedChinese |
          JobsGraphicCaptchaCharacterUnitTraditionalChinese;
    NSUInteger groupCount = [self mixedGroupCountByCharacterUnits:characterUnits];
    JobsGraphicCaptchaConfig *config = JobsGraphicCaptchaConfig.defaultConfig;
    config.characterUnits = characterUnits;
    config.caseSensitive = YES;
    config.mixedGroupCount = groupCount > 1 ? groupCount : 0;
    if (self.lengthStepper.value < groupCount) {
        [self.lengthStepper setValue:groupCount sendActions:NO];
    }
    config.length = (NSUInteger)self.lengthStepper.value;
    self.captchaView.config = config;
    self.inputTF.byText(@"");
    self.resultLab
        .byText(@"等待输入校验".tr)
        .byTextCor(JobsSecondaryLabelColor);
}

-(void)selectOptionButton:(UIButton *)button{
    if (![self.optionButtonMutArr containsObject:button]) return;
    for (UIButton *optionButton in self.optionButtonMutArr) {
        BOOL selected = optionButton == button;
        optionButton
            .jobsResetBtnTitleCor(selected ? UIColor.whiteColor : JobsLabelColor)
            .jobsResetBtnBgCor(selected ? HEXCOLOR(0x1D7FF2) : HEXCOLOR(0xEEF1F5))
            .bySelected(selected);
    }
    self.selectedOptionBtn = button;
}

-(void)optionButtonClicked:(UIButton *)button{
    [self selectOptionButton:button];
    [self applyCurrentConfig];
}

-(void)lengthChanged{
    [self applyCurrentConfig];
}

-(void)refreshCaptcha{
    [self.captchaView refreshCaptcha];
    self.inputTF.byText(@"");
    self.resultLab
        .byText(@"已刷新".tr)
        .byTextCor(HEXCOLOR(0x1D7FF2));
}

-(void)validateCaptcha{
    BOOL passed = [self.captchaView validateInput:self.inputTF.text];
    self.resultLab
        .byText(passed ? @"校验通过".tr : @"校验失败".tr)
        .byTextCor(passed ? HEXCOLOR(0x159947) : HEXCOLOR(0xD14343));
}

-(UIButton *)buttonByTitle:(NSString *)title
                    action:(jobsByBtnBlock)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(HEXCOLOR(0x263342))
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClickBy(action)
            .byClipsToBounds(YES);
    });
}

-(UIButton *)optionButtonByTitle:(NSString *)title
                  characterUnits:(JobsGraphicCaptchaCharacterUnit)characterUnits{
    @jobs_weakify(self)
    UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .normalStateTitleColorBy(HEXCOLOR(0x4B5563))
            .highlightedStateTitleColorBy(HEXCOLOR(0x1D7FF2))
            .selectedStateTitleColorBy(UIColor.whiteColor)
            .titleColorForStateBy(UIColor.whiteColor, UIControlStateSelected | UIControlStateHighlighted)
            .normalStateBackgroundImageBy(HEXCOLOR(0xEEF1F5).image)
            .highlightedStateBackgroundImageBy(HEXCOLOR(0xDCE9F8).image)
            .selectedStateBackgroundImageBy(HEXCOLOR(0x1D7FF2).image)
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClickBy(^(__kindof UIButton * _Nullable button) {
                [weak_self optionButtonClicked:button];
            })
            .byContentEdgeInsets(UIEdgeInsetsMake(0, JobsWidth(14), 0, JobsWidth(14)))
            .byTag(characterUnits)
            .byClipsToBounds(YES);
        [button setBackgroundImage:HEXCOLOR(0x166BCC).image
                         forState:UIControlStateSelected | UIControlStateHighlighted];
    });
    self.optionButtonMutArr.add(button);
    return button;
}

-(NSArray<NSArray *> *)captchaUnitOptions{
    return @[
        @[@"英文大写",@(JobsGraphicCaptchaCharacterUnitUppercaseLetter)],
        @[@"英文小写",@(JobsGraphicCaptchaCharacterUnitLowercaseLetter)],
        @[@"阿拉伯数字",@(JobsGraphicCaptchaCharacterUnitNumber)],
        @[@"简体汉字",@(JobsGraphicCaptchaCharacterUnitSimplifiedChinese)],
        @[@"繁体汉字",@(JobsGraphicCaptchaCharacterUnitTraditionalChinese)]
    ];
}

-(NSArray<NSArray *> *)optionsByGroupCount:(NSUInteger)groupCount{
    NSArray<NSArray *> *unitOptions = self.captchaUnitOptions;
    NSMutableArray<NSArray *> *options = NSMutableArray.array;
    NSUInteger combinationCount = 1 << unitOptions.count;
    for (NSUInteger mask = 1; mask < combinationCount; mask++) {
        NSUInteger selectedCount = 0;
        for (NSUInteger index = 0; index < unitOptions.count; index++) {
            if (mask & (1 << index)) selectedCount++;
        }
        if (selectedCount != groupCount) continue;
        NSMutableArray<NSString *> *titles = NSMutableArray.array;
        JobsGraphicCaptchaCharacterUnit characterUnits = 0;
        for (NSUInteger index = 0; index < unitOptions.count; index++) {
            if (!(mask & (1 << index))) continue;
            NSArray *unitOption = unitOptions[index];
            [titles addObject:unitOption.firstObject];
            characterUnits |= (JobsGraphicCaptchaCharacterUnit)[unitOption.lastObject unsignedIntegerValue];
        }
        [options addObject:@[[titles componentsJoinedByString:@" + "],@(characterUnits)]];
    };return options.copy;
}

-(UIScrollView *)optionScrollViewByOptions:(NSArray<NSArray *> *)options{
    UIScrollView *scrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
        scrollView
            .byAlwaysBounceHorizontal(YES)
            .byAlwaysBounceVertical(NO)
            .byBounces(YES)
            .byShowsHorizontalScrollIndicator(NO)
            .byShowsVerticalScrollIndicator(NO)
            .byDirectionalLockEnabled(YES)
            .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
    });
    self.optionScrollViewMutArr.add(scrollView);
    UIStackView *stackView = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = UIStackViewDistributionFill;
        stackView.alignment = UIStackViewAlignmentFill;
        stackView.spacing = JobsWidth(8);
    });
    self.optionStackViewMutArr.add(stackView);
    for (NSArray *optionData in options) {
        [stackView addArrangedSubview:[self optionButtonByTitle:optionData.firstObject
                                                characterUnits:(JobsGraphicCaptchaCharacterUnit)[optionData.lastObject unsignedIntegerValue]]];
    }
    stackView
        .addOn(scrollView)
        .byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
            make.height.equalTo(scrollView);
        });
    return scrollView;
}

-(void)buildOptionRowsInView:(UIView *)view{
    [self.optionRowViewMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.optionRowViewMutArr removeAllObjects];
    [self.optionScrollViewMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.optionScrollViewMutArr removeAllObjects];
    [self.optionStackViewMutArr removeAllObjects];
    [self.optionTitleLabelMutArr removeAllObjects];
    [self.optionButtonMutArr removeAllObjects];
    NSArray<NSString *> *groupTitles = @[@"单个演示",@"两两混合",@"三三混合",@"四四混合",@"全部混合"];
    NSMutableArray<NSArray *> *optionGroups = NSMutableArray.array;
    [groupTitles enumerateObjectsUsingBlock:^(NSString *title,
                                               NSUInteger index,
                                               BOOL *stop) {
        [optionGroups addObject:@[title,[self optionsByGroupCount:index + 1]]];
    }];
    __block UIView *previousRow = nil;
    [optionGroups enumerateObjectsUsingBlock:^(NSArray * _Nonnull group,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
        NSString *title = group.firstObject;
        NSArray<NSArray *> *options = group.lastObject;
        UIView *rowView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(UIColor.clearColor);
        });
        self.optionRowViewMutArr.add(rowView);
        UILabel *titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(title.tr)
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(13))
                .byTextAlignment(NSTextAlignmentLeft);
        });
        self.optionTitleLabelMutArr.add(titleLabel);
        UIScrollView *row = [self optionScrollViewByOptions:options];
        rowView
            .addOn(view)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(view);
                make.height.mas_equalTo(JobsWidth(34));
                if (previousRow) {
                    make.top.equalTo(previousRow.mas_bottom).offset(JobsWidth(10));
                }else{
                    make.top.equalTo(view);
                }
                if (idx == optionGroups.count - 1) make.bottom.equalTo(view);
            });
        titleLabel
            .addOn(rowView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(rowView);
                make.width.mas_equalTo(JobsWidth(72));
            });
        row
            .addOn(rowView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(titleLabel.mas_right).offset(JobsWidth(8));
                make.top.right.bottom.equalTo(rowView);
            });
        previousRow = rowView;
    }];
}
#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(28));
                });
        });
        self.captchaView.byHidden(NO);
        self.optionRowsView.byHidden(NO);
        self.lengthLab.byHidden(NO);
        self.lengthStepper.byHidden(NO);
        self.inputTF.byHidden(NO);
        self.refreshBtn.byHidden(NO);
        self.validateBtn.byHidden(NO);
        self.resultLab.byHidden(NO);
    };return _contentView;
}

-(JobsGraphicCaptchaView *)captchaView{
    if (!_captchaView) {
        @jobs_weakify(self)
        _captchaView = JobsGraphicCaptchaView.new;
        _captchaView.captchaBackgroundColor = HEXCOLOR(0xFFF7EA);
        _captchaView.font = UIFontWeightSemiboldSize(24);
        _captchaView.refreshBlock = ^(NSString *captchaText) {
            JobsLog(@"当前图形验证码 = %@",captchaText);
        };
        _captchaView.addOn(self.contentView);
        [_captchaView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.contentView).offset(JobsWidth(22));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(88));
        }];
        _captchaView.layer
            .byCornerRadius(JobsWidth(8))
            .byMasksToBounds(YES);
    };return _captchaView;
}

-(UIView *)optionRowsView{
    if (!_optionRowsView) {
        @jobs_weakify(self)
        _optionRowsView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.captchaView.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(210));
                });
        });
        [self buildOptionRowsInView:_optionRowsView];
        [self selectOptionButton:self.optionButtonMutArr.lastObject];
    };return _optionRowsView;
}

-(NSMutableArray<UIButton *> *)optionButtonMutArr{
    if (!_optionButtonMutArr) {
        _optionButtonMutArr = NSMutableArray.array;
    };return _optionButtonMutArr;
}

-(NSMutableArray<UIView *> *)optionRowViewMutArr{
    if (!_optionRowViewMutArr) {
        _optionRowViewMutArr = NSMutableArray.array;
    };return _optionRowViewMutArr;
}

-(NSMutableArray<UIScrollView *> *)optionScrollViewMutArr{
    if (!_optionScrollViewMutArr) {
        _optionScrollViewMutArr = NSMutableArray.array;
    };return _optionScrollViewMutArr;
}

-(NSMutableArray<UIStackView *> *)optionStackViewMutArr{
    if (!_optionStackViewMutArr) {
        _optionStackViewMutArr = NSMutableArray.array;
    };return _optionStackViewMutArr;
}

-(NSMutableArray<UILabel *> *)optionTitleLabelMutArr{
    if (!_optionTitleLabelMutArr) {
        _optionTitleLabelMutArr = NSMutableArray.array;
    };return _optionTitleLabelMutArr;
}

-(UILabel *)lengthLab{
    if (!_lengthLab) {
        @jobs_weakify(self)
        _lengthLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"长度：".tr)
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightRegularSize(15))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.equalTo(self.contentView).offset(JobsWidth(22));
                    make.top.equalTo(self.optionRowsView.mas_bottom).offset(JobsWidth(18));
                    make.height.mas_equalTo(JobsWidth(32));
                });
        });
    };return _lengthLab;
}

-(JobsOCNumberStepper *)lengthStepper{
    if (!_lengthStepper) {
        @jobs_weakify(self)
        _lengthStepper = JobsOCNumberStepper.new;
        [_lengthStepper configureWithValue:4
                              minimumValue:@4
                              maximumValue:@8
                                  stepValue:1];
        _lengthStepper.onJobsChange(^(__kindof UIControl * _Nullable control) {
            [weak_self lengthChanged];
        });
        _lengthStepper.addOn(self.contentView);
        [_lengthStepper mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.right.equalTo(self.contentView).offset(-JobsWidth(22));
            make.centerY.equalTo(self.lengthLab);
            make.width.mas_equalTo(JobsWidth(170));
            make.height.mas_equalTo(JobsWidth(44));
        }];
    };return _lengthStepper;
}

-(UITextField *)inputTF{
    if (!_inputTF) {
        @jobs_weakify(self)
        _inputTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byPlaceholder(@"输入图形验证码".tr)
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightRegularSize(16))
                .byBorderStyle(UITextBorderStyleNone)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byAutocorrectionType(UITextAutocorrectionTypeNo)
                .byAutocapitalizationType(UITextAutocapitalizationTypeNone)
                .byLeftView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byFrame(CGRectMake(0, 0, JobsWidth(14), 1));
                }))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byTintColor(HEXCOLOR(0x1D7FF2))
                .byBgColor(HEXCOLOR(0xF0F3F7))
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer.byCornerRadius(JobsWidth(8));
                })
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.lengthLab.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(46));
                });
        });
    };return _inputTF;
}

-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        @jobs_weakify(self)
        _refreshBtn = [self buttonByTitle:@"刷新"
                                    action:^(__kindof UIButton * _Nullable button) {
            [weak_self refreshCaptcha];
        }];
        _refreshBtn.addOn(self.contentView);
        [_refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.inputTF.mas_bottom).offset(JobsWidth(18));
            make.left.equalTo(self.contentView).offset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(42));
        }];
    };return _refreshBtn;
}

-(UIButton *)validateBtn{
    if (!_validateBtn) {
        @jobs_weakify(self)
        _validateBtn = [self buttonByTitle:@"校验"
                                     action:^(__kindof UIButton * _Nullable button) {
            [weak_self validateCaptcha];
        }];
        _validateBtn.addOn(self.contentView);
        [_validateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.width.height.equalTo(self.refreshBtn);
            make.left.equalTo(self.refreshBtn.mas_right).offset(JobsWidth(14));
            make.right.equalTo(self.contentView).offset(-JobsWidth(22));
        }];
    };return _validateBtn;
}

-(UILabel *)resultLab{
    if (!_resultLab) {
        @jobs_weakify(self)
        _resultLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightMediumSize(15))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.refreshBtn.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.bottom.equalTo(self.contentView).offset(-JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(24));
                });
        });
    };return _resultLab;
}

@end
