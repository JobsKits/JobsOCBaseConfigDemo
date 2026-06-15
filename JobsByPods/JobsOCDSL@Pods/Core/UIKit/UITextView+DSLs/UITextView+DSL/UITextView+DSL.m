//
//  UITextView+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "UITextView+DSL.h"

@implementation UITextView (DSL)
#pragma mark —— 基础文本
-(JobsRetTextViewByStringBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSString *_Nullable text){
        @jobs_strongify(self)
        self.text = text;
        return self;
    };
}

-(JobsRetTextViewByAttributedStringBlock _Nonnull)byAttributedText{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSAttributedString *_Nullable attributedText){
        @jobs_strongify(self)
        self.attributedText = attributedText;
        return self;
    };
}

-(JobsRetTextViewByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.textColor = color;
        return self;
    };
}

-(JobsRetTextViewByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.font = font;
        return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSTextAlignment alignment){
        @jobs_strongify(self)
        self.textAlignment = alignment;
        return self;
    };
}

-(JobsRetTextViewByNSRangeBlock _Nonnull)bySelectedRange{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSRange range){
        @jobs_strongify(self)
        self.selectedRange = range;
        return self;
    };
}

-(JobsRetTextViewByNSDictionaryBlock _Nonnull)byTypingAttributes{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSDictionary<NSAttributedStringKey,id> *_Nullable attributes){
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)){
            self.typingAttributes = attributes ?: @{};
        };return self;
    };
}

-(JobsRetTextViewByNSDictionaryBlock _Nonnull)byMarkedTextStyle{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSDictionary *_Nullable style){
        @jobs_strongify(self)
        self.markedTextStyle = style;
        return self;
    };
}

-(JobsRetTextViewByEdgeInsetsBlock _Nonnull)byTextContainerInset{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.textContainerInset = insets;
        return self;
    };
}

-(JobsRetTextViewByNSDictionaryBlock _Nonnull)byLinkTextAttributes{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSDictionary<NSAttributedStringKey,id> *_Nullable attributes){
        @jobs_strongify(self)
        self.linkTextAttributes = attributes ?: @{};
        return self;
    };
}
#pragma mark —— 编辑行为
-(JobsRetTextViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(id<UITextViewDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)byEditable{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL editable){
        @jobs_strongify(self)
        self.editable = editable;
        return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)bySelectable{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL selectable){
        @jobs_strongify(self)
        self.selectable = selectable;
        return self;
    };
}

-(JobsRetTextViewByNSUIntegerBlock _Nonnull)byDataDetectorTypes{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIDataDetectorTypes types){
        @jobs_strongify(self)
        self.dataDetectorTypes = types;
        return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)byAllowsEditingTextAttributes{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)){
            self.allowsEditingTextAttributes = data;
        };return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)byClearsOnInsertion{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)){
            self.clearsOnInsertion = data;
        };return self;
    };
}
#pragma mark —— 输入视图
-(JobsRetTextViewByViewBlock _Nonnull)byInputView{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIView *_Nullable view){
        @jobs_strongify(self)
        self.inputView = view;
        return self;
    };
}

-(JobsRetTextViewByViewBlock _Nonnull)byInputAccessoryView{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIView *_Nullable view){
        @jobs_strongify(self)
        self.inputAccessoryView = view; // visionOS 不可用，已在 .h 标注
        return self;
    };
}
#pragma mark —— 键盘
-(JobsRetTextViewByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIKeyboardAppearance appearance){
        @jobs_strongify(self)
        self.keyboardAppearance = appearance;
        return self;
    };
}

-(JobsRetTextViewByKeyboardTypeBlock _Nonnull)byKeyboardType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIKeyboardType type){
        @jobs_strongify(self)
        self.keyboardType = type;
        return self;
    };
}

-(JobsRetTextViewByReturnKeyTypeBlock _Nonnull)byReturnKeyType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIReturnKeyType type){
        @jobs_strongify(self)
        self.returnKeyType = type;
        return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)byAutocapitalizationType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextAutocapitalizationType type){
        @jobs_strongify(self)
        self.autocapitalizationType = type;
        return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)byAutocorrectionType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextAutocorrectionType type){
        @jobs_strongify(self)
        self.autocorrectionType = type;
        return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySpellCheckingType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextSpellCheckingType type){
        @jobs_strongify(self)
        self.spellCheckingType = type;
        return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySmartQuotesType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextSmartQuotesType type){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.smartQuotesType = type;
        };return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySmartDashesType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextSmartDashesType type){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.smartDashesType = type;
        };return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySmartInsertDeleteType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextSmartInsertDeleteType type){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.smartInsertDeleteType = type;
        };return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)byEnablesReturnKeyAutomatically{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enablesReturnKeyAutomatically = data;
        return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)bySecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.secureTextEntry = data;
        return self;
    };
}

-(JobsRetTextViewByTextContentTypeBlock _Nonnull)byTextContentType{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextContentType _Nullable type){
        @jobs_strongify(self)
        if (@available(iOS 10.0, *)){
            self.textContentType = type;
        };return self;
    };
}

#pragma mark —— Single-parameter methods
-(JobsRetTextViewByNSRangeBlock _Nonnull)byScrollRangeToVisible{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSRange data){
        @jobs_strongify(self)
        [self scrollRangeToVisible:data];
        return self;
    };
}
#pragma mark —— 文本容器
-(JobsRetTextViewByCGFloatBlock _Nonnull)byLineFragmentPadding{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(CGFloat padding){
        @jobs_strongify(self)
        self.textContainer.lineFragmentPadding = padding;
        return self;
    };
}

-(JobsRetTextViewByNSUIntegerBlock _Nonnull)byMaximumNumberOfLines{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSUInteger numberOfLines){
        @jobs_strongify(self)
        self.textContainer.maximumNumberOfLines = numberOfLines;
        return self;
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSLineBreakMode lineBreakMode){
        @jobs_strongify(self)
        self.textContainer.lineBreakMode = lineBreakMode;
        return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)byWidthTracksTextView{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.textContainer.widthTracksTextView = data;
        return self;
    };
}

-(JobsRetTextViewByBOOLBlock _Nonnull)byHeightTracksTextView{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.textContainer.heightTracksTextView = data;
        return self;
    };
}

@end
