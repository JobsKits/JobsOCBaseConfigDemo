//
//  JobsWalletCollectionViewLayout.h
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JobsWalletCollectionViewLayout_h
#define JobsWalletCollectionViewLayout_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JobsWalletCardExpandStyle) {
    JobsWalletCardExpandStyleOnlySelected = 0,
    JobsWalletCardExpandStyleKeepOpened = 1
};

@interface JobsWalletCollectionViewLayout : UICollectionViewLayout

Prop_assign()CGFloat padding;
Prop_assign()CGFloat itemHeight;
Prop_assign()CGFloat overlapRatio;
Prop_assign()CGFloat expandedItemSpacing;
Prop_assign()CGFloat contentBottomSpacing;
Prop_assign()NSTimeInterval animationDuration;
Prop_assign()JobsWalletCardExpandStyle expandStyle;

-(jobsByIndexPathBlock _Nonnull)toggleIndexPath;
-(jobsByVoidBlock _Nonnull)expandAllIndexPaths;
-(jobsByVoidBlock _Nonnull)resetExpandedIndexPaths;
-(jobsByBOOLBlock _Nonnull)resetExpandedIndexPathsAnimated;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsWalletCollectionViewLayout
-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byExpandedItemSpacing;
-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byItemHeight;
-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byOverlapRatio;
-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byPadding;
-(JobsRetJobsWalletCollectionViewLayoutByCGSizeBlock _Nonnull)byCurrentContentSize;
-(JobsRetJobsWalletCollectionViewLayoutByJobsWalletCardExpandStyleBlock _Nonnull)byExpandStyle;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsWalletCollectionViewLayout
@end

NS_ASSUME_NONNULL_END

#endif /* JobsWalletCollectionViewLayout_h */
