//
//  UIColor+Extra.m
//  JobsMakes
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIColor+Extra.h"

@implementation UIColor (Extra)
/// 十六进制字符串 => UIColor *
+(JobsRetCorByStrBlock _Nonnull)jobsCor{
    return ^UIColor * _Nullable(NSString *_Nonnull hexCorString) {
        if (!hexCorString) return (UIColor *)nil;
        /// 去除收尾可能含有的空格字符串
        hexCorString = [hexCorString stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        // 移除可能的 '#' 前缀
        if ([hexCorString hasPrefix:@"#"]) {
            hexCorString = [hexCorString substringFromIndex:1];
        }
        // 检查是否是有效的十六进制颜色字符串
        if (hexCorString.length != 6) {
            return nil; // 无效的颜色字符串
        }
        // 将十六进制字符串转换为整数值
        NSScanner *scanner = [NSScanner scannerWithString:hexCorString];
        unsigned int hexValue;
        if (![scanner scanHexInt:&hexValue]) {
            return nil; // 转换失败
        }
        // 分解颜色分量
        CGFloat red = ((hexValue & 0xFF0000) >> 16) / 255.0;
        CGFloat green = ((hexValue & 0x00FF00) >> 8) / 255.0;
        CGFloat blue = (hexValue & 0x0000FF) / 255.0;

        return [UIColor colorWithRed:(red / 255.0f)
                               green:(green / 255.0f)
                                blue:(blue / 255.0f)
                               alpha:1.0f];
    };
}

@end
