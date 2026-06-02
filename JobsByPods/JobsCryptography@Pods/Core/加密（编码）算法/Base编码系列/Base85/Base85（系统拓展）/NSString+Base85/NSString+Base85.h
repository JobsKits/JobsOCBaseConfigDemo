//
//  NSString+Base85.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_BASE85_3C6851142C
#define JOBS_HEADER_GUARD_NSSTRING_BASE85_3C6851142C

#import <UIKit/UIKit.h>
#import <JobsCryptography/NSData+Base85.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Base85)
#pragma mark —— Base85 <==> NSString
///【类方法】普通的NSString对象 转换成 以Base85编码的字符串
+(JobsRetStrByStrBlock _Nonnull)base85String;
///【实例方法】普通的NSString对象 转换成 以Base85编码的字符串
-(NSString *_Nullable)base85String;
///【类方法】以Base85编码的字符串 转换成 普通的NSString对象
+(JobsRetStrByStrBlock _Nonnull)stringByBase85String;
///【实例方法】以Base85编码的字符串 转换成 普通的NSString对象
-(NSString *_Nullable)stringByBase85String;
#pragma mark —— Base85 ==> NSData
///【类方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
+(JobsRetDataByStrBlock _Nonnull)dataByBase85String;
///【实例方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
-(NSData *_Nullable)dataByBase85String;
#pragma mark —— Base85 ==> UIImage
///【类方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByBase85String;
///【实例方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
-(UIImage *_Nullable)imageByBase85String;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_BASE85_3C6851142C */
