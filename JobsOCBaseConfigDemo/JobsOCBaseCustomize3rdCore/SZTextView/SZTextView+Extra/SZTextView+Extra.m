//
//  SZTextView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2024年12月10日，星期二.
//

#import "SZTextView+Extra.h"

@implementation SZTextView (Extra)

-(JobsRetSZTextViewByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setText:data];
        return self;
    };
}

-(JobsRetSZTextViewByCorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTextColor:data];
        return self;
    };
}

-(JobsRetSZTextViewByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof SZTextView *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        [self setFont:data];
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
