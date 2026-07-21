//
//  JobsOCGraphicCaptchaDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsOCGraphicCaptchaDemoVC.h"

typedef NS_ENUM(NSInteger, JobsOCGraphicCaptchaOption) {
    JobsOCGraphicCaptchaOptionLetterCaseSensitive,
    JobsOCGraphicCaptchaOptionLetterCaseInsensitive,
    JobsOCGraphicCaptchaOptionNumber,
    JobsOCGraphicCaptchaOptionChinese,
    JobsOCGraphicCaptchaOptionUppercaseLowercase,
    JobsOCGraphicCaptchaOptionUppercaseNumber,
    JobsOCGraphicCaptchaOptionUppercaseChinese,
    JobsOCGraphicCaptchaOptionLowercaseNumber,
    JobsOCGraphicCaptchaOptionLowercaseChinese,
    JobsOCGraphicCaptchaOptionNumberChinese,
    JobsOCGraphicCaptchaOptionUppercaseLowercaseNumber,
    JobsOCGraphicCaptchaOptionUppercaseLowercaseChinese,
    JobsOCGraphicCaptchaOptionUppercaseNumberChinese,
    JobsOCGraphicCaptchaOptionLowercaseNumberChinese,
    JobsOCGraphicCaptchaOptionAll
};

@interface JobsOCGraphicCaptchaDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()JobsOCGraphicCaptchaView *captchaView;
Prop_strong()UIView *optionRowsView;
Prop_strong()NSMutableArray <UIButton *>*optionButtonMutArr;
Prop_strong()UIButton *selectedOptionBtn;
Prop_strong()UILabel *lengthLab;
Prop_strong()UIStepper *lengthStepper;
Prop_strong()UITextField *inputTF;
Prop_strong()UIButton *refreshBtn;
Prop_strong()UIButton *validateBtn;
Prop_strong()UILabel *resultLab;

@end

@implementation JobsOCGraphicCaptchaDemoVC
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
            data.byTextCor(HEXCOLOR(0x263342));
            data.byText(@"JobsOCGraphicCaptcha");
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.contentView.byHidden(NO);
    [self applyCurrentConfig];
}
#pragma mark —— Actions
-(JobsOCGraphicCaptchaCharacterUnit)characterUnitsByOption:(JobsOCGraphicCaptchaOption)option{
    switch (option) {
        case JobsOCGraphicCaptchaOptionUppercaseLowercase:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitLowercaseLetter;
        case JobsOCGraphicCaptchaOptionUppercaseNumber:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber;
        case JobsOCGraphicCaptchaOptionUppercaseChinese:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitChinese;
        case JobsOCGraphicCaptchaOptionLowercaseNumber:
            return JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber;
        case JobsOCGraphicCaptchaOptionLowercaseChinese:
            return JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitChinese;
        case JobsOCGraphicCaptchaOptionNumberChinese:
            return JobsOCGraphicCaptchaCharacterUnitNumber | JobsOCGraphicCaptchaCharacterUnitChinese;
        case JobsOCGraphicCaptchaOptionUppercaseLowercaseNumber:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber;
        case JobsOCGraphicCaptchaOptionUppercaseLowercaseChinese:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitChinese;
        case JobsOCGraphicCaptchaOptionUppercaseNumberChinese:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber | JobsOCGraphicCaptchaCharacterUnitChinese;
        case JobsOCGraphicCaptchaOptionLowercaseNumberChinese:
            return JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber | JobsOCGraphicCaptchaCharacterUnitChinese;
        case JobsOCGraphicCaptchaOptionAll:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter |
                   JobsOCGraphicCaptchaCharacterUnitLowercaseLetter |
                   JobsOCGraphicCaptchaCharacterUnitNumber |
                   JobsOCGraphicCaptchaCharacterUnitChinese;
        default:
            break;
    };return 0;
}

