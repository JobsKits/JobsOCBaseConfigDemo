//
//  UIColor+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//


#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
#ifndef JOBS_HEADER_GUARD_UICOLOR_EXTRA_C8D56D3EF7
#define JOBS_HEADER_GUARD_UICOLOR_EXTRA_C8D56D3EF7

#pragma once

#import <UIKit/UIKit.h>
#import <JobsBaseUI/NSMutableArray+Extra.h>
#import <JobsBaseUI/NSString+Extra.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extra)
#pragma mark —— 类方法
/// 十六进制字符串 => UIColor *
+(JobsRetCorByStrBlock _Nonnull)jobsCor;
/// uint32_t 颜色的RGB数值 + 透明度 => UIColor *
+(JobsRetCorByHexAlphaBlock _Nonnull)jobsColorByHexAlpha;
/// uint32_t 颜色的RGB数值  => UIColor *
+(JobsRetCorByHexBlock _Nonnull)jobsColorByHex;
/// 十六进制字符串 + 透明度 => UIColor *
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
/// 十六进制字符串 （默认透明度为1） => UIColor *
+(JobsRetCorByStrBlock _Nonnull)colorWithHexString;
/// UIColor * => UIImage *
+(JobsRetImageByCorBlock _Nonnull)imageWithColor;
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
                   targetViewRect:(CGRect)targetViewRect;
#pragma mark —— 实例方法
/// 将一个确定的UIColor子类，翻译成RGB格式的字符串值并对外输出【可能因为四舍五入的问题影响末位精度，误差在±1】
/// 资料来源  https://blog.csdn.net/thanklife/article/details/25784879
-(JobsRetStrByCorBlock _Nonnull)rgbCorStrBy;
/// 将一个确定的UIColor子类，翻译成十六进制格式的字符串值并对外输出
-(JobsReturnCorModelByVoidBlock _Nonnull)hexadecimalCorStrBy;
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsRetCorByCGFloatBlock _Nonnull)colorWithAlphaComponentBy;
/// 根据颜色生成图片
-(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
/**
 
     调用示例：渐变色

     CGRect viewRect = CGRectMake(0, 0, 320, 480);
     UIColor *gradientColor = [YourClassName gradientCorDataMutArr:nil
                                                        startPoint:CGPointMake(0, 0)
                                                          endPoint:CGPointMake(320, 480)
                                                            opaque:NO
                                                    targetViewRect:viewRect];
     yourView.byBgColor(gradientColor);

 */
#endif /* JOBS_HEADER_GUARD_UICOLOR_EXTRA_C8D56D3EF7 */
