//
//  NSString+Sys.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_SYS_10D0DF3DA4
#define JOBS_HEADER_GUARD_NSSTRING_SYS_10D0DF3DA4

#pragma once

#import <Foundation/Foundation.h>
#import <JobsAPIs/UIColor+Extra.h>

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

@interface NSString (Sys)

-(UIColor *)cor;
-(UIColor *)namedCor;
/// 取UIStoryboard
-(JobsRetStoryboardByBundleBlock _Nonnull)sbByBundle;
/// 对系统方法 substringFromIndex 的二次封装
-(JobsRetStrByUIntegerBlock _Nonnull)substringFromIndex;
/// 对系统方法 substringToIndex 的二次封装
-(JobsRetStrByUIntegerBlock _Nonnull)substringToIndex;
/// 对系统方法 substringWithRange 的二次封装
-(JobsRetStrByRangeBlock _Nonnull)substringByRange;
/// 对系统方法 rangeOfString 的二次封装
-(JobsRetRangeByStrBlock _Nonnull)rangeOfString;
/// 对系统方法 rangeOfString 的二次封装（当执行参数是本字符串时）
-(NSRange)range;
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet;
/// 对系统方法 characterAtIndex 的二次封装
-(JobsRetUnsignedShortByNSUIntegerBlock _Nonnull)characterAtIndex;
/// 对系统方法 stringWithCapacity 的二次封装
+(JobsRetStrByUIntegerBlock _Nonnull)initByCapacity;
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
+(JobsRetStrByStrBlock _Nonnull)initByContentsOfFile;
/// 对系统方法 - (nullable instancetype)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
+(JobsRetStrByURLBlock _Nonnull)initByContentsOfURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_SYS_10D0DF3DA4 */
