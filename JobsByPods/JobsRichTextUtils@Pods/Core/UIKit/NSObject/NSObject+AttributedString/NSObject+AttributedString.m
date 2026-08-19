//
//  NSObject+AttributedString.m
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+AttributedString.h"

#import <JobsRichTextUtils/NSString+Extra.h>

@implementation NSObject (AttributedString)
+(JobsRetNSDictionaryNSAttributedStringKeyIDByVoidBlock _Nonnull)linkTextAttributes{
    return ^__kindof NSDictionary <NSAttributedStringKey,id>*{
        return @{
            NSForegroundColorAttributeName: @"#FFCC00".jobsCor(),
            NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
            NSUnderlineColorAttributeName: @"#FFCC00".jobsCor(),
        };
    };
}
/// 超链接的文字以及下划线的颜色设置
-(JobsRetNSDictionaryNSAttributedStringKeyIDByVoidBlock _Nonnull)makeLinkTextAttributes{
    @jobs_weakify(self)
    return ^__kindof NSDictionary <NSAttributedStringKey,id>*{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.linkTextAttributes();
    };
}

@end
