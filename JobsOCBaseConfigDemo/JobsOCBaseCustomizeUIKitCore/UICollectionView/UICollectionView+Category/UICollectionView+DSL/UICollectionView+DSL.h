//
//  UICollectionView+DSL.h
//  JobsOCBaseConfigDemo
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

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (DSL)<UICollectionViewDSLProtocol>

-(JobsRetCollectionViewByLayoutBlock _Nonnull)byCollectionViewLayout;
-(JobsRetCollectionViewByFlowLayoutBlock _Nonnull)byCollectionViewFlowLayout;
-(JobsRetCollectionViewByIDBlock _Nonnull)byTarget;
-(JobsRetCollectionViewByNumberOfSectionsConfigBlock _Nonnull)byNumberOfSections;
-(JobsRetCollectionViewByNumberOfItemsInSectionConfigBlock _Nonnull)byNumberOfItemsInSection;
-(JobsRetCollectionViewByCellForItemAtConfigBlock _Nonnull)cellForItemAt;
-(JobsRetCollectionViewByDidSelectItemAtConfigBlock _Nonnull)didSelectItemAt;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEW_DSL_3D1FBB77CC */
