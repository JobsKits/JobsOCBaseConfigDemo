//
//  NSData+Base32.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_BASE32_723F428723
#define JOBS_HEADER_GUARD_NSDATA_BASE32_723F428723

#import <Foundation/Foundation.h>
#import "MF_Base32Codec.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Base32)
#pragma mark —— NSData ==> Base32
///【类方法】将NSData对象 转换为 以Base32编码的字符串
+(JobsRetStrByDataBlock _Nonnull)base32String;
///【实例方法】将NSData对象 转换为 以Base32编码的字符串
-(NSString *_Nullable)base32String;
#pragma mark —— Base32 ==> NSData
///【类方法】将Base32编码的字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataWithBase32String;
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(JobsRetDataByStrBlock _Nonnull)dataWithBase32String;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_BASE32_723F428723 */