-(NSUInteger)mixedGroupCountByCharacterUnits:(JobsOCGraphicCaptchaCharacterUnit)characterUnits{
    NSUInteger count = 0;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitUppercaseLetter) count++;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitLowercaseLetter) count++;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitNumber) count++;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitChinese) count++;
    return count;
}

-(void)applyCurrentConfig{
    JobsOCGraphicCaptchaConfig *config = nil;
    JobsOCGraphicCaptchaOption option = self.selectedOptionBtn
        ? (JobsOCGraphicCaptchaOption)self.selectedOptionBtn.tag
        : JobsOCGraphicCaptchaOptionAll;
    JobsOCGraphicCaptchaCharacterUnit mixedUnits = [self characterUnitsByOption:option];
    NSUInteger mixedGroupCount = [self mixedGroupCountByCharacterUnits:mixedUnits];
    if (mixedGroupCount) {
        config = JobsOCGraphicCaptchaConfig.defaultConfig;
        config.characterUnits = mixedUnits;
        config.caseSensitive = YES;
        config.mixedGroupCount = mixedGroupCount;
        if (self.lengthStepper.value < mixedGroupCount) {
            self.lengthStepper.value = mixedGroupCount;
        }
    } else {
        switch (option) {
            case JobsOCGraphicCaptchaOptionLetterCaseSensitive:
                config = JobsOCGraphicCaptchaConfig.letterCaseSensitiveConfig;
                break;
            case JobsOCGraphicCaptchaOptionLetterCaseInsensitive:
                config = JobsOCGraphicCaptchaConfig.letterCaseInsensitiveConfig;
                break;
            case JobsOCGraphicCaptchaOptionNumber:
                config = JobsOCGraphicCaptchaConfig.numberConfig;
                break;
            case JobsOCGraphicCaptchaOptionChinese:
                config = JobsOCGraphicCaptchaConfig.chineseConfig;
                break;
            default:
                config = JobsOCGraphicCaptchaConfig.defaultConfig;
                break;
        }
    }
    config.length = (NSUInteger)self.lengthStepper.value;
    self.lengthLab.byText([NSString stringWithFormat:@"长度：%.0f",self.lengthStepper.value]);
    self.captchaView.config = config;
    self.inputTF.byText(@"");
    self.resultLab
        .byText(@"等待输入校验".tr)
        .byTextCor(HEXCOLOR(0x6B7280));
}

-(void)selectOptionButton:(UIButton *)button{
    if (![self.optionButtonMutArr containsObject:button]) return;
    for (UIButton *optionButton in self.optionButtonMutArr) {
        BOOL selected = optionButton == button;
        optionButton
            .jobsResetBtnTitleCor(selected ? UIColor.whiteColor : HEXCOLOR(0x4B5563))
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
                    action:(SEL)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(HEXCOLOR(0x263342))
            .byAddTarget(self, action, UIControlEventTouchUpInside)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(8))
                    .byMasksToBounds(YES);
            });
    });
}

