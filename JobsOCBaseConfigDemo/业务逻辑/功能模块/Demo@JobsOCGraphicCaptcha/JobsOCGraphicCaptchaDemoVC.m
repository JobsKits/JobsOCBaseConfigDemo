//
//  JobsOCGraphicCaptchaDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsOCGraphicCaptchaDemoVC.h"

@interface JobsOCGraphicCaptchaDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()JobsOCGraphicCaptchaView *captchaView;
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

-(jobsByVoidBlock _Nonnull)applyTheme;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCGraphicCaptchaDemoVC
@interface JobsOCGraphicCaptchaDemoVC (JobsPropertyDSLSetterAutogen_f8ceb696df)
-(void)setSelectedOptionBtn:(UIButton * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCGraphicCaptchaDemoVC

@implementation JobsOCGraphicCaptchaDemoVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCGraphicCaptchaDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(@"图形验证码".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .bySubTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsSecondaryLabelColor)
                    .byText(@"阿拉伯数字/英文（区分大小写）/汉字（区分简繁）".jobsTr())
                    .byFont(UIFontWeightRegularSize(11));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
        @jobs_weakify(self)
        [self addNotificationName:JobsThemeDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            self.applyTheme();
        }];
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCGraphicCaptchaDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.gk_navTitleViewBy(self.viewModel);
        [self.gk_navSubTitleLab byTextDisplayMode:JobsLabelTextDisplayModeScrolling
                              minimumScaleFactor:1
                            maximumNumberOfLines:1
                             scrollConfiguration:JobsLabelScrollConfiguration.pingPongConfiguration()];
        self.gk_navSubTitleLab.byStartTextScroll();
        self.contentView.byHidden(NO);
        self.applyTheme();
        self.applyCurrentConfig();
    };
}
#pragma mark —— Actions
-(JobsRetNSUIntegerByJobsOCGraphicCaptchaCharacterUnitBlock _Nonnull)mixedGroupCountByCharacterUnits{
    @jobs_weakify(self)
    return ^NSUInteger(JobsOCGraphicCaptchaCharacterUnit characterUnits){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        NSUInteger count = 0;
        if (characterUnits & JobsOCGraphicCaptchaCharacterUnitUppercaseLetter) count++;
        if (characterUnits & JobsOCGraphicCaptchaCharacterUnitLowercaseLetter) count++;
        if (characterUnits & JobsOCGraphicCaptchaCharacterUnitNumber) count++;
        if (characterUnits & JobsOCGraphicCaptchaCharacterUnitSimplifiedChinese) count++;
        if (characterUnits & JobsOCGraphicCaptchaCharacterUnitTraditionalChinese) count++;
        return count;
    };
}

-(jobsByVoidBlock _Nonnull)applyTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.inputTF
            .byTextCor(JobsLabelColor)
            .byBgColor(JobsTertiarySystemBackgroundColor);
        self.captchaView.byCaptchaBackgroundColor(JobsTertiarySystemBackgroundColor);
        for (UILabel *titleLabel in self.optionTitleLabelMutArr) {
            titleLabel.byTextCor(JobsLabelColor);
        }
        if (self.selectedOptionBtn) self.selectOptionButton(self.selectedOptionBtn);
    };
}

-(jobsByVoidBlock _Nonnull)applyCurrentConfig{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsOCGraphicCaptchaCharacterUnit characterUnits = self.selectedOptionBtn
            ? (JobsOCGraphicCaptchaCharacterUnit)self.selectedOptionBtn.tag
            : JobsOCGraphicCaptchaCharacterUnitUppercaseLetter |
              JobsOCGraphicCaptchaCharacterUnitLowercaseLetter |
              JobsOCGraphicCaptchaCharacterUnitNumber |
              JobsOCGraphicCaptchaCharacterUnitSimplifiedChinese |
              JobsOCGraphicCaptchaCharacterUnitTraditionalChinese;
        NSUInteger groupCount = self.mixedGroupCountByCharacterUnits(characterUnits);
        JobsOCGraphicCaptchaConfig *config = JobsOCGraphicCaptchaConfig.defaultConfig();
        config.byCharacterUnits(characterUnits);
        config.byCaseSensitive(YES);
        config.byMixedGroupCount(groupCount > 1 ? groupCount : 0);
        if (self.lengthStepper.value < groupCount) {
            [self.lengthStepper setValue:groupCount sendActions:NO];
        }
        config.byLength((NSUInteger)self.lengthStepper.value);
        self.captchaView.byConfig(config);
        self.inputTF.byText(@"");
        self.resultLab
            .byText(@"等待输入校验".jobsTr())
            .byTextCor(JobsSecondaryLabelColor);
    };
}

