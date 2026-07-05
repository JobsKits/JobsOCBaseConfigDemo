//
//  NSData+HexadecimalData.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_HEXADECIMALDATA_86E22106D6
#define JOBS_HEADER_GUARD_NSDATA_HEXADECIMALDATA_86E22106D6

#import <Foundation/Foundation.h>

#import "JobsByOCPods.h"

#import "JobsLanMgr.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

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
