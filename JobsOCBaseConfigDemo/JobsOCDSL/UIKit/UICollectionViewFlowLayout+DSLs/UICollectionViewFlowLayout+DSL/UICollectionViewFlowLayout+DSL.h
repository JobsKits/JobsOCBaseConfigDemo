//
//  UICollectionViewFlowLayout+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_DSL_6F5A12E9
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_DSL_6F5A12E9

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewFlowLayout (DSL)

#pragma mark —— Factory
+(JobsRetCollectionViewFlowLayoutByVoidBlock _Nonnull)byCollectionViewFlowLayout;

#pragma mark —— Layout Metrics
-(JobsRetCollectionViewFlowLayoutByCGFloatBlock _Nonnull)byMinimumLineSpacing;
-(JobsRetCollectionViewFlowLayoutByCGFloatBlock _Nonnull)byMinimumInteritemSpacing;
-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byItemSize;
-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byEstimatedItemSize;
-(JobsRetCollectionViewFlowLayoutByUICollectionViewScrollDirectionBlock _Nonnull)byScrollDirection;
-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byHeaderReferenceSize;
-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byFooterReferenceSize;
-(JobsRetCollectionViewFlowLayoutByUIEdgeInsetsBlock _Nonnull)bySectionInset;
-(JobsRetCollectionViewFlowLayoutByBOOLBlock _Nonnull)bySectionHeadersPinToVisibleBounds API_AVAILABLE(ios(9.0));
-(JobsRetCollectionViewFlowLayoutByBOOLBlock _Nonnull)bySectionFootersPinToVisibleBounds API_AVAILABLE(ios(9.0));
-(JobsRetCollectionViewFlowLayoutByUICollectionViewFlowLayoutSectionInsetReferenceBlock _Nonnull)bySectionInsetReference API_AVAILABLE(ios(11.0), tvos(11.0));

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_DSL_6F5A12E9 */
