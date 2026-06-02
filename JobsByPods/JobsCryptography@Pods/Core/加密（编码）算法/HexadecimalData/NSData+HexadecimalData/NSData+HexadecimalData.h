//
//  NSData+HexadecimalData.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_HEXADECIMALDATA_86E22106D6
#define JOBS_HEADER_GUARD_NSDATA_HEXADECIMALDATA_86E22106D6

#import <Foundation/Foundation.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

@interface NSData (HexadecimalData)
#pragma mark —— NSData对象 ==> 16进制字符串
///【类方法】NSData对象  转换为  16进制字符串
+(JobsRetStrByDataBlock _Nonnull)hexStringByData;
///【实例方法】NSData对象  转换为  16进制字符串
-(NSString *_Nullable)hexStringByData;
#pragma mark —— 16进制字符串 ==> NSData对象
///【类方法】16进制字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByHexString;
///【实例方法】16进制字符串 转换为 NSData对象
-(JobsRetDataByStrBlock _Nonnull)dataByHexString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_HEXADECIMALDATA_86E22106D6 */
