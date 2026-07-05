//
//  ASStackLayoutSpec+DSL.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ASSTACKLAYOUTSPEC_DSL_256998E5FB
#define JOBS_HEADER_GUARD_ASSTACKLAYOUTSPEC_DSL_256998E5FB

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>

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

@interface ASStackLayoutSpec (DSL)

#pragma mark —— 方向 / 间距
-(JobsRetStackLayoutSpecByDirectionBlock _Nonnull)byDirection;
-(JobsRetStackLayoutSpecBySpacingBlock _Nonnull)bySpacing;
#pragma mark —— 语义对齐（推荐优先用这两个）
-(JobsRetStackLayoutSpecByHorizontalAlignmentBlock _Nonnull)byHorizontalAlignment;
-(JobsRetStackLayoutSpecByVerticalAlignmentBlock _Nonnull)byVerticalAlignment;
#pragma mark —— Flex 对齐（底层等价字段）
-(JobsRetStackLayoutSpecByJustifyContentBlock _Nonnull)byJustifyContent;
-(JobsRetStackLayoutSpecByAlignItemsBlock _Nonnull)byAlignItems;
-(JobsRetStackLayoutSpecByFlexWrapBlock _Nonnull)byFlexWrap;
-(JobsRetStackLayoutSpecByAlignContentBlock _Nonnull)byAlignContent;
-(JobsRetStackLayoutSpecByLineSpacingBlock _Nonnull)byLineSpacing;
#pragma mark —— 并发布局开关
-(JobsRetStackLayoutSpecByConcurrentBlock _Nonnull)byConcurrent;
#pragma mark —— children 管理
-(JobsRetStackLayoutSpecByChildrenBlock _Nonnull)byChildren;
-(JobsRetStackLayoutSpecByAppendChildrenBlock _Nonnull)byAppendChildren;
-(JobsRetStackLayoutSpecByAddChildBlock _Nonnull)byAdd;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASSTACKLAYOUTSPEC_DSL_256998E5FB */
