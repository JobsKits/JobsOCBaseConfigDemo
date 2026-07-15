//
//  UIBaseTextField+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四。
//

#import "UIBaseTextField+DSL.h"

@implementation CJTextField (JobsUIBaseTextFieldDSL)
-(JobsRetCJTextFieldByDeleteDelegateBlock _Nonnull)byCJDelegate{
    @jobs_weakify(self)
    return ^__kindof CJTextField *_Nullable(id<CJTextFieldDeleteDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.cj_delegate = delegate;
        return self;
    };
}

@end

@implementation HQTextField (JobsUIBaseTextFieldDSL)
-(JobsRetHQTextFieldByVoidBlock _Nonnull)byShowWarn{
    @jobs_weakify(self)
    return ^__kindof HQTextField *_Nullable(void){
        @jobs_strongify(self)
        [self showWarn];
        return self;
    };
}

@end

@implementation ZYTextField (JobsUIBaseTextFieldDSL)
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldCornerRadius{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.ZYTextFieldCornerRadius = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldBorderWidth{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.ZYTextFieldBorderWidth = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCorBlock _Nonnull)byZYTextFieldBorderColor{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.ZYTextFieldBorderColor = cor;
        return self;
    };
}

-(JobsRetZYTextFieldByBOOLBlock _Nonnull)byZYTextFieldMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.ZYTextFieldMasksToBounds = data;
        return self;
    };
}

-(JobsRetZYTextFieldByBOOLBlock _Nonnull)byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(JobsRetZYTextFieldByBOOLBlock _Nonnull)byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.placeholderColor = cor;
        return self;
    };
}

-(JobsRetZYTextFieldByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.placeholderFont = font;
        return self;
    };
}

-(JobsRetZYTextFieldByNSIntegerBlock _Nonnull)byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byTextOffset{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof ZYTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

@end

@implementation JobsMagicTextField (JobsUIBaseTextFieldDSL)
-(JobsRetMagicTextFieldByBOOLBlock _Nonnull)byPlaceholdAnimationable{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.placeholdAnimationable = data;
        return self;
    };
}

-(JobsRetMagicTextFieldByCorBlock _Nonnull)byAnimationColor{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.animationColor = cor;
        return self;
    };
}

-(JobsRetMagicTextFieldByFontBlock _Nonnull)byAnimationFont{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.animationFont = font;
        return self;
    };
}

-(JobsRetMagicTextFieldByCGFloatBlock _Nonnull)byMoveDistance{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.moveDistance = data;
        return self;
    };
}

-(JobsRetMagicTextFieldByTimeIntervalBlock _Nonnull)byAnimationTime{
    @jobs_weakify(self)
    return ^__kindof JobsMagicTextField *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.animationTime = data;
        return self;
    };
}

@end

@implementation JobsTextField (JobsUIBaseTextFieldDSL)
-(JobsRetJobsTextFieldByUITextFieldBlock _Nonnull)byRealTextField{
    @jobs_weakify(self)
    return ^__kindof JobsTextField *_Nonnull(__kindof UITextField *_Nullable textField){
        @jobs_strongify(self)
        self.realTextField = textField;
        return self;
    };
}

-(JobsRetJobsTextFieldByTextFieldConfigBlock _Nonnull)byRealTextFieldConfig{
    @jobs_weakify(self)
    return ^__kindof JobsTextField *_Nonnull(jobsByTextFieldBlock _Nullable config){
        @jobs_strongify(self)
        if (config) config(self.realTextField);
        return self;
    };
}

@end
