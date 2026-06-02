//
//  NSMutableArray+Extra.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef NSMutableArray_Extra_h
#define NSMutableArray_Extra_h

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

@interface NSMutableArray (Extra)
/// 阻止向可变数组添加空元素
-(JobsRetMutableArrayByIDBlock _Nonnull)add;
/// 阻止向可变数组添加空元素
-(JobsRetIDByIDBlock _Nonnull)addBy;
/// 删除元素
-(JobsRetIDByIDBlock _Nonnull)remove;

@end

NS_ASSUME_NONNULL_END

#endif /* NSMutableArray_Extra_h */
