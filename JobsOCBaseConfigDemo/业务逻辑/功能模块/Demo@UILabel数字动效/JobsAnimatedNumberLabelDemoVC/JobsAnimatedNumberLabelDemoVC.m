//
//  JobsAnimatedNumberLabelDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月9日，星期四.
//

#import "JobsAnimatedNumberLabelDemoVC.h"
#import <math.h>

@interface JobsAnimatedNumberLabelDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()UILabel *valueLabel;
Prop_strong()UILabel *hintLabel;
Prop_strong()UITextField *startTF;
Prop_strong()UITextField *endTF;
Prop_strong()UIButton *startBtn;
Prop_strong()UIButton *stopBtn;
Prop_assign()CGFloat defaultStart;
Prop_assign()CGFloat defaultEnd;

@end

@implementation JobsAnimatedNumberLabelDemoVC
-(void)dealloc{
    if (_valueLabel) _valueLabel.byStopAnimatedTextNumber();
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
            data.byText(@"UILabel 数字动效".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(JobsLabelColor);
        })
        .byBgCor(JobsWhiteColor)
        .byNavBgCor(JobsWhiteColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.defaultStart = 60;
    self.defaultEnd = 0;
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.contentView.byVisible(YES);
    self.valueLabel.byVisible(YES);
    self.hintLabel.byVisible(YES);
    self.startTF.byVisible(YES);
    self.endTF.byVisible(YES);
    self.startBtn.byVisible(YES);
    self.stopBtn.byVisible(YES);
    [self jobs_syncStartTextToLabel:JobsEmpty];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.valueLabel.byStopAnimatedTextNumber();
}
#pragma mark —— Actions
-(void)jobs_startAnimatedNumber{
    [self.view endEditing:YES];
    [self jobs_filterTextField:self.startTF
                      syncLabel:YES];
    [self jobs_filterTextField:self.endTF
                      syncLabel:NO];
    NSString *startRaw = [self jobs_trimmedText:self.startTF.text ?: JobsEmpty];
    NSString *endRaw = [self jobs_trimmedText:self.endTF.text ?: JobsEmpty];
    if (startRaw.length && ![self jobs_isNumericText:startRaw]) {
        @"起点只能输入数字".tr.toast();
        return;
    }
    if (endRaw.length && ![self jobs_isNumericText:endRaw]) {
        @"终点只能输入数字".tr.toast();
        return;
    }
    CGFloat startValue = [self jobs_valueFromText:startRaw
                                         fallback:self.defaultStart];
    CGFloat endValue = [self jobs_valueFromText:endRaw
                                       fallback:self.defaultEnd];
    NSString *endText = [self jobs_targetTextByValue:endValue];
    self.valueLabel.byStopAnimatedTextNumber();
    UILabel *label = [self.valueLabel byAnimatedTextNumberFrom:@(startValue)
                                                           step:nil
                                                       duration:0.9
                                                minimumInterval:1.0 / 60.0
                                                     completion:nil];
    label.byStartAnimatedTextNumber(endText);
}

-(void)jobs_stopAnimatedNumber{
    self.valueLabel.byStopAnimatedTextNumber();
}

-(void)jobs_startTextChanged{
    [self jobs_filterTextField:self.startTF
                      syncLabel:YES];
}

-(void)jobs_endTextChanged{
    [self jobs_filterTextField:self.endTF
                      syncLabel:NO];
}
#pragma mark —— Private
-(NSString *)jobs_trimmedText:(NSString *)text{
    return [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
}

-(NSString *)jobs_numericTextByFilteringText:(NSString *)text{
    NSMutableString *result = NSMutableString.string;
    BOOL hasDot = NO;
    BOOL hasSign = NO;
    for (NSUInteger idx = 0; idx < text.length; idx++) {
        unichar ch = [text characterAtIndex:idx];
        if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:ch]) {
            [result appendFormat:@"%C",ch];
        }else if (ch == '.' && !hasDot) {
            hasDot = YES;
            [result appendString:@"."];
        }else if (ch == '-' && !hasSign && result.length == 0) {
            hasSign = YES;
            [result appendString:@"-"];
        }
    };return result;
}

-(BOOL)jobs_isNumericText:(NSString *)text{
    NSString *trimmed = [self jobs_trimmedText:text];
    if (!trimmed.length) return NO;
    NSScanner *scanner = [NSScanner scannerWithString:trimmed];
    double value = 0;
    return [scanner scanDouble:&value] && scanner.isAtEnd;
}

-(CGFloat)jobs_valueFromText:(NSString *)text
                    fallback:(CGFloat)fallback{
    if (!text.length) return fallback;
    return (CGFloat)text.doubleValue;
}

