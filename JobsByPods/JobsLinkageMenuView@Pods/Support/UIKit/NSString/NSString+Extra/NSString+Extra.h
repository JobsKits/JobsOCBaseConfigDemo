//
//  NSString+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_FC61F43877
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_FC61F43877

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extra)
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl;
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
-(JobsRetStrByStrBlock _Nonnull)initByContentsOfFile;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_FC61F43877 */
