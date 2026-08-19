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
#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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
