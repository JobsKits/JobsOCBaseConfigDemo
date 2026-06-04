//
//  NSArray+Extra.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef NSArray_Extra_h
#define NSArray_Extra_h

#import <Foundation/Foundation.h>
#import <JobsModel/MasonryModel.h>

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

@interface NSArray (Extra)
#pragma mark —— Masonry 均匀分布的布局方式封装
/// 在指定的轴方向上，按照固定的间距分布多个视图。每个视图之间的间距是固定的，而不是视图本身的尺寸固定。
-(JobsRetArrByMasonryModelBlock _Nonnull)installByMasonryModel1;
/// 将一组视图沿某个方向（水平或垂直）等间距分布，视图的宽度（或高度）是固定的，且视图与容器的两端没有间隔。
-(JobsRetArrByMasonryModelBlock _Nonnull)installByMasonryModel2;
/// 数组取值（无法关联数组的泛型）
-(JobsRetIDByUIntegerBlock _Nonnull)objectAt;
/// 数组里面是否包含某个元素
-(JobsRetBOOLByIDBlock _Nonnull)containsObject;

@end

NS_ASSUME_NONNULL_END

#endif /* NSArray_Extra_h */
