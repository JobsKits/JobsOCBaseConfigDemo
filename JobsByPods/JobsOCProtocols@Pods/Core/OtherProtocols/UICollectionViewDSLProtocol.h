//
//  UICollectionViewDSLProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWDSLPROTOCOL_0477CAF342
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWDSLPROTOCOL_0477CAF342

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@protocol UICollectionViewDSLProtocol <NSObject>
@optional
/// 核心属性
-(JobsRetCollectionViewByLayoutBlock _Nonnull)byCollectionViewLayout;
-(JobsRetCollectionViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetCollectionViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byPrefetchingEnabled;
-(JobsRetCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsRetCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byDragInteractionEnabled;
-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)byReorderingCadence;
-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation;
-(JobsRetCollectionViewByViewBlock _Nonnull)byBackgroundView;
/// 选择 / 编辑
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byEditing;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing;
/// Focus 相关
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)bySelectionFollowsFocus;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocus;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWDSLPROTOCOL_0477CAF342 */
