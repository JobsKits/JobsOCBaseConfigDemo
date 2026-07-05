//
//  NSObject+AttributedString.m
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+AttributedString.h"
#import "NSString+Extra.h"

@implementation NSObject (AttributedString)

+(__kindof NSDictionary <NSAttributedStringKey,id>*)linkTextAttributes{
    return @{
        NSForegroundColorAttributeName: @"#FFCC00".cor,
        NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
        NSUnderlineColorAttributeName: @"#FFCC00".cor,
    };
}
/// 超链接的文字以及下划线的颜色设置
-(__kindof NSDictionary <NSAttributedStringKey,id>*)makeLinkTextAttributes{
    return NSObject.linkTextAttributes;
}

@end
