//
//  UIColor+Extra.m
//  JobsRichTextUtils
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
        hexCorString = hexCorString.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        /// 移除可能的 '#' 前缀
        if ([hexCorString hasPrefix:@"#"]) {
            hexCorString = [hexCorString substringFromIndex:1];
        }
        /// 检查是否是有效的十六进制颜色字符串
        if (hexCorString.length != 6) {
            return nil; // 无效的颜色字符串
        }
        /// 将十六进制字符串转换为整数值
        NSScanner *scanner = [NSScanner scannerWithString:hexCorString];
        unsigned int hexValue;
        if (![scanner scanHexInt:&hexValue]) {
            return nil; // 转换失败
        }
        /// 分解颜色分量
        CGFloat red = ((hexValue & 0xFF0000) >> 16) / 255.0;
        CGFloat green = ((hexValue & 0x00FF00) >> 8) / 255.0;
        CGFloat blue = (hexValue & 0x0000FF) / 255.0;

        return [UIColor colorWithRed:(red / 255.0f)
                               green:(green / 255.0f)
                                blue:(blue / 255.0f)
                               alpha:1.0f];
    };
}
/// 生成的渐变图像
/// - Parameters:
///   - CorDataMutArr: 一个可选的NSMutableArray，其中包含用于渐变的颜色数组。如果未提供或为nil，方法将默认使用红色和绿色作为渐变颜色。
///   - startPoint: 渐变的起始点，使用CGPoint表示
///   - endPoint: 渐变的结束点，使用CGPoint表示。如果未指定，将使用目标视图矩形的右下角作为结束点
///   - opaque: 一个布尔值，表示生成的图像是否支持不透明度。
///   - targetViewRect: 目标视图的矩形区域，用于确定生成渐变图像的大小
+(UIColor *)gradientCorDataMutArr:(NSMutableArray <UIColor *>*_Nullable)CorDataMutArr
                       startPoint:(CGPoint)startPoint
                         endPoint:(CGPoint)endPoint
                           opaque:(BOOL)opaque
                   targetViewRect:(CGRect)targetViewRect{
    /**

         该方法首先检查目标视图矩形的宽度和高度是否为零，如果是零，则会触发断言，表示宽度或高度为零将返回nil。
         接下来，它检查传入的颜色数组CorDataMutArr是否为nil，如果为nil，则创建一个包含默认红色和绿色的颜色数组。
         如果不为nil，则将颜色数组中的颜色转换为CGColor。
         然后，它创建一个图形上下文，绘制一个线性渐变，使用传入的渐变颜色数组，起始点startPoint和结束点endPoint。
         最后，它获取生成的渐变图像，并释放相关的资源。
         最终，它将生成的渐变图像作为背景颜色创建并返回一个UIColor对象。
     */
    if (targetViewRect.size.width == 0 || targetViewRect.size.height == 0) {
        NSAssert(NO, @"宽或者高为0,则会对外输出nil");
    }

    if (!CorDataMutArr) {
        CorDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add((id)JobsRedColor.CGColor)
            .add((id)JobsGreenColor.CGColor);
        });
    }else{
        for (int t = 0; t < CorDataMutArr.count; t++) {
            [CorDataMutArr replaceObjectAtIndex:t withObject:(id)CorDataMutArr[t].CGColor];
        }
    }

    UIGraphicsBeginImageContextWithOptions(targetViewRect.size,
                                           opaque,
                                           UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制渐变层
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef,
                                                           (__bridge CFArrayRef)CorDataMutArr,
                                                           NULL);

    CGPoint EndPoint = endPoint;
    if (CGPointEqualToPoint(endPoint, CGPointZero)) {
        EndPoint = CGPointMake(CGRectGetMaxX(targetViewRect),
                               CGRectGetMaxY(targetViewRect));
    }

    CGContextDrawLinearGradient(context,
                                gradientRef,
                                startPoint,
                                EndPoint,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    /// 取到渐变图片
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    /// 释放资源
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradientRef);
    UIGraphicsEndImageContext();

    return [UIColor colorWithPatternImage:gradientImage];
}

@end
