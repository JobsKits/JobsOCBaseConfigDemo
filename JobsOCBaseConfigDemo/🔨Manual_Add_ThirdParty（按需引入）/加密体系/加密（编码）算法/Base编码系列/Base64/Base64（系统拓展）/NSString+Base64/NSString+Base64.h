//
//  NSString+Base64.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_BASE64_DC361D6A06
#define JOBS_HEADER_GUARD_NSSTRING_BASE64_DC361D6A06

#import <UIKit/UIKit.h>

#import "JobsByOCPods.h"

#import "JobsBlock.h"

@interface NSString (Base64)
#pragma mark —— Base64 <==> NSString
///【类方法】NSString对象 转换成  以Base64 编码的字符串
+(JobsRetStrByStrBlock _Nonnull)base64String;
///【实例方法】NSString对象 转换成  以Base64 编码的字符串
-(NSString *_Nullable)base64String;
///【类方法】Base64 编码的字符串  转换成 NSString对象
+(JobsRetStrByStrBlock _Nonnull)nsStringByBase64;
///【实例方法】Base64 编码的字符串  转换成 NSString对象
-(NSString *_Nullable)nsStringByBase64;
#pragma mark —— Base64 <==> UIImage
///【类方法】将以Base64编码的字符串 转换为 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByBase64String;
///【实例方法】将以Base64编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase64String;
#pragma mark —— Base64 <==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(JobsRetDataByStrBlock _Nonnull)dataByBase64String;
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(NSData *_Nullable)dataByBase64String;

@end
#endif /* JOBS_HEADER_GUARD_NSSTRING_BASE64_DC361D6A06 */
