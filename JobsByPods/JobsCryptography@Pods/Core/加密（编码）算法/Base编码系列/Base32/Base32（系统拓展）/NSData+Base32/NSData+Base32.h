//
//  NSData+Base32.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_BASE32_723F428723
#define JOBS_HEADER_GUARD_NSDATA_BASE32_723F428723

#import <Foundation/Foundation.h>
#import <JobsCryptography/MF_Base32Codec.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

@interface NSData (Base32)
#pragma mark —— NSData ==> Base32
///【类方法】将NSData对象 转换为 以Base32编码的字符串
+(JobsRetStrByDataBlock _Nonnull)base32String;
///【实例方法】将NSData对象 转换为 以Base32编码的字符串
-(JobsRetStrByVoidBlock _Nonnull)base32String;
#pragma mark —— Base32 ==> NSData
///【类方法】将Base32编码的字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataWithBase32String;
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(JobsRetDataByStrBlock _Nonnull)dataWithBase32String;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_BASE32_723F428723 */
