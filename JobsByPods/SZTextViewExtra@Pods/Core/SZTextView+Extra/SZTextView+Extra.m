//
//  SZTextView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SZTextView+Extra.h"

@implementation SZTextView (Extra)

-(JobsRetSZTextViewByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetSZTextViewByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetSZTextViewByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetSZTextViewByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetSZTextViewByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        NSMutableAttributedString *placeholder = self.attributedPlaceholder.mutableCopy;
        if (!placeholder) {
            placeholder = [NSMutableAttributedString.alloc initWithString:self.placeholder ?: @""];
        }
        NSRange range = NSMakeRange(0, placeholder.length);
        [placeholder removeAttribute:NSFontAttributeName range:range];
        if (data) [placeholder addAttribute:NSFontAttributeName value:data range:range];
        self.attributedPlaceholder = placeholder;
        return self;
    };
}

-(JobsRetSZTextViewByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.placeholderTextColor = data;
        return self;
    };
}

@end
