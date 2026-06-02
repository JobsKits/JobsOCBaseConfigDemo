//
//  NSString+Conversion.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CONVERSION_BAB81BAB84
#define JOBS_HEADER_GUARD_NSSTRING_CONVERSION_BAB81BAB84

#pragma once

#import <Foundation/Foundation.h>
#import <JobsBasePopupView/NSString+URL.h>
#import <JobsBasePopupView/NSString+Check.h>
#import <JobsBasePopupView/NSString+Path.h>
#import <JobsBasePopupView/NSString+Extra.h>
#import <JobsBasePopupView/NSString+Replace.h>
#import <JobsBasePopupView/NSData+Extra.h>
#import <JobsBasePopupView/NSKeyedArchiver+Extra.h>
#import <JobsBasePopupView/NSMutableArray+Extra.h>
#import <JobsBasePopupView/NSObject+Extra.h>

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

@interface NSString (Conversion)
#pragma mark —— 转化
/// 对系统方法 initWithData.NSUTF8StringEncoding 的二次封装
+(JobsRetStrByDataBlock _Nonnull)initByUTF8Data;
/// 对系统方法 initWithData.NSASCIIStringEncoding 的二次封装
+(JobsRetStrByDataBlock _Nonnull)initByASCIIData;
/// 转化为可变字符串
-(NSMutableString *_Nullable)Mutable;
-(NSData *_Nullable)UTF8Encoding;
-(NSData *_Nullable)ASCIIEncoding;
/// 字符串中取数字
-(long long)getDigits;
/// 读取本地JSON文件
-(nullable id)readLocalFileWithName;
/// JSON 转 NSDictionary
-(nullable id)dictionaryWithJsonString;
/// NSDictionary 转 json字符串方法//==[dic mj_JSONString]
-(JobsRetStrByDicBlock _Nonnull)convertToJsonData;
/// NSDictionary 转 NSString
-(JobsRetStrByDicBlock _Nonnull)convertDictionaryToString;
///【实例方法】解压缩字符串
-(NSData *)compress;
///【类方法】压缩字符串成NSData
-(JobsRetDataByStrBlock _Nonnull)compressString;
///【类方法】解压缩字符串
+(JobsRetStrByDataBlock _Nonnull)decompressString;
/// 对象转OC字符串
+(JobsRetStrByIDBlock _Nonnull)toString;
/// OC字符串转NSDate
-(JobsRetDateByDateFormatterBlock _Nonnull)dataByDateFormatter;
/// OC字符串数组 转 OC字符串
+(NSString *_Nonnull)toStrByStringArr:(NSArray <NSString *>*_Nonnull)arr;
/// 纯字符串格式化为4位数字为一组的银行卡格式字符串
-(__kindof NSString *_Nullable)bankCardStyle;
-(JobsRetStrByIntegerBlock _Nonnull)bankCardStyleBy;
/// 将字典转换成GET请求的URL（带参数）
-(JobsRetStrByDicBlock _Nonnull)GETRequestURLParaBy;
/// 从指定的 URL 加载文本内容，并将其读取为一个可变字符串
-(JobsRetStrByVoidBlock _Nonnull)stringByContentsOfURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CONVERSION_BAB81BAB84 */
