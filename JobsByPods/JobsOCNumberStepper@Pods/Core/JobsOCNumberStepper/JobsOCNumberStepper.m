//
//  JobsOCNumberStepper.m
//  JobsOCNumberStepper
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsOCNumberStepper.h"
#import <JobsOCDSL/UIButton+DSL.h>

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
-(JobsRetJobsOCNumberStepperByNSIntegerBlock _Nonnull)byValue{
    @jobs_weakify(self)
    return ^__kindof JobsOCNumberStepper *_Nullable(NSInteger value){
        @jobs_strongify(self)
        [self setValue:value];
        return self;
    };
}

-(JobsRetJobsOCNumberStepperByNumberBlock _Nonnull)byMinimumValue{
    @jobs_weakify(self)
    return ^__kindof JobsOCNumberStepper *_Nullable(NSNumber *_Nullable minimumValue){
        @jobs_strongify(self)
        [self setMinimumValue:minimumValue];
        return self;
    };
}

-(JobsRetJobsOCNumberStepperByNumberBlock _Nonnull)byMaximumValue{
    @jobs_weakify(self)
    return ^__kindof JobsOCNumberStepper *_Nullable(NSNumber *_Nullable maximumValue){
        @jobs_strongify(self)
        [self setMaximumValue:maximumValue];
        return self;
    };
}

-(JobsRetJobsOCNumberStepperByNSIntegerBlock _Nonnull)byStepValue{
    @jobs_weakify(self)
    return ^__kindof JobsOCNumberStepper *_Nullable(NSInteger stepValue){
        @jobs_strongify(self)
        [self setStepValue:stepValue];
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.setupSubviews();
        [self configureWithValue:0
                    minimumValue:nil
                    maximumValue:nil
                        stepValue:1];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.setupSubviews();
        [self configureWithValue:0
                    minimumValue:nil
                    maximumValue:nil
                        stepValue:1];
    };return self;
}

-(CGSize)intrinsicContentSize{
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCNumberStepper.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
    return action ? action() : (CGSize){0};
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return CGSizeMake(170, 44);
    };
}

-(void)setEnabled:(BOOL)enabled{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCNumberStepper.class, @selector(jobsSetEnabled)))(self, @selector(jobsSetEnabled));
    if (action) action(enabled);
}

-(jobsByBOOLBlock _Nonnull)jobsSetEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return;
        [super setEnabled:enabled];
        if (self.textField) self.textField.byEnabled(enabled);
        self.refreshAvailability();
    };
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCNumberStepper.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
        self.textField.layer.byBorderColorUIColor(JobsSeparatorColor);
    };
}

-(instancetype)configureWithValue:(NSInteger)value
                     minimumValue:(NSNumber *)minimumValue
                     maximumValue:(NSNumber *)maximumValue
                         stepValue:(NSInteger)stepValue{
    [self setBoundsWithMinimumValue:minimumValue maximumValue:maximumValue];
    self.byStepValue(stepValue > 0 ? stepValue : 1);
    [self setValue:value sendActions:NO];
    return self;
}

-(void)setBoundsWithMinimumValue:(NSNumber *)minimumValue
                   maximumValue:(NSNumber *)maximumValue{
    if (minimumValue && maximumValue) {
        self
            .byMinimumValue(minimumValue.integerValue <= maximumValue.integerValue
                ? minimumValue
                : maximumValue)
            .byMaximumValue(minimumValue.integerValue <= maximumValue.integerValue
                ? maximumValue
                : minimumValue);
    } else {
        self.byMinimumValue(minimumValue);
        self.byMaximumValue(maximumValue);
    }
    self.refreshKeyboardType();
    [self setValue:self.value sendActions:NO];
}

-(void)setValue:(NSInteger)value sendActions:(BOOL)sendActions{
    NSInteger boundedValue = self.boundedValue(value);
    BOOL changed = self.value != boundedValue;
    self.byValue(boundedValue);
    self.syncText();
    self.refreshAvailability();
    if (sendActions && changed) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark —— Subviews
-(jobsByVoidBlock _Nonnull)setupSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.contentStackView.byHidden(NO);
        [self.decreaseButtonContainer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(44);
        }];
        [self.increaseButtonContainer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(44);
        }];
        self.textField.byAccessibilityLabel(@"数值");
    };
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
    button.byAccessibilityLabel(accessibilityLabel);
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
-(JobsRetByNSIntegerBlock _Nonnull)boundedValue{
    @jobs_weakify(self)
    return ^NSInteger(NSInteger value){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        NSInteger boundedValue = value;
        if (self.minimumValue) {
            boundedValue = MAX(boundedValue, self.minimumValue.integerValue);
        }
        if (self.maximumValue) {
            boundedValue = MIN(boundedValue, self.maximumValue.integerValue);
        };return boundedValue;
    };
}

