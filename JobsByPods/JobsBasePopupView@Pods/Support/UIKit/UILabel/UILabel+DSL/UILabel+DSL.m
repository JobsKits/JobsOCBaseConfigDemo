//
//  UILabel+DSL.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UILabel+DSL.h"

@implementation UILabel (DSL)

-(JobsRetLabelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.textColor = cor;
        return self;
    };
}

-(JobsRetLabelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIFont *_Nullable font){
        @jobs_strongify(self)
        self.font = font;
        return self;
    };
}

-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSTextAlignment textAlignment){
        @jobs_strongify(self)
        self.textAlignment = textAlignment;
        return self;
    };
}

-(JobsRetLabelByTextBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSString *_Nullable str){
        @jobs_strongify(self)
        self.text = str;
        return self;
    };
}
/// 确定Label的字体大小，使其宽度自适应
-(jobsByVoidBlock _Nonnull)labelAutoWidthByFont{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        [self sizeToFit];// 必须有text，然后根据text来进行约束计算和布局
    };
}
/// 确定Label的宽度，使字体大小自适应
-(jobsByVoidBlock _Nonnull)labelAutoFontByWidth{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if ([self isKindOfClass:UILabel.class]) {
            UILabel *label = (UILabel *)self;
            label.adjustsFontSizeToFitWidth = YES;// 必须有text，然后根据text来进行约束计算和布局
        }
    };
}

@end
