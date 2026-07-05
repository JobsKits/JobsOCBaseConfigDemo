//
//  NSMutableArray+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_35E40290DE
#define JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_35E40290DE

#pragma once

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Extra)
/// 通过数组创建可变数组
+(JobsRetArrByArrBlock _Nonnull)initBy;
/// 清除数组元素
-(jobsByVoidBlock _Nonnull)clean;
/// 阻止向可变数组添加空元素
-(JobsRetMutableArrayByIDBlock _Nonnull)add;
/// 删除元素
-(JobsRetIDByIDBlock _Nonnull)remove;
/// 批量追加数组元素
-(JobsRetIDByIDBlock _Nonnull)addBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_35E40290DE */
