//
//  NSString+Extra.h
//  MJRefreshExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_672C1D441E
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_672C1D441E

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
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
/// 完整的文件名提取普通文件名和文件后缀名
-(JobsRetFileNameModelByFileFullNameStringBlock _Nonnull)byFileFullName;
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_672C1D441E */
