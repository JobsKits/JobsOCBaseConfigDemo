//
//  JobsAppDoorInputViewBaseStyleModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsAppDoorInputViewBaseStyleModel+DSL.h"

@implementation JobsAppDoorInputViewBaseStyleModel (DSL)

#pragma mark —— 来自 JobsAppDoorInputViewBaseStyleModel
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byLeftViewIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.leftViewIMG = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))bySelectedSecurityBtnIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.selectedSecurityBtnIMG = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byUnSelectedSecurityBtnIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.unSelectedSecurityBtnIMG = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowSecurityBtn{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isShowSecurityBtn = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSString * data))byNickNamePlaceHolderStr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.nickNamePlaceHolderStr = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSString * data))byTitleLabStr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.titleLabStr = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIFont * data))byTitleStrFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.titleStrFont = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byTitleStrCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.titleStrCor = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSString * data))byInputStr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.inputStr = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSInteger data))byInputCharacterRestriction{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.inputCharacterRestriction = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIReturnKeyType data))byReturnKeyType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIKeyboardAppearance data))byKeyboardAppearance{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UITextFieldViewMode data))byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIKeyboardType data))byKeyboardType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byKeyboardEnable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.keyboardEnable = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byDisabledBackground{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.disabledBackground = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byBackground{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.background = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGSize data))byTfSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.tfSize = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byTFRiseHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.TFRiseHeight = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offset = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byZYTextFieldMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.ZYTextFieldMasksToBounds = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byZYTextFieldBorderColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.ZYTextFieldBorderColor = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byZYtextColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.ZYtextColor = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byZYtintColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.ZYtintColor = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIFont * data))byZYtextFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.ZYtextFont = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byZYTextFieldCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.ZYTextFieldCornerRadius = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byZYTextFieldBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.ZYTextFieldBorderWidth = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byPlaceholdAnimationable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.placeholdAnimationable = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byAnimationColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.animationColor = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIFont * data))byAnimationFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.animationFont = data;
        return self;
    };
}

-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byMoveDistance{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.moveDistance = data;
        return self;
    };
}

@end
