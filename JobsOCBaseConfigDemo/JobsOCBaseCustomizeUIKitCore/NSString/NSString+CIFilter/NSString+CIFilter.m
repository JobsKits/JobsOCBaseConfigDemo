//
//  NSString+CIFilter.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+CIFilter.h"

static UIImage *JobsCIImageToUIImage(CIImage *ciImage, CGSize targetSize) {
    if (!ciImage || targetSize.width <= 0 || targetSize.height <= 0) return jobsMakeImage(^(UIImage *object){});
    CGRect extent = ciImage.extent;
    if (CGRectIsEmpty(extent) || CGRectGetWidth(extent) <= 0 || CGRectGetHeight(extent) <= 0) return jobsMakeImage(^(UIImage *object){});
    CGFloat scaleX = targetSize.width / CGRectGetWidth(extent);
    CGFloat scaleY = targetSize.height / CGRectGetHeight(extent);
    CIImage *scaledImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(scaleX, scaleY)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:scaledImage fromRect:scaledImage.extent];
    if (!cgImage) return jobsMakeImage(^(UIImage *object){});
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image ?: jobsMakeImage(^(UIImage *object){});
}

static UIImage *JobsQRCodeUIImage(CIImage *ciImage, CGFloat widthSize) {
    if (!ciImage || widthSize <= 0) return jobsMakeImage(^(UIImage *object){});
    CGRect extent = ciImage.extent;
    if (CGRectIsEmpty(extent) || CGRectGetWidth(extent) <= 0 || CGRectGetHeight(extent) <= 0) return jobsMakeImage(^(UIImage *object){});
    CGFloat scale = MAX(widthSize / CGRectGetWidth(extent), widthSize / CGRectGetHeight(extent));
    CIImage *scaledImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(scale, scale)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:scaledImage fromRect:scaledImage.extent];
    if (!cgImage) return jobsMakeImage(^(UIImage *object){});
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image ?: jobsMakeImage(^(UIImage *object){});
}

