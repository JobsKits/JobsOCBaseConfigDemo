//
//  NSObject+Algorithm.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_ALGORITHM_2E12CAB720
#define JOBS_HEADER_GUARD_NSOBJECT_ALGORITHM_2E12CAB720

#pragma once

#import <Foundation/Foundation.h>
#import <JobsOCRuntimeKits/NSString+Extra.h>
#import <JobsOCRuntimeKits/NSObject+Extra.h>
#import <JobsOCRuntimeKits/NSMutableSet+Extra.h>

#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
#endif

#if __has_include(<JobsOCSnowflake/JobsOCSnowflake.h>)
#import <JobsOCSnowflake/JobsOCSnowflake.h>
#else
#import "JobsOCSnowflake.h"
#endif

#if __has_include(<JobsClass/JobsClass.h>)
#import <JobsClass/JobsClass.h>
#else
#import "JobsClass.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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
/// 算法相关
@interface NSObject (Algorithm)
/// 将数据做成3列，第一个元素的下标是1，判断任意一个下标数，处于哪一列
-(JobsRetIntByIntBlock _Nonnull)column3By;
/// 给定一个数据源（数组）和 每行需要展示的元素个数，计算行数
-(NSInteger)count:(NSUInteger)count num:(NSInteger)num;
/// 判断任意给定的一个整型是多少位数
-(JobsRetByNSIntegerBlock _Nonnull)bitNum;
/// 判断任意数字是否为小数
-(JobsRetBOOLByCGFloatBlock _Nonnull)isFloat;
/**
    判断 num1 是否能被 num2 整除
    也就是判断 num2 是否是 num1 的整数倍
    也就是判断 num1 除以 num2 的余数是否是 0
 
    特别指出的是：
    1、除数为零的情况，被判定为不能被整除；
    2、num1 和 num2 必须为 NSNumber* 类型，否则判定为不能够被整除
 */
-(BOOL)judgementExactDivisionByNum1:(NSNumber *_Nonnull)num1 num2:(NSNumber *_Nonnull)num2;
/// 雪花算法
-(NSNumber *_Nonnull)makeSnowflake;
/// 查询算法
/// @param data 查询的数据源
/// @param searchStrategy 查询策略
/// @param keywords 关键词
-(NSMutableSet *_Nullable)dimSearchWithData:(id _Nonnull)data
                             searchStrategy:(JobsSearchStrategy)searchStrategy
                                   keywords:(NSString *_Nonnull)keywords;
/// 以当前手机系统时间（包含了时区）为基准，给定一个日期偏移值（正值代表未来，负值代表过去，0代表现在），返回字符串特定格式的“星期几”
-(JobsRetStrByIntegerBlock _Nonnull)whatDayOfWeekDistanceNow;
/// 随机生成验证码字符串
-(JobsRetStrByArrAndNSIntegerBlock _Nonnull)randomCodeBy;
/// 通用格式化方法：整数或浮点数，每三位加逗号，小数保留2位
-(JobsRetStrByCGFloatBlock _Nonnull)manualFormatNumber;
///（Rects）获取最大高度
-(JobsRetCGFloatByArrBlock _Nonnull)maxHeightInRectArray;
///（Rects）获取最小高度
-(JobsRetCGFloatByArrBlock _Nonnull)minHeightInRectArray;
///（Rects）获取最大宽度
-(JobsRetCGFloatByArrBlock _Nonnull)maxWidthInRectArray;
///（Rects）获取最小宽度
-(JobsRetCGFloatByArrBlock _Nonnull)minWidthInRectArray;
///（Sizes）获取最大高度
-(JobsRetCGFloatByArrBlock _Nonnull)maxHeightInSizeArray;
///（Sizes）获取最小高度
-(JobsRetCGFloatByArrBlock _Nonnull)minHeightInSizeArray;
///（Sizes）获取最大宽度
-(JobsRetCGFloatByArrBlock _Nonnull)maxWidthInSizeArray;
///（Sizes）获取最小宽度
-(JobsRetCGFloatByArrBlock _Nonnull)minWidthInSizeArray;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_ALGORITHM_2E12CAB720 */
