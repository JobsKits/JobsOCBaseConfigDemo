//
//  UILabel+DSL.m
//  JobsBaseUI
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

-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        self.attributedText = attributedString;
        return self;
    };
}

/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(JobsRetLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UILabelShowingType labelShowingType) {
        @jobs_strongify(self)
        /// 先刷新得出Label的frame.及其Size
        [self.superview layoutIfNeeded];
        self.labelShowingType = labelShowingType;
        switch (labelShowingType) {
            case UILabelShowingType_01:{///  一行显示。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
                if (self.width && self.height) {
                    self.lineBreakMode = NSLineBreakByTruncatingMiddle;// NSLineBreakByTruncatingHead、NSLineBreakByTruncatingMiddle、NSLineBreakByTruncatingTail
                }
            }break;
            case UILabelShowingType_02:{/// 一行显示。定宽、定高、定字体。多余部分scrollerView
                /// 在不全局集成@implementation UILabel (AutoScroll)的前提下
                /// 要求本类是 BaseLabel
            }break;
            case UILabelShowingType_03:{/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
                if (self.height) {
                    self.labelAutoWidthByFont();
                    if (self.width) self.uninstall(NSLayoutAttributeWidth);// 强制
                }
            }break;
            case UILabelShowingType_04:{/// 一行显示。定宽、定高。缩小字体方式全展示 【单行：ByWidth】
                if (self.width && self.height) {
                    self.labelAutoFontByWidth();
                }
            }break;
            case UILabelShowingType_05:{/// 多行显示。定宽、不定高、定字体 【多行：ByFont】
                if (self.width) {
                    self.numberOfLines = 0;
                    self.lineBreakMode = NSLineBreakByWordWrapping;/// 自动折行设置【默认】
                    if (self.height) self.uninstall(NSLayoutAttributeHeight);
                }
            }break;
            default:break;
        }return self;
    };
}
#pragma mark —— Prop_assign()UILabelShowingType labelShowingType;
JobsKey(_labelShowingType)
@dynamic labelShowingType;
-(UILabelShowingType)labelShowingType{
    return [Jobs_getAssociatedObject(_labelShowingType) integerValue];
}

-(void)setLabelShowingType:(UILabelShowingType)labelShowingType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_labelShowingType, @(labelShowingType))
}


@end
