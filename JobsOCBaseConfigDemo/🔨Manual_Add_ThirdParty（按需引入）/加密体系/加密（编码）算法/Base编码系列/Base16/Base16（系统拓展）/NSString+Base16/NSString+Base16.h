//
//  NSString+Base16.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_BASE16_FAC1F71F8C
#define JOBS_HEADER_GUARD_NSSTRING_BASE16_FAC1F71F8C

#import <UIKit/UIKit.h>

#import "JobsByOCPods.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Base16)
#pragma mark —— Base16 <==> NSString
///【类方法】将Base16字符串 转换回 原始的NSString对象
+(JobsRetStrByStrBlock _Nonnull)stringByBase16String;
///【实例方法】将Base16字符串 转换回 原始的NSString对象
-(NSString *_Nullable)stringByBase16String;
///【类方法】将普通的NSString字符串对象 转换为 以Base16（也称为十六进制）编码的字符串
+(JobsRetStrByStrBlock _Nonnull)base16StringByImage;
///【实例方法】将普通的NSString字符串对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16StringByImage;
#pragma mark —— Base16 <==> UIImage
///【类方法】将以Base16编码的字符串 转换为 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByBase16String;
///【实例方法】将以Base16编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase16String;
#pragma mark —— Base16 <==> NSData
///【类方法】将以Base16编码的字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataWithBase16String;
///【实例方法】将以Base16编码的字符串 转换为 NSData对象
-(NSData *_Nullable)dataWithBase16String;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_BASE16_FAC1F71F8C */