-(UIButton *)optionButtonByTitle:(NSString *)title
                          option:(JobsOCGraphicCaptchaOption)option{
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
            .backgroundImageForStateBy(HEXCOLOR(0x166BCC).image, UIControlStateSelected | UIControlStateHighlighted)
            .byContentEdgeInsets(UIEdgeInsetsMake(0, JobsWidth(14), 0, JobsWidth(14)))
            .byAddTarget(self, @selector(optionButtonClicked:), UIControlEventTouchUpInside)
            .byTag(option)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(8))
                    .byMasksToBounds(YES);
            });
    });
    self.optionButtonMutArr.add(button);
    return button;
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
    UIStackView *stackView = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
        stackView
            .byAxis(UILayoutConstraintAxisHorizontal)
            .byDistribution(UIStackViewDistributionFill)
            .byAlignment(UIStackViewAlignmentFill)
            .bySpacing(JobsWidth(8));
    });
    for (NSArray *optionData in options) {
        stackView.byAddArrangedSubview([self optionButtonByTitle:optionData.firstObject
                                                         option:(JobsOCGraphicCaptchaOption)[optionData.lastObject integerValue]]);
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
    NSArray<NSArray<NSArray *> *> *optionGroups = @[
        @[
            @[@"字母（区分大小写）",@(JobsOCGraphicCaptchaOptionLetterCaseSensitive)],
            @[@"字母（不区分大小写）",@(JobsOCGraphicCaptchaOptionLetterCaseInsensitive)],
            @[@"仅数字",@(JobsOCGraphicCaptchaOptionNumber)],
            @[@"仅汉字",@(JobsOCGraphicCaptchaOptionChinese)]
        ],
        @[
            @[@"大写字母 + 小写字母",@(JobsOCGraphicCaptchaOptionUppercaseLowercase)],
            @[@"大写字母 + 数字",@(JobsOCGraphicCaptchaOptionUppercaseNumber)],
            @[@"大写字母 + 汉字",@(JobsOCGraphicCaptchaOptionUppercaseChinese)],
            @[@"小写字母 + 数字",@(JobsOCGraphicCaptchaOptionLowercaseNumber)],
            @[@"小写字母 + 汉字",@(JobsOCGraphicCaptchaOptionLowercaseChinese)],
            @[@"数字 + 汉字",@(JobsOCGraphicCaptchaOptionNumberChinese)]
        ],
        @[
            @[@"大写字母 + 小写字母 + 数字",@(JobsOCGraphicCaptchaOptionUppercaseLowercaseNumber)],
            @[@"大写字母 + 小写字母 + 汉字",@(JobsOCGraphicCaptchaOptionUppercaseLowercaseChinese)],
            @[@"大写字母 + 数字 + 汉字",@(JobsOCGraphicCaptchaOptionUppercaseNumberChinese)],
            @[@"小写字母 + 数字 + 汉字",@(JobsOCGraphicCaptchaOptionLowercaseNumberChinese)]
        ],
        @[
            @[@"大写字母 + 小写字母 + 数字 + 汉字",@(JobsOCGraphicCaptchaOptionAll)]
        ]
    ];
    __block UIView *previousRow = nil;
    [optionGroups enumerateObjectsUsingBlock:^(NSArray<NSArray *> * _Nonnull options,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
        UIScrollView *row = [self optionScrollViewByOptions:options];
        row
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
        previousRow = row;
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

-(JobsOCGraphicCaptchaView *)captchaView{
    if (!_captchaView) {
        @jobs_weakify(self)
        _captchaView = JobsOCGraphicCaptchaView.new;
        _captchaView.captchaBackgroundColor = HEXCOLOR(0xFFF7EA);
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
                    make.height.mas_equalTo(JobsWidth(166));
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

-(UILabel *)lengthLab{
    if (!_lengthLab) {
        @jobs_weakify(self)
        _lengthLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(HEXCOLOR(0x263342))
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

-(UIStepper *)lengthStepper{
    if (!_lengthStepper) {
        @jobs_weakify(self)
        _lengthStepper = UIStepper.new;
        _lengthStepper.minimumValue = 1;
        _lengthStepper.maximumValue = 8;
        _lengthStepper.value = 4;
        _lengthStepper.byAddTarget(self, @selector(lengthChanged), UIControlEventValueChanged);
        _lengthStepper.addOn(self.contentView);
        [_lengthStepper mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.right.equalTo(self.contentView).offset(-JobsWidth(22));
            make.centerY.equalTo(self.lengthLab);
        }];
    };return _lengthStepper;
}

-(UITextField *)inputTF{
    if (!_inputTF) {
        @jobs_weakify(self)
        _inputTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byPlaceholder(@"输入图形验证码".tr)
                .byTextCor(HEXCOLOR(0x263342))
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
                                    action:@selector(refreshCaptcha)];
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
                                     action:@selector(validateCaptcha)];
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
