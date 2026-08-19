//
//  NSData+Base64.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_BASE64_78B736316C
#define JOBS_HEADER_GUARD_NSDATA_BASE64_78B736316C

#import <Foundation/Foundation.h>

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

@interface NSData (Base64)
#pragma mark —— NSData ==> Base64
///【类方法】NSData 转换成 以Base64编码的字符串
+(JobsRetStrByDataBlock _Nonnull)base64StringFromData;
///【实例方法】NSData 转换成 以Base64编码的字符串
-(JobsRetStrByVoidBlock _Nonnull)base64StringFromData;
#pragma mark —— Base64 ==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(JobsRetDataByStrBlock _Nonnull)dataByBase64String;
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(JobsRetDataByStrBlock _Nonnull)dataByBase64String;

@end
#endif /* JOBS_HEADER_GUARD_NSDATA_BASE64_78B736316C */