-(jobsByBtnBlock _Nonnull)selectOptionButton{
    @jobs_weakify(self)
    return ^(UIButton * button){
        @jobs_strongify(self)
        if (!self) return;
        if (![self.optionButtonMutArr containsObject:button]) return;
        for (UIButton *optionButton in self.optionButtonMutArr) {
            BOOL selected = optionButton == button;
            optionButton
                .jobsResetBtnTitleCor(selected ? UIColor.whiteColor : JobsLabelColor)
                .jobsResetBtnBgCor(selected ? JobsSystemBlueColor : JobsTertiarySystemBackgroundColor)
                .bySelected(selected);
        }
        self.bySelectedOptionBtn(button);
    };
}

-(jobsByBtnBlock _Nonnull)optionButtonClicked{
    @jobs_weakify(self)
    return ^(UIButton * button){
        @jobs_strongify(self)
        if (!self) return;
        self.selectOptionButton(button);
        self.applyCurrentConfig();
    };
}

-(jobsByVoidBlock _Nonnull)lengthChanged{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.applyCurrentConfig();
    };
}

-(jobsByVoidBlock _Nonnull)refreshCaptcha{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.captchaView.refreshCaptcha();
        self.inputTF.byText(@"");
        self.resultLab
            .byText(@"已刷新".jobsTr())
            .byTextCor(JobsSystemBlueColor);
    };
}

-(jobsByVoidBlock _Nonnull)validateCaptcha{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL passed = self.captchaView.validateInput(self.inputTF.text);
        self.resultLab
            .byText(passed ? @"校验通过".jobsTr() : @"校验失败".jobsTr())
            .byTextCor(passed ? JobsSystemGreenColor : JobsSystemRedColor);
    };
}

-(UIButton *)buttonByTitle:(NSString *)title
                    action:(jobsByBtnBlock)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.jobsTr())
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(JobsSystemBlueColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClickBy(action)
            .byClipsToBounds(YES);
    });
}

-(UIButton *)optionButtonByTitle:(NSString *)title
                  characterUnits:(JobsOCGraphicCaptchaCharacterUnit)characterUnits{
    @jobs_weakify(self)
    UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.jobsTr())
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnBgCor(JobsTertiarySystemBackgroundColor)
            .byContentEdgeInsets(UIEdgeInsetsMake(0, JobsWidth(14), 0, JobsWidth(14)))
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClickBy(^(__kindof UIButton * _Nullable button) {
                weak_self.optionButtonClicked(button);
            })
            .byTag(characterUnits)
            .byClipsToBounds(YES);
    });
    self.optionButtonMutArr.add(button);
    return button;
}

-(JobsRetNSArrayNSArrayByVoidBlock _Nonnull)captchaUnitOptions{
    @jobs_weakify(self)
    return ^NSArray<NSArray *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            @[@"英文大写",@(JobsOCGraphicCaptchaCharacterUnitUppercaseLetter)],
            @[@"英文小写",@(JobsOCGraphicCaptchaCharacterUnitLowercaseLetter)],
            @[@"阿拉伯数字",@(JobsOCGraphicCaptchaCharacterUnitNumber)],
            @[@"简体汉字",@(JobsOCGraphicCaptchaCharacterUnitSimplifiedChinese)],
            @[@"繁体汉字",@(JobsOCGraphicCaptchaCharacterUnitTraditionalChinese)]
        ];
    };
}

