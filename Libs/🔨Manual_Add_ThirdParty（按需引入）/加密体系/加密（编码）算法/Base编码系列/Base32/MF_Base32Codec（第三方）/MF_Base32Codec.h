//
//  MF_Base32Codec.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MF_BASE32CODEC_2B8798B2BE
#define JOBS_HEADER_GUARD_MF_BASE32CODEC_2B8798B2BE

#import <Foundation/Foundation.h>

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface MF_Base32Codec : NSObject
/// 将Base32编码的字符串转换为NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataFromBase32String;
/// 将NSData对象转换为Base32编码的字符串
+(JobsRetStrByDataBlock _Nonnull)base32StringFromData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MF_BASE32CODEC_2B8798B2BE */
