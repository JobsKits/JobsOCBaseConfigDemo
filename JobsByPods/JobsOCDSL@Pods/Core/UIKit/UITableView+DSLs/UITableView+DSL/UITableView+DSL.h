//
//  UITableView+DSL.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEW_DSL_07F87BFB47
#define JOBS_HEADER_GUARD_UITABLEVIEW_DSL_07F87BFB47

#import <UIKit/UIKit.h>

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

@interface UITableView (DSL)

-(JobsRetTableViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetTableViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetTableViewByTargetBlock _Nonnull)byTarget;
-(JobsRetTableViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(JobsRetTableViewByBOOLBlock _Nonnull)byPrefetchingEnabled;
-(JobsRetTableViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsRetTableViewByDropDelegateBlock _Nonnull)byDropDelegate;
/// 非正式协议 Block 化
-(JobsRetTableViewByNumberOfSectionsConfigBlock _Nonnull)byNumberOfSections;
-(JobsRetTableViewByNumberOfRowsInSectionConfigBlock _Nonnull)byNumberOfRowsInSection;
-(JobsRetTableViewByCellForRowAtConfigBlock _Nonnull)cellForRowAt;
-(JobsRetTableViewByDidSelectRowAtConfigBlock _Nonnull)didSelectRowAt;
#pragma mark —— Heights & Estimations
-(JobsRetTableViewByCGFloatBlock _Nonnull)byRowHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionFooterHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedRowHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionHeaderHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionFooterHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byFillerRowHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderTopPadding;
#pragma mark —— Separators & Insets
-(JobsRetTableViewByEdgeInsetsBlock _Nonnull)bySeparatorInset;
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorInsetReference;
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorStyle;
-(JobsRetTableViewByCorBlock _Nonnull)bySeparatorColor;
-(JobsRetTableViewByVisualEffectBlock _Nonnull)bySeparatorEffect;
#pragma mark —— Self-Sizing invalidation
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Background
-(JobsRetTableViewByViewBlock _Nonnull)byBackgroundView;
#pragma mark —— Appearance / Index
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySectionIndexMinimumDisplayRowCount;
-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexColor;
-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexBackgroundColor;
-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexTrackingBackgroundColor;
#pragma mark —— Layout behavior
-(JobsRetTableViewByBOOLBlock _Nonnull)byCellLayoutMarginsFollowReadableWidth;
-(JobsRetTableViewByBOOLBlock _Nonnull)byInsetsContentViewsToSafeArea;
#pragma mark —— Header / Footer views
-(JobsRetTableViewByViewBlock _Nonnull)byTableHeaderView;
-(JobsRetTableViewByViewBlock _Nonnull)byTableFooterView;
#pragma mark —— Editing / Selection
-(JobsRetTableViewByBOOLBlock _Nonnull)byEditing;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing;
#pragma mark —— Focus
-(JobsRetTableViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath;
-(JobsRetTableViewByBOOLBlock _Nonnull)bySelectionFollowsFocus;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocus;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing;
#pragma mark —— Drag & Drop
-(JobsRetTableViewByBOOLBlock _Nonnull)byDragInteractionEnabled;
#pragma mark —— Content Hugging Elements (iOS 18+)
#if defined(__IPHONE_18_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_18_0)
-(JobsRetTableViewByNSIntegerBlock _Nonnull)byContentHuggingElements
    API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos);
#endif

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEW_DSL_07F87BFB47 */