-(JobsRetNSArrayNSArrayByNSUIntegerBlock _Nonnull)optionsByGroupCount{
    @jobs_weakify(self)
    return ^NSArray<NSArray *> *(NSUInteger groupCount){
        @jobs_strongify(self)
        if (!self) return nil;
        NSArray<NSArray *> *unitOptions = self.captchaUnitOptions();
        NSMutableArray<NSArray *> *options = NSMutableArray.array;
        NSUInteger combinationCount = 1 << unitOptions.count;
        for (NSUInteger mask = 1; mask < combinationCount; mask++) {
            NSUInteger selectedCount = 0;
            for (NSUInteger index = 0; index < unitOptions.count; index++) {
                if (mask & (1 << index)) selectedCount++;
            }
            if (selectedCount != groupCount) continue;
            NSMutableArray<NSString *> *titles = NSMutableArray.array;
            JobsOCGraphicCaptchaCharacterUnit characterUnits = 0;
            for (NSUInteger index = 0; index < unitOptions.count; index++) {
                if (!(mask & (1 << index))) continue;
                NSArray *unitOption = unitOptions[index];
                [titles addObject:unitOption.firstObject];
                characterUnits |= (JobsOCGraphicCaptchaCharacterUnit)[unitOption.lastObject unsignedIntegerValue];
            }
            [options addObject:@[[titles componentsJoinedByString:@" + "],@(characterUnits)]];
        };return options.copy;
    };
}

-(JobsRetUIScrollViewByNSArrayNSArrayBlock _Nonnull)optionScrollViewByOptions{
    @jobs_weakify(self)
    return ^UIScrollView *(NSArray<NSArray *> * options){
        @jobs_strongify(self)
        if (!self) return nil;
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
            stackView
                .byAxis(UILayoutConstraintAxisHorizontal)
                .byDistribution(UIStackViewDistributionFill)
                .byAlignment(UIStackViewAlignmentFill)
                .bySpacing(JobsWidth(8));
        });
        self.optionStackViewMutArr.add(stackView);
        for (NSArray *optionData in options) {
            stackView.byAddArrangedSubview([self optionButtonByTitle:optionData.firstObject
                                                     characterUnits:(JobsOCGraphicCaptchaCharacterUnit)[optionData.lastObject unsignedIntegerValue]]);
        }
        stackView
            .addOn(scrollView)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(scrollView);
                make.height.equalTo(scrollView);
            });
        return scrollView;
    };
}

-(jobsByViewBlock _Nonnull)buildOptionRowsInView{
    @jobs_weakify(self)
    return ^(UIView * view){
        @jobs_strongify(self)
        if (!self) return;
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
            [optionGroups addObject:@[title,self.optionsByGroupCount(index + 1)]];
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
                    .byText(title.jobsTr())
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightMediumSize(13))
                    .byTextAlignment(NSTextAlignmentLeft);
            });
            self.optionTitleLabelMutArr.add(titleLabel);
            UIScrollView *row = self.optionScrollViewByOptions(options);
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
    };
}
#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(28));
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

-(JobsOCGraphicCaptchaView *)captchaView{
    if (!_captchaView) {
        @jobs_weakify(self)
        _captchaView = JobsOCGraphicCaptchaView.new;
        _captchaView.byCaptchaBackgroundColor(JobsTertiarySystemBackgroundColor);
        _captchaView.byFont(UIFontWeightSemiboldSize(24));
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
        self.buildOptionRowsInView(_optionRowsView);
        self.selectOptionButton(self.optionButtonMutArr.lastObject);
    };return _optionRowsView;
}

-(NSMutableArray<UIButton *> *)optionButtonMutArr{
    if (!_optionButtonMutArr) {
        _optionButtonMutArr = NSMutableArray.array;
    };return _optionButtonMutArr;
}

-(NSMutableArray<UIScrollView *> *)optionScrollViewMutArr{
    if (!_optionScrollViewMutArr) {
        _optionScrollViewMutArr = NSMutableArray.array;
    };return _optionScrollViewMutArr;
}

-(NSMutableArray<UIView *> *)optionRowViewMutArr{
    if (!_optionRowViewMutArr) {
        _optionRowViewMutArr = NSMutableArray.array;
    };return _optionRowViewMutArr;
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
                .byText(@"长度：".jobsTr())
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
            weak_self.lengthChanged();
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
                .byPlaceholder(@"输入图形验证码".jobsTr())
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
                .byTintColor(JobsSystemBlueColor)
                .byBgColor(JobsTertiarySystemBackgroundColor)
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
            weak_self.refreshCaptcha();
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
            weak_self.validateCaptcha();
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCGraphicCaptchaDemoVC
-(JobsRetJobsOCGraphicCaptchaDemoVCByUIButtonBlock _Nonnull)bySelectedOptionBtn{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaDemoVC * _Nullable(UIButton * _Nullable data){
        @jobs_strongify(self)
        [self setSelectedOptionBtn:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCGraphicCaptchaDemoVC
@end
