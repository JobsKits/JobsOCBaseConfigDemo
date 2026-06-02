//
//  NSCoder+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSCODER_EXTRA_5DD913DE63
#define JOBS_HEADER_GUARD_NSCODER_EXTRA_5DD913DE63

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSCoder (Extra)
/// 解档：字符串类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeStringBy;
/// 解档：UIImage类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeImageBy;
/// 解档：NSNumber类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeNumberBy;
/// 解档：BOOL值
-(JobsRetBOOLByStrBlock _Nonnull)decodeBOOLBy;
/// 解档：NSInteger值
-(JobsRetNSIntegerByStrBlock _Nonnull)decodeIntegerBy;
/// 解档：浮点数 (double) 数据
-(JobsRetDoubleByStrBlock _Nonnull)decodeDoubleBy;
/// 解档：字典类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeDictionaryBy;
/// 解档：数组类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeArrayBy;
/// 解档：NSData类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeDataBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSCODER_EXTRA_5DD913DE63 */