-(NSString *)jobs_targetTextByValue:(CGFloat)value{
    if (fabs(value - llround(value)) < 0.0000001) {
        return [NSString stringWithFormat:@"%lld",(long long)llround(value)];
    };return [NSString stringWithFormat:@"%g",value];
}

-(void)jobs_syncStartTextToLabel:(NSString *)text{
    NSString *trimmed = [self jobs_trimmedText:text ?: JobsEmpty];
    if (!trimmed.length) {
        self.valueLabel.byText([self jobs_targetTextByValue:self.defaultStart]);
    }else if ([self jobs_isNumericText:trimmed]) {
        self.valueLabel.byText(trimmed);
    }
}

-(void)jobs_filterTextField:(UITextField *)textField
                  syncLabel:(BOOL)syncLabel{
    NSString *rawText = textField.text ?: JobsEmpty;
    NSString *filteredText = [self jobs_numericTextByFilteringText:rawText];
    if (![filteredText isEqualToString:rawText]) textField.byText(filteredText);
    if (syncLabel) [self jobs_syncStartTextToLabel:filteredText];
}
#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(18))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(18));
                    make.left.equalTo(self.view).offset(JobsWidth(16));
                    make.right.equalTo(self.view).offset(-JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(154));
                });
        });
    };return _contentView;
}

-(UILabel *)valueLabel{
    if (!_valueLabel) {
        _valueLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"60")
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightBoldSize(JobsWidth(62)))
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.contentView);
                    make.top.equalTo(self.contentView).offset(JobsWidth(28));
                    make.height.mas_equalTo(JobsWidth(68));
                });
        });
    };return _valueLabel;
}

-(UILabel *)hintLabel{
    if (!_hintLabel) {
        _hintLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"起点 -> 终点（只允许数字输入）\n不填默认：起点 60，终点 0".tr)
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(15))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView).offset(JobsWidth(18));
                    make.right.equalTo(self.contentView).offset(-JobsWidth(18));
                    make.top.equalTo(self.valueLabel.mas_bottom).offset(JobsWidth(10));
                });
        });
    };return _hintLabel;
}

-(UITextField *)startTF{
    if (!_startTF) {
        @jobs_weakify(self)
        _startTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField.byPlaceholder(@"起点（默认 60）".tr)
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byKeyboardType(UIKeyboardTypeNumbersAndPunctuation)
                .byReturnKeyType(UIReturnKeyDone)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .onJobsEvent(UIControlEventEditingChanged, ^(__kindof UIControl * _Nullable control) {
                    [weak_self jobs_startTextChanged];
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView);
                    make.top.equalTo(self.contentView.mas_bottom).offset(JobsWidth(20));
                    make.height.mas_equalTo(JobsWidth(48));
                });
        });
    };return _startTF;
}

-(UITextField *)endTF{
    if (!_endTF) {
        @jobs_weakify(self)
        _endTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField.byPlaceholder(@"终点（默认 0）".tr)
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byKeyboardType(UIKeyboardTypeNumbersAndPunctuation)
                .byReturnKeyType(UIReturnKeyDone)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .onJobsEvent(UIControlEventEditingChanged, ^(__kindof UIControl * _Nullable control) {
                    [weak_self jobs_endTextChanged];
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.startTF.mas_right).offset(JobsWidth(12));
                    make.right.equalTo(self.contentView);
                    make.top.height.equalTo(self.startTF);
                    make.width.equalTo(self.startTF);
                });
        });
    };return _endTF;
}

-(UIButton *)startBtn{
    if (!_startBtn) {
        @jobs_weakify(self)
        _startBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"启动".tr)
                .jobsResetBtnTitleCor(HEXCOLOR(0xFF375F))
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(18))
                .jobsResetBtnBgCor(HEXCOLOR(0x34C759))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self jobs_startAnimatedNumber];
                })
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(8))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.startTF);
                    make.top.equalTo(self.startTF.mas_bottom).offset(JobsWidth(14));
                    make.height.mas_equalTo(JobsWidth(50));
                });
        });
    };return _startBtn;
}

-(UIButton *)stopBtn{
    if (!_stopBtn) {
        @jobs_weakify(self)
        _stopBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"停止".tr)
                .jobsResetBtnTitleCor(HEXCOLOR(0x007AFF))
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(18))
                .jobsResetBtnBgCor(HEXCOLOR(0xFF8A1F))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self jobs_stopAnimatedNumber];
                })
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(8))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.startBtn.mas_right).offset(JobsWidth(12));
                    make.right.equalTo(self.endTF);
                    make.top.height.width.equalTo(self.startBtn);
                });
        });
    };return _stopBtn;
}

@end
