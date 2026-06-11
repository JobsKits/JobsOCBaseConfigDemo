//
//  UIBaseTextField+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四。
//

#import "UIBaseTextField+DSL.h"

@implementation CJTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnCJTextFieldByDeleteDelegateBlock _Nonnull)byCJDelegate{
    @jobs_weakify(self)
    return ^__kindof CJTextField *_Nullable(id<CJTextFieldDeleteDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.cj_delegate = delegate;
        return self;
    };
}
@end

@implementation HQTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnHQTextFieldByVoidBlock _Nonnull)byShowWarn{
    @jobs_weakify(self)
    return ^__kindof HQTextField *_Nullable(void){
        @jobs_strongify(self)
        [self showWarn];
        return self;
    };
}
@end

@implementation ZYTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldCornerRadius{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.ZYTextFieldCornerRadius = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldBorderWidth{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.ZYTextFieldBorderWidth = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCorBlock _Nonnull)byZYTextFieldBorderColor{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.ZYTextFieldBorderColor = cor;
        return self;
    };
}

-(JobsReturnZYTextFieldByBOOLBlock _Nonnull)byZYTextFieldMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.ZYTextFieldMasksToBounds = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByBOOLBlock _Nonnull)byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByBOOLBlock _Nonnull)byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.placeholderColor = cor;
        return self;
    };
}

-(JobsReturnZYTextFieldByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.placeholderFont = font;
        return self;
    };
}

-(JobsReturnZYTextFieldByNSIntegerBlock _Nonnull)byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byTextOffset{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}
@end

@implementation JobsMagicTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnMagicTextFieldByBOOLBlock _Nonnull)byPlaceholdAnimationable{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.placeholdAnimationable = data;
        return self;
    };
}

-(JobsReturnMagicTextFieldByCorBlock _Nonnull)byAnimationColor{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.animationColor = cor;
        return self;
    };
}

-(JobsReturnMagicTextFieldByFontBlock _Nonnull)byAnimationFont{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.animationFont = font;
        return self;
    };
}

-(JobsReturnMagicTextFieldByCGFloatBlock _Nonnull)byMoveDistance{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.moveDistance = data;
        return self;
    };
}

-(JobsReturnMagicTextFieldByTimeIntervalBlock _Nonnull)byAnimationTime{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.animationTime = data;
        return self;
    };
}
@end

@implementation JobsTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnJobsTextFieldByUITextFieldBlock _Nonnull)byRealTextField{
    @jobs_weakify(self)
    return ^__kindof JobsTextField *_Nonnull(__kindof UITextField *_Nullable textField){
        @jobs_strongify(self)
        self.realTextField = textField;
        return self;
    };
}

-(JobsReturnJobsTextFieldByTextFieldConfigBlock _Nonnull)byRealTextFieldConfig{
    @jobs_weakify(self)
    return ^__kindof JobsTextField *_Nonnull(jobsByTextFieldBlock _Nullable config){
        @jobs_strongify(self)
        if (config) config(self.realTextField);
        return self;
    };
}
@end
