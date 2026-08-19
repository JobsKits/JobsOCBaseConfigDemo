//
//  UIColor+Other.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 9/16/23.
//

#import "UIColor+Other.h"

@implementation UIColor (Other)
#pragma mark —— 类方法
/// 十六进制字符串 => UIColor *
/// uint32_t 颜色的RGB数值 + 透明度 => UIColor *
/// uint32_t 颜色的RGB数值  => UIColor *
/// 十六进制字符串 + 透明度 => UIColor *
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    // 删除字符串中的空格
    NSString *cString = [color stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].uppercaseString;
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return JobsClearColor;
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return JobsClearColor;
    }
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return jobsMakeCor(^(JobsCorModel * _Nullable data) {
        data
            .byRed(((float)r / 255.0f))
            .byGreen(((float)g / 255.0f))
            .byBlue(((float)b / 255.0f))
            .byAlpha(alpha);
    });
}
/// 十六进制字符串 （默认透明度为1） => UIColor *
/// UIColor * => UIImage *
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
            data
                .add((id)JobsRedColor.CGColor)
                .add((id)JobsGreenColor.CGColor);
        });
    }else{
        for (int t = 0; t < CorDataMutArr.count; t++) {
            [CorDataMutArr replaceObjectAtIndex:t
                                     withObject:(id)CorDataMutArr[t].CGColor];
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
#pragma mark —— 实例方法
/// 将一个确定的UIColor子类，翻译成RGB格式的字符串值并对外输出【可能因为四舍五入的问题影响末位精度，误差在±1】
/// 资料来源  https://blog.csdn.net/thanklife/article/details/25784879
/// 将一个确定的UIColor子类，翻译成十六进制格式的字符串值并对外输出
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
/// 根据颜色生成图片
-(UIImage *)image{
    return (((JobsRetImageByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIColor.class, @selector(jobsImage)))(self, @selector(jobsImage)))();
}

/// 根据颜色生成图片
@end
