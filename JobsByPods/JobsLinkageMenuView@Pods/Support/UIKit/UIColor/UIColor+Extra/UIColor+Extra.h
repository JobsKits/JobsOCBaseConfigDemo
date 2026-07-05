//
//  UIColor+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLOR_EXTRA_2152B15FEE
#define JOBS_HEADER_GUARD_UICOLOR_EXTRA_2152B15FEE

#pragma once

#import <UIKit/UIKit.h>
#import <JobsLinkageMenuView/NSString+Sys.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extra)
/// 生成渐变颜色
+(UIColor *_Nullable)gradientCorDataMutArr:(NSMutableArray <UIColor *>*_Nullable)CorDataMutArr
                                startPoint:(CGPoint)startPoint
                                  endPoint:(CGPoint)endPoint
                                    opaque:(BOOL)opaque
                            targetViewRect:(CGRect)targetViewRect;
/// 十六进制字符串 => UIColor *
+(JobsRetCorByStrBlock _Nonnull)jobsCor;
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsRetCorByCGFloatBlock _Nonnull)colorWithAlphaComponentBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLOR_EXTRA_2152B15FEE */
