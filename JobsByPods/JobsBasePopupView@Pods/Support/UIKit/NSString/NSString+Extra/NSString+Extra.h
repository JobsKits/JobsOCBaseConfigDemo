//
//  NSString+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_90E5CA590D
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_90E5CA590D

#pragma once

#import <Foundation/Foundation.h>
#import <JobsBasePopupView/NSString+Sys.h>

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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
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

@interface NSString (Extra)
/// 获取一行字符串的高度
/// 这个方法仅计算文本本身的高度，不包括行间距等因素
-(JobsRetCGFloatByFontBlock _Nonnull)widthBy;

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString;
/// 字符串是否包含URL【返回YES包含】
-(JobsRetBOOLByVoidBlock _Nonnull)isContainsUrl;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
/// 完整的文件名提取普通文件名和文件后缀名
-(JobsRetFileNameModelByStrBlock _Nonnull)byFileFullName;

-(NSString *)pathForResourceWithFullName;
-(JobsRetStrByVoidBlock _Nonnull)jobsPathForResourceWithFullName;
/// 返回网址相关的NSURL *
-(NSURL *)jobsUrl;
-(JobsRetURLByVoidBlock _Nonnull)jobsURL;
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet;

-(JobsRetCAKeyframeAnimationByjobsByCAKeyframeAnimationBlockBlock _Nonnull)makeCAKeyframeAnimationByBlock;
/// 创建CAKeyframeAnimation（关键帧动画）
-(JobsRetCAKeyframeAnimationByVoidBlock _Nonnull)keyframeAnimation;
-(UIColor *)cor;
-(JobsRetCorByVoidBlock _Nonnull)jobsCor;
/// 服务器请求的数据为空值的时候进行替换本地默认值
/// 因为json传输是通过对象包装来进行，所以其实归结起来就是2类，一类是基本数据类型被包装成Number、其他包装成String
/// @param nullableString 进行检查的资源
/// @param replaceString 进行替换的备用文字资源
+(NSString *)nullableString:(id)nullableString
              replaceString:(NSString *)replaceString;
/// OC字符串转NSDate
-(JobsRetDateByDateFormatterBlock _Nonnull)dataByDateFormatter;
/// 对系统方法 rangeOfString 的二次封装
-(JobsRetRangeByStrBlock _Nonnull)rangeOfString;
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
-(JobsRetStrByStrBlock _Nonnull)initByContentsOfFile;
-(JobsRetDataByDicBlock _Nonnull)JSONWritingPrettyPrinted;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_90E5CA590D */
