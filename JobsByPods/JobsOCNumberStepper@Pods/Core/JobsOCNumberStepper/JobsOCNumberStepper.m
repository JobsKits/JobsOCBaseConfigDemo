//
//  JobsOCNumberStepper.m
//  JobsOCNumberStepper
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsOCNumberStepper.h"

@interface JobsOCNumberStepper ()<UITextFieldDelegate>

Prop_assign()NSInteger value;
Prop_strong(nullable)NSNumber *minimumValue;
Prop_strong(nullable)NSNumber *maximumValue;
Prop_assign()NSInteger stepValue;
Prop_strong()UIButton *decreaseButton;
Prop_strong()UITextField *textField;
Prop_strong()UIButton *increaseButton;
Prop_strong()UIView *decreaseButtonContainer;
Prop_strong()UIView *increaseButtonContainer;
Prop_strong()UIStackView *contentStackView;

@end

@implementation JobsOCNumberStepper

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
        [self configureWithValue:0
                    minimumValue:nil
                    maximumValue:nil
                        stepValue:1];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self setupSubviews];
        [self configureWithValue:0
                    minimumValue:nil
                    maximumValue:nil
                        stepValue:1];
    };return self;
}

-(CGSize)intrinsicContentSize{
    return CGSizeMake(170, 44);
}

-(void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    self.textField.byEnabled(enabled);
    [self refreshAvailability];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    self.textField.layer.byBorderColorUIColor(JobsSeparatorColor);
}

-(instancetype)configureWithValue:(NSInteger)value
                     minimumValue:(NSNumber *)minimumValue
                     maximumValue:(NSNumber *)maximumValue
                         stepValue:(NSInteger)stepValue{
    [self setBoundsWithMinimumValue:minimumValue maximumValue:maximumValue];
    self.stepValue = stepValue > 0 ? stepValue : 1;
    [self setValue:value sendActions:NO];
    return self;
}

-(void)setBoundsWithMinimumValue:(NSNumber *)minimumValue
                   maximumValue:(NSNumber *)maximumValue{
    if (minimumValue && maximumValue) {
        self.minimumValue = minimumValue.integerValue <= maximumValue.integerValue
            ? minimumValue
            : maximumValue;
        self.maximumValue = minimumValue.integerValue <= maximumValue.integerValue
            ? maximumValue
            : minimumValue;
    } else {
        self.minimumValue = minimumValue;
        self.maximumValue = maximumValue;
    }
    [self refreshKeyboardType];
    [self setValue:self.value sendActions:NO];
}

-(void)setValue:(NSInteger)value sendActions:(BOOL)sendActions{
    NSInteger boundedValue = [self boundedValue:value];
    BOOL changed = self.value != boundedValue;
    self.value = boundedValue;
    [self syncText];
    [self refreshAvailability];
    if (sendActions && changed) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark —— Subviews
-(void)setupSubviews{
    self.contentStackView.byHidden(NO);
    [self.decreaseButtonContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(44);
    }];
    [self.increaseButtonContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(44);
    }];
    self.textField.accessibilityLabel = @"数值";
}

-(UIButton *)stepButtonByTitle:(NSString *)title
            accessibilityLabel:(NSString *)accessibilityLabel
                        action:(jobsByBtnBlock)action{
    UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(24))
            .normalStateTitleColorBy(JobsLabelColor)
            .disabledStateTitleColorBy(JobsTertiaryLabelColor)
            .jobsResetBtnBgCor(JobsSecondarySystemFillColor)
            .jobsResetBtnCornerRadiusValue(0)
            .onClickBy(action)
            .byClipsToBounds(YES);
    });
    button.accessibilityLabel = accessibilityLabel;
    return button;
}

-(UIView *)stepButtonContainerByButton:(UIButton *)button
                         maskedCorners:(CACornerMask)maskedCorners{
    UIView *container = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byCornerRadius(8)
            .byClipsToBounds(YES);
    });
    container.layer.byMaskedCorners(maskedCorners);
    button
        .addOn(container)
        .byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(container);
        });
    return container;
}

#pragma mark —— Value
-(NSInteger)boundedValue:(NSInteger)value{
    NSInteger boundedValue = value;
    if (self.minimumValue) {
        boundedValue = MAX(boundedValue, self.minimumValue.integerValue);
    }
    if (self.maximumValue) {
        boundedValue = MIN(boundedValue, self.maximumValue.integerValue);
    };return boundedValue;
}

-(void)decrease{
    if (self.value < NSIntegerMin + self.stepValue) {
        if (self.minimumValue) {
            [self setValue:self.minimumValue.integerValue sendActions:YES];
        };return;
    }
    [self setValue:self.value - self.stepValue sendActions:YES];
}

-(void)increase{
    if (self.value > NSIntegerMax - self.stepValue) {
        if (self.maximumValue) {
            [self setValue:self.maximumValue.integerValue sendActions:YES];
        };return;
    }
    [self setValue:self.value + self.stepValue sendActions:YES];
}

-(BOOL)canDecrease{
    if (!self.enabled) return NO;
    if (self.minimumValue) {
        return self.value > self.minimumValue.integerValue;
    };return self.value >= NSIntegerMin + self.stepValue;
}

-(BOOL)canIncrease{
    if (!self.enabled) return NO;
    if (self.maximumValue) {
        return self.value < self.maximumValue.integerValue;
    };return self.value <= NSIntegerMax - self.stepValue;
}

