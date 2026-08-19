//
//  UICollectionView+DSL.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEW_DSL_3D1FBB77CC
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEW_DSL_3D1FBB77CC

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

@interface UICollectionView (DSL)<UICollectionViewDSLProtocol>

-(JobsRetCollectionViewByLayoutBlock _Nonnull)byCollectionViewLayout;
-(JobsRetCollectionViewByFlowLayoutBlock _Nonnull)byCollectionViewFlowLayout;
-(JobsRetCollectionViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetCollectionViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetCollectionViewByIDBlock _Nonnull)byTarget;
-(JobsRetCollectionViewByNumberOfSectionsConfigBlock _Nonnull)byNumberOfSections;
-(JobsRetCollectionViewByNumberOfItemsInSectionConfigBlock _Nonnull)byNumberOfItemsInSection;
-(JobsRetCollectionViewByCellForItemAtConfigBlock _Nonnull)cellForItemAt;
-(JobsRetCollectionViewByDidSelectItemAtConfigBlock _Nonnull)didSelectItemAt;
-(JobsRetCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byPrefetchingEnabled;
-(JobsRetCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsRetCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byDragInteractionEnabled;
-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)byReorderingCadence;
-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation;
-(JobsRetCollectionViewByViewBlock _Nonnull)byBackgroundView;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byEditing;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)bySelectionFollowsFocus;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocus;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEW_DSL_3D1FBB77CC */
