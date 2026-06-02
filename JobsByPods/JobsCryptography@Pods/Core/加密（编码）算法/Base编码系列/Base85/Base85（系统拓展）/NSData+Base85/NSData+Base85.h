//
//  NSData+Base85.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_BASE85_5E5930A41B
#define JOBS_HEADER_GUARD_NSDATA_BASE85_5E5930A41B

#import <Foundation/Foundation.h>

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

@interface NSData (Base85)
#pragma mark —— NSData ==> Base85
///【类方法】将NSData对象 转换为 以Base85编码的字符串
+(JobsRetStrByDataBlock _Nonnull)dataToBase85String;
///【实例方法】将NSData对象 转换为 以Base85编码的字符串
-(NSString *_Nullable)dataToBase85String;
#pragma mark —— Base85 ==> NSData
///【类方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
+(JobsRetDataByStrBlock _Nonnull)dataByBase85String;
///【实例方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
-(JobsRetDataByStrBlock _Nonnull)dataByBase85String;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_BASE85_5E5930A41B */
