//
//  UIColor+Extra.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIColor+Extra.h"

@implementation UIColor (Extra)
+(UIColor *_Nullable)gradientCorDataMutArr:(NSMutableArray <UIColor *>*_Nullable)CorDataMutArr
                                startPoint:(CGPoint)startPoint
                                  endPoint:(CGPoint)endPoint
                                    opaque:(BOOL)opaque
                            targetViewRect:(CGRect)targetViewRect{
    if (CGRectGetWidth(targetViewRect) <= 0 || CGRectGetHeight(targetViewRect) <= 0) return nil;
    NSArray <UIColor *>*colors = CorDataMutArr.count ? CorDataMutArr.copy : @[UIColor.redColor, UIColor.greenColor];
    NSMutableArray *cgColors = NSMutableArray.array;
    for (UIColor *color in colors) {
        if (![color isKindOfClass:UIColor.class]) continue;
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    if (!cgColors.count) return nil;
    UIGraphicsBeginImageContextWithOptions(targetViewRect.size, opaque, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) {
        UIGraphicsEndImageContext();
        return nil;
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)cgColors, NULL);
    CGPoint realEndPoint = CGPointEqualToPoint(endPoint, CGPointZero) ? CGPointMake(CGRectGetMaxX(targetViewRect), CGRectGetMaxY(targetViewRect)) : endPoint;
    if (gradient) {
        CGContextDrawLinearGradient(context,
                                    gradient,
                                    startPoint,
                                    realEndPoint,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    }
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    if (gradient) CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return gradientImage ? [UIColor colorWithPatternImage:gradientImage] : nil;
}
/// 十六进制字符串 => UIColor *
+(JobsRetCorByStrBlock _Nonnull)jobsCor{
    return ^UIColor * _Nullable(NSString *_Nonnull hexCorString) {
        if (!hexCorString) return (UIColor *)nil;
        /// 去除收尾可能含有的空格字符串
        hexCorString = hexCorString.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
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
