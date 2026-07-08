//
//  NSString+CIFilter.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CIFILTER_E90DE7C93F
#define JOBS_HEADER_GUARD_NSSTRING_CIFILTER_E90DE7C93F

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import <JobsByOCPods/NSObject+Extra.h>
#import <JobsByOCPods/NSString+Conversion.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CIFilter)
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode;
/// 生成指定宽度的高清二维码图像
-(UIImage *)jobsQRCodeImageByWidth:(CGFloat)widthSize;
/// 生成指定宽度和容错级别的高清二维码图像
-(UIImage *)jobsQRCodeImageByWidth:(CGFloat)widthSize
                    correctionLevel:(NSString *_Nullable)correctionLevel;
/// 生成带中心 Logo 的高清二维码图像
-(UIImage *)jobsQRCodeImageByWidth:(CGFloat)widthSize
                    correctionLevel:(NSString *_Nullable)correctionLevel
                         centerLogo:(UIImage *_Nullable)logo
                          logoRatio:(CGFloat)logoRatio
                   logoCornerRadius:(CGFloat)logoCornerRadius
                        borderWidth:(CGFloat)borderWidth
                        borderColor:(UIColor *_Nullable)borderColor;
/// 生成 Code128 条形码图像
-(UIImage *)jobsCode128BarcodeImageBySize:(CGSize)size
                               quietSpace:(CGFloat)quietSpace;
/// 生成带可读文本的 Code128 条形码图像
-(UIImage *)jobsCode128BarcodeImageByWidth:(CGFloat)width
                                 barHeight:(CGFloat)barHeight
                                quietSpace:(CGFloat)quietSpace
                                   spacing:(CGFloat)spacing
                                      font:(UIFont *_Nullable)font
                                 textColor:(UIColor *_Nullable)textColor
                           backgroundColor:(UIColor *_Nullable)backgroundColor;
/// 制作滤镜
-(CIFilter *_Nonnull)filter;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CIFILTER_E90DE7C93F */
