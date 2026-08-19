//
//  NSString+Base64.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_BASE64_DC361D6A06
#define JOBS_HEADER_GUARD_NSSTRING_BASE64_DC361D6A06

#import <UIKit/UIKit.h>

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

@interface NSString (Base64)
#pragma mark —— Base64 <==> NSString
///【类方法】NSString对象 转换成  以Base64 编码的字符串
+(JobsRetStrByStrBlock _Nonnull)base64String;
///【实例方法】NSString对象 转换成  以Base64 编码的字符串
-(JobsRetStrByVoidBlock _Nonnull)base64String;
///【类方法】Base64 编码的字符串  转换成 NSString对象
+(JobsRetStrByStrBlock _Nonnull)nsStringByBase64;
///【实例方法】Base64 编码的字符串  转换成 NSString对象
-(JobsRetStrByVoidBlock _Nonnull)nsStringByBase64;
#pragma mark —— Base64 <==> UIImage
///【类方法】将以Base64编码的字符串 转换为 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByBase64String;
///【实例方法】将以Base64编码的字符串 转换为 UIImage对象
-(JobsRetImageByVoidBlock _Nonnull)imageByBase64String;
#pragma mark —— Base64 <==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(JobsRetDataByStrBlock _Nonnull)dataByBase64String;
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(JobsRetDataByVoidBlock _Nonnull)dataByBase64String;

@end
#endif /* JOBS_HEADER_GUARD_NSSTRING_BASE64_DC361D6A06 */
