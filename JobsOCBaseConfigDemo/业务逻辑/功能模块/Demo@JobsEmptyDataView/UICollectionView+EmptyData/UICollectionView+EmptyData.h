//
//  UICollectionView+EmptyData.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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
/// 空数据监控机理：
/// 本分类在 `+load` 中把 `reloadData` 交换到 `jobsReloadData`。
/// 外部每次调用 `reloadData` 时，先执行系统原始刷新，再遍历 `numberOfSections`
/// 和 `numberOfItemsInSection:` 判断是否有真实数据。
/// 没有数据时按 `jobsEmptyViewType` 显示文字、按钮或自定义空态；有数据时清理空态视图。
/// 关联对象标记用于防止交换后的刷新流程递归进入。
@interface UICollectionView (EmptyData)

@end

NS_ASSUME_NONNULL_END
