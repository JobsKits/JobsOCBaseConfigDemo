//
//  UIButton+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月10日，星期三.
//

#import "UIButton+DSL.h"

@implementation UIButton (DSL)

-(JobsRetBtnByLabelBlock _Nonnull)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByLabelBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.titleLabel);
        return self;
    };
}

-(JobsRetBtnByLabelBlock _Nonnull)bySubtitleLabel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByLabelBlock _Nullable block){
        @jobs_strongify(self)
        UILabel *label = nil;
        SEL selector = NSSelectorFromString(@"subtitleLabel");
        if ([self respondsToSelector:selector]) {
            @try {
                id value = [self valueForKey:@"subtitleLabel"];
                if ([value isKindOfClass:UILabel.class]) label = value;
            } @catch (__unused NSException *exception) {}
        }
        if (block) block(label);
        return self;
    };
}

-(JobsRetBtnByImageViewBlock _Nonnull)byImageView{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByImageViewBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.imageView);
        return self;
    };
}

@end
