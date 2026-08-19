//
//  NSString+Base32.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_BASE32_0511E68E17
#define JOBS_HEADER_GUARD_NSSTRING_BASE32_0511E68E17

#import <UIKit/UIKit.h>
#import <JobsCryptography/MF_Base32Codec.h>
#import <JobsCryptography/NSData+Base32.h>

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

@interface NSString (Base32)
#pragma mark —— Base32 <==> NSString
///【类方法】以Base32编码的字符串 转换为 普通的字符串
+(JobsRetStrByStrBlock _Nonnull)stringByBase32String;
///【实例方法】以Base32编码的字符串 转换为 普通的字符串
-(JobsRetStrByVoidBlock _Nonnull)stringByBase32String;
///【类方法】普通的字符串 转换为 以Base32编码的字符串
+(JobsRetStrByStrBlock _Nonnull)base32String;
///【实例方法】普通的字符串 转换为 以Base32编码的字符串
-(JobsRetStrByVoidBlock _Nonnull)base32String;
#pragma mark —— Base32 <==> UIImage
///【类方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
+(JobsRetImageByStrBlock _Nonnull)imageByBase32String;
///【实例方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
-(JobsRetImageByVoidBlock _Nonnull)imageByBase32String;
#pragma mark —— Base32 <==> NSData
/// 将Base32编码的字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataWithBase32String;
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(JobsRetDataByVoidBlock _Nonnull)dataWithBase32String;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_BASE32_0511E68E17 */