-(jobsByVoidBlock _Nonnull)decrease{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.value < NSIntegerMin + self.stepValue) {
            if (self.minimumValue) {
                [self setValue:self.minimumValue.integerValue sendActions:YES];
            };return;
        }
        [self setValue:self.value - self.stepValue sendActions:YES];
    };
}

-(jobsByVoidBlock _Nonnull)increase{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.value > NSIntegerMax - self.stepValue) {
            if (self.maximumValue) {
                [self setValue:self.maximumValue.integerValue sendActions:YES];
            };return;
        }
        [self setValue:self.value + self.stepValue sendActions:YES];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)canDecrease{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (!self.enabled) return NO;
        if (self.minimumValue) {
            return self.value > self.minimumValue.integerValue;
        };return self.value >= NSIntegerMin + self.stepValue;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)canIncrease{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (!self.enabled) return NO;
        if (self.maximumValue) {
            return self.value < self.maximumValue.integerValue;
        };return self.value <= NSIntegerMax - self.stepValue;
    };
}

-(jobsByVoidBlock _Nonnull)refreshAvailability{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL decreaseEnabled = self.canDecrease();
        BOOL increaseEnabled = self.canIncrease();
        self.decreaseButton
            .byEnabled(decreaseEnabled)
            .byAlpha(decreaseEnabled ? 1 : 0.35);
        self.increaseButton
            .byEnabled(increaseEnabled)
            .byAlpha(increaseEnabled ? 1 : 0.35);
    };
}

-(jobsByVoidBlock _Nonnull)refreshKeyboardType{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL acceptsNegativeValue = !self.minimumValue ||
            self.minimumValue.integerValue < 0;
        self.textField.byKeyboardType(acceptsNegativeValue
                                      ? UIKeyboardTypeNumbersAndPunctuation
                                      : UIKeyboardTypeNumberPad);
    };
}

-(jobsByVoidBlock _Nonnull)syncText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *valueText = [NSString stringWithFormat:@"%ld",(long)self.value];
        self.textField.byText(valueText);
        self.textField.byAccessibilityValue(valueText);
    };
}

-(jobsByTextFieldBlock _Nonnull)handleTextChanged{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        NSString *text = textField.text;
        if (!text.length || [text isEqualToString:@"-"]) return;
        NSScanner *scanner = [NSScanner scannerWithString:text];
        long long candidate = 0;
        if (![scanner scanLongLong:&candidate] || !scanner.isAtEnd) return;
        if (candidate < NSIntegerMin || candidate > NSIntegerMax) return;
        NSInteger integerValue = (NSInteger)candidate;
        if (self.boundedValue(integerValue) != integerValue) return;
        [self setValue:integerValue sendActions:YES];
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)isValidIntegerText{
    @jobs_weakify(self)
    return ^BOOL(NSString * text){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
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
    };
}

#pragma mark —— UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    NSString *candidate = [textField.text stringByReplacingCharactersInRange:range
                                                                  withString:string];
    return self.isValidIntegerText(candidate);
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    ((((jobsByTextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCNumberStepper.class, @selector(textFieldDidEndEditing)))(self, @selector(textFieldDidEndEditing))))(textField);
}
-(jobsByTextFieldBlock _Nonnull)textFieldDidEndEditing{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        NSScanner *scanner = [NSScanner scannerWithString:textField.text];
        long long candidate = 0;
        if ([scanner scanLongLong:&candidate] &&
            scanner.isAtEnd &&
            candidate >= NSIntegerMin &&
            candidate <= NSIntegerMax) {
            [self setValue:(NSInteger)candidate sendActions:YES];
        } else {
            self.syncText();
        }
    };
}

#pragma mark —— LazyLoad
-(UIButton *)decreaseButton{
    if (!_decreaseButton) {
        @jobs_weakify(self)
        _decreaseButton = [self stepButtonByTitle:@"−"
                               accessibilityLabel:@"减少"
                                           action:^(__kindof UIButton * _Nullable button) {
            @jobs_strongify(self)
            self.decrease();
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
                    self.handleTextChanged(textField);
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
            self.increase();
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
