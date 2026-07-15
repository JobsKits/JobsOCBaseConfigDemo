//
//  UIColor+Extra.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIColor+Extra.h"

@implementation UIColor (Extra)
+(JobsRetCorByStrBlock _Nonnull)jobsCor{
    return ^UIColor *_Nullable(NSString *_Nullable data){
        return [UIColor colorWithHexString:data alpha:1.0];
    };
}

+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    NSString *hexString = color.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet).uppercaseString;
    if ([hexString hasPrefix:@"#"]) hexString = [hexString substringFromIndex:1];
    if ([hexString hasPrefix:@"0X"]) hexString = [hexString substringFromIndex:2];
    if (hexString.length != 6) return UIColor.clearColor;
    unsigned int rgbValue = 0;
    [[NSScanner scannerWithString:hexString] scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0
                           green:((rgbValue & 0x00FF00) >> 8) / 255.0
                            blue:(rgbValue & 0x0000FF) / 255.0
                           alpha:alpha];
}
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsRetCorByCGFloatBlock _Nonnull)colorWithAlphaComponentBy{
    @jobs_weakify(self)
    return ^(CGFloat alpha) {
        @jobs_strongify(self)
        return [self colorWithAlphaComponent:alpha];
    };
}

@end
