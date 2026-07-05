//
//  NSString+Extra.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef NSString_Extra_h
#define NSString_Extra_h

#import <Foundation/Foundation.h>
#import <JobsModel/FileNameModel.h>
#import <JobsModel/NSDate+Extra.h>
#import <JobsModel/NSFormatter+Extra.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
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

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JobsModelExtra)
/// 完整的文件名提取普通文件名和文件后缀名
-(JobsRetFileNameModelByStrBlock _Nonnull)byFileFullName;
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString;
/// 获取一行字符串的高度
/// 这个方法仅计算文本本身的高度，不包括行间距等因素
-(JobsRetCGFloatByFontBlock _Nonnull)widthBy;
/// 求一个字符串的长度
-(JobsRetCGFloatByFontBlock _Nonnull)lenthByFont;
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet;
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl;
/// 格式化为中国时间
-(JobsRetStrByStrBlock _Nonnull)chinaTime;
/// 时间戳（字符串）依据某一规范，格式化为能一目了然的时间（字符串）
/// - Parameters:
///   - timeFormatter: timeFormatter
///   - timeZoneType: 时区
///   - intervalStyle: IntervalStyle
-(NSString *)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                         timeZoneType:(TimeZoneType)timeZoneType
                        intervalStyle:(IntervalStyle)intervalStyle;
/// 对系统方法 rangeOfString 的二次封装
-(JobsRetRangeByStrBlock _Nonnull)rangeOfString;

@end

NS_ASSUME_NONNULL_END

#endif /* NSString_Extra_h */