-(void)refreshAvailability{
    BOOL decreaseEnabled = [self canDecrease];
    BOOL increaseEnabled = [self canIncrease];
    self.decreaseButton
        .byEnabled(decreaseEnabled)
        .byAlpha(decreaseEnabled ? 1 : 0.35);
    self.increaseButton
        .byEnabled(increaseEnabled)
        .byAlpha(increaseEnabled ? 1 : 0.35);
}

-(void)refreshKeyboardType{
    BOOL acceptsNegativeValue = !self.minimumValue ||
        self.minimumValue.integerValue < 0;
    self.textField.byKeyboardType(acceptsNegativeValue
                                  ? UIKeyboardTypeNumbersAndPunctuation
                                  : UIKeyboardTypeNumberPad);
}

-(void)syncText{
    NSString *valueText = [NSString stringWithFormat:@"%ld",(long)self.value];
    self.textField.byText(valueText);
    self.textField.accessibilityValue = valueText;
}

-(void)handleTextChanged:(UITextField *)textField{
    NSString *text = textField.text;
    if (!text.length || [text isEqualToString:@"-"]) return;
    NSScanner *scanner = [NSScanner scannerWithString:text];
    long long candidate = 0;
    if (![scanner scanLongLong:&candidate] || !scanner.isAtEnd) return;
    if (candidate < NSIntegerMin || candidate > NSIntegerMax) return;
    NSInteger integerValue = (NSInteger)candidate;
    if ([self boundedValue:integerValue] != integerValue) return;
    [self setValue:integerValue sendActions:YES];
}

-(BOOL)isValidIntegerText:(NSString *)text{
    if (!text.length) return YES;
    BOOL acceptsNegativeValue = !self.minimumValue ||
        self.minimumValue.integerValue < 0;
    if ([text isEqualToString:@"-"]) return acceptsNegativeValue;
    if ([text hasPrefix:@"-"] && !acceptsNegativeValue) return NO;
    NSScanner *scanner = [NSScanner scannerWithString:text];
    long long candidate = 0;
    if (![scanner scanLongLong:&candidate] || !scanner.isAtEnd) return NO;
    if (candidate < NSIntegerMin || candidate > NSIntegerMax) return NO;
    return YES;
}

#pragma mark —— UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    NSString *candidate = [textField.text stringByReplacingCharactersInRange:range
                                                                  withString:string];
    return [self isValidIntegerText:candidate];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSScanner *scanner = [NSScanner scannerWithString:textField.text];
    long long candidate = 0;
    if ([scanner scanLongLong:&candidate] &&
        scanner.isAtEnd &&
        candidate >= NSIntegerMin &&
        candidate <= NSIntegerMax) {
        [self setValue:(NSInteger)candidate sendActions:YES];
    } else {
        [self syncText];
    }
}

#pragma mark —— LazyLoad
-(UIButton *)decreaseButton{
    if (!_decreaseButton) {
        @jobs_weakify(self)
        _decreaseButton = [self stepButtonByTitle:@"−"
                               accessibilityLabel:@"减少"
                                           action:^(__kindof UIButton * _Nullable button) {
            @jobs_strongify(self)
            [self decrease];
        }];
    };return _decreaseButton;
}

-(UITextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        _textField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byText(@"0")
                .byTextCor(JobsLabelColor)
                .byFont([UIFont monospacedDigitSystemFontOfSize:17
                                                        weight:UIFontWeightSemibold])
                .byTextAlignment(NSTextAlignmentCenter)
                .byBorderStyle(UITextBorderStyleNone)
                .byKeyboardType(UIKeyboardTypeNumbersAndPunctuation)
                .byAutocorrectionType(UITextAutocorrectionTypeNo)
                .byClearButtonMode(UITextFieldViewModeNever)
                .byDelegate(self)
                .onJobsChange(^(__kindof UITextField * _Nullable textField) {
                    @jobs_strongify(self)
                    [self handleTextChanged:textField];
                })
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(0)
                .byClipsToBounds(YES);
        });
        _textField.layer
            .byBorderWidth(1)
            .byBorderColorUIColor(JobsSeparatorColor);
    };return _textField;
}

-(UIButton *)increaseButton{
    if (!_increaseButton) {
        @jobs_weakify(self)
        _increaseButton = [self stepButtonByTitle:@"+"
                               accessibilityLabel:@"增加"
                                           action:^(__kindof UIButton * _Nullable button) {
            @jobs_strongify(self)
            [self increase];
        }];
    };return _increaseButton;
}

-(UIView *)decreaseButtonContainer{
    if (!_decreaseButtonContainer) {
        _decreaseButtonContainer = [self stepButtonContainerByButton:self.decreaseButton
                                                       maskedCorners:(kCALayerMinXMinYCorner |
                                                                      kCALayerMinXMaxYCorner)];
    };return _decreaseButtonContainer;
}

-(UIView *)increaseButtonContainer{
    if (!_increaseButtonContainer) {
        _increaseButtonContainer = [self stepButtonContainerByButton:self.increaseButton
                                                       maskedCorners:(kCALayerMaxXMinYCorner |
                                                                      kCALayerMaxXMaxYCorner)];
    };return _increaseButtonContainer;
}

-(UIStackView *)contentStackView{
    if (!_contentStackView) {
        _contentStackView = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
            stackView
                .byAxis(UILayoutConstraintAxisHorizontal)
                .byAlignment(UIStackViewAlignmentFill)
                .byDistribution(UIStackViewDistributionFill)
                .bySpacing(0)
                .byAddArrangedSubview(self.decreaseButtonContainer)
                .byAddArrangedSubview(self.textField)
                .byAddArrangedSubview(self.increaseButtonContainer)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
    };return _contentStackView;
}

@end
