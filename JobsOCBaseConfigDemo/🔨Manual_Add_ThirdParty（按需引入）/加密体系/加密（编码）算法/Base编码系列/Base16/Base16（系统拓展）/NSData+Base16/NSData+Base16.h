//
//  NSData+Base16.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_BASE16_34263D1134
#define JOBS_HEADER_GUARD_NSDATA_BASE16_34263D1134

#import <Foundation/Foundation.h>

#import "JobsMakes.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Base16)
#pragma mark —— NSData ==> Base16
///【类方法】将NSData对象 转换为 以Base16（也称为十六进制）编码的字符串
+(JobsRetStrByDataBlock _Nonnull)base16StringByData;
///【实例方法】将NSData对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16StringByImage;
#pragma mark —— Base16 ==> NSData
///【类方法】将以Base16编码的字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByBase16String;
///【实例方法】将以Base16编码的字符串 转换为 NSData对象
-(JobsRetDataByStrBlock _Nonnull)dataByBase16String;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_BASE16_34263D1134 */
