//
//  UITextFieldModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UITextFieldModel+DSL.h"

@implementation UITextFieldModel (DSL)

#pragma mark —— 来自 UITextFieldProtocol
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSString * data))byText{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIFont * data))byTextFont{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.textFont = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSString * data))byTextFieldPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.textFieldPlaceholder = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIFont * data))byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.attributedPlaceholder = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.baseBackgroundColor = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byText_offset{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byLeftView{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(__kindof UIView * data) {
        @jobs_strongify(self)
        self.leftView = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byRightView{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(__kindof UIView * data) {
        @jobs_strongify(self)
        self.rightView = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UITextFieldViewMode data))byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UITextFieldViewMode data))byRightViewMode{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.rightViewMode = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowMenu{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isShowMenu = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byNotAllowEdit{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.notAllowEdit = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byTextFieldSecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.textFieldSecureTextEntry = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byTFRiseHeight{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.TFRiseHeight = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIKeyboardAppearance data))byKeyboardAppearance_{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance_ = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIKeyboardType data))byKeyboardType_{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType_ = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIReturnKeyType data))byReturnKeyType_{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType_ = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byBorderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.borderRectForBounds = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UITextFieldModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

@end