@implementation NSString (CIFilter)
/// 根据字符串生成二维码图像
-(JobsRetImageByVoidBlock _Nonnull)createQRcode{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self jobsQRCodeImageByWidth:260 correctionLevel:@"M"];
    };
}
/// 生成指定宽度的高清二维码图像
-(JobsRetImageByAlphaBlock _Nonnull)jobsQRCodeImageByWidth{
    @jobs_weakify(self)
    return ^UIImage *(CGFloat widthSize){
        @jobs_strongify(self)
        if (!self) return nil;
        return [self jobsQRCodeImageByWidth:widthSize correctionLevel:@"M"];
    };
}
/// 生成指定宽度和容错级别的高清二维码图像
-(UIImage *)jobsQRCodeImageByWidth:(CGFloat)widthSize
                    correctionLevel:(NSString *_Nullable)correctionLevel{
    if (!self.length || widthSize <= 0) return jobsMakeImage(^(UIImage *object){});
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (!data) return jobsMakeImage(^(UIImage *object){});
    CIFilter *filter = @"CIQRCodeGenerator".filter();
    if (!filter) return jobsMakeImage(^(UIImage *object){});
    [filter setDefaults];
    filter.jobsKVC(@"inputMessage",data);
    filter.jobsKVC(@"inputCorrectionLevel",correctionLevel.length ? correctionLevel.uppercaseString : @"M");
    CIImage *outputImage = filter.outputImage;
    if (!outputImage) return jobsMakeImage(^(UIImage *object){});
    return JobsQRCodeUIImage(outputImage, widthSize);
}
/// 生成带中心 Logo 的高清二维码图像
-(UIImage *)jobsQRCodeImageByWidth:(CGFloat)widthSize
                    correctionLevel:(NSString *_Nullable)correctionLevel
                         centerLogo:(UIImage *_Nullable)logo
                          logoRatio:(CGFloat)logoRatio
                   logoCornerRadius:(CGFloat)logoCornerRadius
                        borderWidth:(CGFloat)borderWidth
                        borderColor:(UIColor *_Nullable)borderColor{
    UIImage *qrImage = [self jobsQRCodeImageByWidth:widthSize
                                   correctionLevel:correctionLevel ?: @"H"];
    if (!logo || !qrImage.size.width || !qrImage.size.height) return qrImage;
    CGFloat safeRatio = logoRatio > 0 ? MIN(logoRatio, 0.3) : 0.22;
    CGFloat logoSide = MAX(8, widthSize * safeRatio);
    CGFloat safeBorderWidth = MAX(0, borderWidth);
    CGFloat canvasSide = logoSide + safeBorderWidth * 2;
    CGRect canvasRect = CGRectMake((widthSize - canvasSide) / 2, (widthSize - canvasSide) / 2, canvasSide, canvasSide);
    CGRect logoRect = CGRectInset(canvasRect, safeBorderWidth, safeBorderWidth);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(widthSize, widthSize), NO, 0);
    [qrImage drawInRect:CGRectMake(0, 0, widthSize, widthSize)];
    if (safeBorderWidth > 0) {
        UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:canvasRect cornerRadius:logoCornerRadius + safeBorderWidth];
        [(borderColor ?: UIColor.whiteColor) setFill];
        [borderPath fill];
    }
    UIBezierPath *logoPath = [UIBezierPath bezierPathWithRoundedRect:logoRect cornerRadius:MAX(0, logoCornerRadius)];
    [logoPath addClip];
    [logo drawInRect:logoRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image ?: qrImage;
}
/// 生成 Code128 条形码图像
-(UIImage *)jobsCode128BarcodeImageBySize:(CGSize)size
                               quietSpace:(CGFloat)quietSpace{
    if (!self.length || size.width <= 0 || size.height <= 0) return jobsMakeImage(^(UIImage *object){});
    NSData *data = [self dataUsingEncoding:NSASCIIStringEncoding];
    if (!data) data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (!data) return jobsMakeImage(^(UIImage *object){});
    CIFilter *filter = @"CICode128BarcodeGenerator".filter();
    if (!filter) return jobsMakeImage(^(UIImage *object){});
    [filter setDefaults];
    filter.jobsKVC(@"inputMessage",data);
    filter.jobsKVC(@"inputQuietSpace",@(MAX(0, quietSpace)));
    CIImage *outputImage = filter.outputImage;
    if (!outputImage) return jobsMakeImage(^(UIImage *object){});
    return JobsCIImageToUIImage(outputImage, size);
}
/// 生成带可读文本的 Code128 条形码图像
-(UIImage *)jobsCode128BarcodeImageByWidth:(CGFloat)width
                                 barHeight:(CGFloat)barHeight
                                quietSpace:(CGFloat)quietSpace
                                   spacing:(CGFloat)spacing
                                      font:(UIFont *_Nullable)font
                                 textColor:(UIColor *_Nullable)textColor
                           backgroundColor:(UIColor *_Nullable)backgroundColor{
    if (width <= 0 || barHeight <= 0) return jobsMakeImage(^(UIImage *object){});
    UIFont *safeFont = font ?: [UIFont monospacedDigitSystemFontOfSize:16 weight:UIFontWeightRegular];
    UIColor *safeTextColor = textColor ?: UIColor.blackColor;
    UIColor *safeBgColor = backgroundColor ?: UIColor.whiteColor;
    UIImage *barImage = [self jobsCode128BarcodeImageBySize:CGSizeMake(width, barHeight) quietSpace:quietSpace];
    CGFloat safeSpacing = MAX(0, spacing);
    NSDictionary<NSAttributedStringKey,id> *attrs = @{NSFontAttributeName:safeFont,
                                                      NSForegroundColorAttributeName:safeTextColor};
    CGSize textSize = [self sizeWithAttributes:attrs];
    if (textSize.width > width - 16) {
        CGFloat scale = MAX(0.6, (width - 16) / MAX(textSize.width, 1));
        safeFont = [safeFont fontWithSize:safeFont.pointSize * scale];
        attrs = @{NSFontAttributeName:safeFont,
                  NSForegroundColorAttributeName:safeTextColor};
        textSize = [self sizeWithAttributes:attrs];
    }
    CGFloat totalHeight = barHeight + safeSpacing + ceil(textSize.height);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, totalHeight), YES, 0);
    [safeBgColor setFill];
    UIRectFill(CGRectMake(0, 0, width, totalHeight));
    [barImage drawInRect:CGRectMake(0, 0, width, barHeight)];
    [self drawAtPoint:CGPointMake((width - textSize.width) / 2, barHeight + safeSpacing) withAttributes:attrs];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image ?: barImage;
}
/// 制作滤镜
-(JobsRetCIFilterByVoidBlock _Nonnull)filter{
    @jobs_weakify(self)
    return ^CIFilter *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        return [CIFilter filterWithName:self];
    };
}

@end
