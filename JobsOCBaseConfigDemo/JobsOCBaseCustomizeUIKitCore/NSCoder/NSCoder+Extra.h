//
//  NSCoder+Extra.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef NSCoder_Extra_h
#define NSCoder_Extra_h

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

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

#endif /* NSCoder_Extra_h */
