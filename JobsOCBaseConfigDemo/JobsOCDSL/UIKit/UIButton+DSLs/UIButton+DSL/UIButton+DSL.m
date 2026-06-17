//
//  UIButton+DSL.m
//  JobsOCBaseConfigDemo
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

-(JobsRetBtnByTextAlignmentBlock _Nonnull)byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSTextAlignment data){
        @jobs_strongify(self)
        self.titleLabel.textAlignment = data;
        SEL selector = NSSelectorFromString(@"setTitleAlignment:");
        if ([self respondsToSelector:selector]) {
            [self setValue:@(data) forKey:@"titleAlignment"];
        };return self;
    };
}

-(JobsRetBtnByLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSLineBreakMode data){
        @jobs_strongify(self)
        self.titleLabel.lineBreakMode = data;
        SEL lineBreakModeSelector = NSSelectorFromString(@"setLineBreakMode:");
        if ([self respondsToSelector:lineBreakModeSelector]) {
            [self setValue:@(data) forKey:@"lineBreakMode"];
        }
        SEL titleLineBreakModeSelector = NSSelectorFromString(@"setTitleLineBreakMode:");
        if ([self respondsToSelector:titleLineBreakModeSelector]) {
            [self setValue:@(data) forKey:@"titleLineBreakMode"];
        };return self;
    };
}

@end
