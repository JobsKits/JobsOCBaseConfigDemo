//
//  NSData+Base64.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_BASE64_78B736316C
#define JOBS_HEADER_GUARD_NSDATA_BASE64_78B736316C

#import <Foundation/Foundation.h>

#import "JobsByOCPods.h"

#import "JobsBlock.h"

@interface NSData (Base64)
#pragma mark —— NSData ==> Base64
///【类方法】NSData 转换成 以Base64编码的字符串
+(JobsRetStrByDataBlock _Nonnull)base64StringFromData;
///【实例方法】NSData 转换成 以Base64编码的字符串
-(NSString *_Nullable)base64StringFromData;
#pragma mark —— Base64 ==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(JobsRetDataByStrBlock _Nonnull)dataByBase64String;
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(JobsRetDataByStrBlock _Nonnull)dataByBase64String;

@end
#endif /* JOBS_HEADER_GUARD_NSDATA_BASE64_78B736316C */
