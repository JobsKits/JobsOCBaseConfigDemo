//
//  NSData+Extra.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_EXTRA_8566AE659B
#define JOBS_HEADER_GUARD_NSDATA_EXTRA_8566AE659B

#pragma once

#import <Foundation/Foundation.h>
#import <JobsNavigationTransitionMgr/NSString+Conversion.h>

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

@interface NSData (Extra)
#pragma mark —— 对系统初始化方法的封装
-(JobsRetDataByDataBlock _Nonnull)initWithData;

+(JobsRetDataByNSUIntegerBlock _Nonnull)initByCapacity;
+(JobsRetDataByDataBlock _Nonnull)initByData;
+(JobsRetDataByURLBlock _Nonnull)initByURL;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile;
+(JobsRetDataByStrBlock _Nonnull)initByBase64EncodedString;
+(JobsRetDataByDataBlock _Nonnull)initByBase64EncodedData;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile_ReadingMappedIfSafe;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile_NSDataReadingUncached;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
+(JobsRetDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedIfSafe;
+(JobsRetDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingUncached;
+(JobsRetDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
#pragma mark —— 一些功能性的
/// 解压缩字符串
-(JobsRetStrByVoidBlock _Nonnull)decompressToStr;
-(NSString *)stringByUTF8Encoding;
-(JobsRetStrByVoidBlock _Nonnull)jobsStringByUTF8Encoding;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_EXTRA_8566AE659B */
