//
//  UIColor+Extra.h
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLOR_EXTRA_4E3C46F5CA
#define JOBS_HEADER_GUARD_UICOLOR_EXTRA_4E3C46F5CA

#pragma once

#import <UIKit/UIKit.h>
#import <JobsRichTextUtils/NSMutableArray+Extra.h>
#import <JobsRichTextUtils/NSString+Extra.h>
#import <JobsRichTextUtils/NSString+Sys.h>

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

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extra)
/// 十六进制字符串 => UIColor *
+(JobsRetCorByStrBlock _Nonnull)jobsCor;
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

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLOR_EXTRA_4E3C46F5CA */
