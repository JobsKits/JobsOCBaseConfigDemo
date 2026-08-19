//
//  NSMutableArray+Extra.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_AC3C599748
#define JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_AC3C599748

#pragma once

#import <Foundation/Foundation.h>
#import <JobsDeviceInfo/NSArray+Extra.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

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

@interface NSMutableArray (Extra)

+(JobsRetArrByArrBlock _Nonnull)initBy;
/// 清除数组元素
-(jobsByVoidBlock _Nonnull)clean;
/// 阻止向可变数组添加空元素
-(JobsRetMutableArrayByIDBlock _Nonnull)add;
/// 删除元素
-(JobsRetIDByIDBlock _Nonnull)remove;
/// 阻止向可变数组添加空元素
-(JobsRetMutableArrayByArrBlock _Nonnull)addBy;
/// 向数组加入一个从来没有没有过的元素，以保证数组元素的单一性
-(JobsRetIDByIDBlock _Nonnull)jobsAddSoleObject;
/// 将数组里的某个元素移动到原数组的某个位
-(__kindof NSArray *_Nullable)moveElementFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
/// 将数组里的元素复制times次
-(JobsRetArrByIntegerBlock _Nonnull)copyElementBytimes;
/// 改变输入的按钮状态
-(jobsByBtnBlock _Nonnull)chooseBy;
/// 监控选中状态
-(void)unselectBlock:(jobsByBtnBlock _Nullable)unselectBlock
         selectBlock:(jobsByBtnBlock _Nullable)selectBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_AC3C599748 */
